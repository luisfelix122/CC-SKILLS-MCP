# PRP 009 — Proxy de IA con LiteLLM en el servidor

- Caso de uso: CU-09 (`docs/plan.md`, infraestructura de CU-03 y CU-08)
- Responsable: Cristopher · Revisor: <por asignar> + subagente `reviewer`
- Estado: **bloqueado** — faltan los datos de acceso del dueño del servidor (ver Notas)
- Rama: `cu-09/proxy-ia-litellm`

## Objetivo
LiteLLM Proxy corre en Docker en el servidor del equipo y arranca solo al reiniciar. Responde por HTTPS en `https://<subdominio>/v1/chat/completions` a través de Cloudflare Tunnel y solo con la clave maestra. Reparte las llamadas de los alias `costearte-texto` y `costearte-audio` entre varias llaves y cambia de llave si una falla.

## Por qué
Es la decisión `0002-proxy-ia-litellm.md` (CC-02): repartir la carga y tener respaldo entre llaves ante límites de uso.

## Criterios de aceptación
- [ ] `infra/litellm/` contiene `docker-compose.yml`, `config.yaml`, `.env.example` (solo nombres) y `README.md` (instalación, operación y rotación de llaves). Ningún archivo del repositorio contiene valores secretos.
- [ ] En el servidor: `docker compose up -d` deja el contenedor `litellm` con `restart: unless-stopped`, la imagen fijada a una versión (no `latest`) y el puerto 4000 publicado **solo en `127.0.0.1`**.
- [ ] El túnel de Cloudflare enruta `https://<subdominio>` a `http://localhost:4000`.
- [ ] Una llamada sin `Authorization` devuelve 401. Con la clave maestra, `POST /v1/chat/completions` con el modelo `costearte-texto` devuelve 200.
- [ ] Con una llave inválida en la lista, las llamadas siguen respondiendo 200 porque usan las demás. Queda evidencia en el log del contenedor.
- [ ] Una llamada a `costearte-audio` con un audio corto en base64 devuelve la transcripción.
- [ ] Tras reiniciar el servidor, el proxy y el túnel vuelven a funcionar sin intervención.
- [ ] La interfaz de administración de LiteLLM no es accesible desde internet.

## Contexto necesario
- **Dominio:** no aplica.
- **Contratos:** `docs/contratos.md` §Proxy de IA y §Convenciones (variables).
- **Decisiones:** `0002-proxy-ia-litellm.md`, `CC-02.md`.
- **Código existente a imitar:** ninguno.
- **Documentación externa:**
  - https://docs.litellm.ai/docs/proxy/docker_quick_start: `--config /app/config.yaml`, puerto 4000, `api_key: os.environ/...`, autenticación con la clave maestra, `/v1/chat/completions`.
  - https://docs.litellm.ai/docs/proxy/deploy: fijar la versión de la imagen; sin Postgres, la autenticación usa solo la clave maestra; Redis solo con más de una instancia.
  - https://docs.litellm.ai/docs/routing: varias deployments con el mismo `model_name`; `routing_strategy: simple-shuffle`; `num_retries`; cooldown ante 429 (`allowed_fails`, `cooldown_time`).
  - https://docs.litellm.ai/docs/providers/openrouter: prefijo `openrouter/`, `OPENROUTER_API_KEY`.
  - https://docs.litellm.ai/docs/providers/gemini: prefijo `gemini/`, `GEMINI_API_KEY`, audio como bloque `file` con data URI base64.
  - https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/: Cloudflare Tunnel. **No lo he leído todavía:** revisarlo al ejecutar.
- **Trampas conocidas:**
  - **Acceso remoto:** se trabaja solo en el servidor autorizado, por Tailscale SSH, con el usuario que indique el dueño. No reutilizar otras sesiones ni credenciales.
  - **Llaves:** el dueño las escribe en `/opt/costearte-ia/.env`. El agente nunca las lee, las imprime ni las copia: para verificar, usa `docker compose config --quiet` y las respuestas HTTP.
  - **Puertos:** publicar `127.0.0.1:4000:4000` para que solo el túnel llegue al proxy.
  - **Proveedor de las llaves:** varias llaves de **una misma** cuenta de OpenRouter no aumentan el límite. El reparto solo aporta si las llaves son de cuentas o proyectos distintos.
  - **Restricción oficial:** si se usan llaves de Gemini directo, confirmar antes con los organizadores.
  - **Prefijo de rutas:** la imagen oficial publica `/v1/...`; el cliente (PRP 003) debe usar exactamente `${IA_BASE_URL}/v1/chat/completions`.

## Archivos (alcance cerrado)
| Acción | Ruta | Responsabilidad |
| --- | --- | --- |
| crear | `infra/litellm/docker-compose.yml` | servicio `litellm` (imagen fijada, `--config`, `env_file: .env`, `127.0.0.1:4000`, `restart: unless-stopped`) |
| crear | `infra/litellm/config.yaml` | `model_list` con los alias `costearte-texto` y `costearte-audio` (una deployment por llave); `router_settings` (`simple-shuffle`, reintentos, cooldown) |
| crear | `infra/litellm/.env.example` | `LITELLM_MASTER_KEY=`, `IA_KEY_1=`, `IA_KEY_2=`, … sin valores |
| crear | `infra/litellm/README.md` | instalación en el servidor, túnel, verificación con curl, rotación de llaves y apagado |
| crear (servidor) | `/opt/costearte-ia/` | copia de `docker-compose.yml` y `config.yaml`, más el `.env` real (lo llena el dueño) |
| modificar (servidor) | configuración de `cloudflared` | ruta del subdominio a `http://localhost:4000` |

Cualquier archivo fuera de esta tabla requiere aprobación del responsable.

## Tareas (en orden)
1. Recibir los datos de Notas y conectarse por Tailscale SSH: `cat /etc/os-release`, `docker --version`, `docker compose version`, puertos libres.
2. Escribir los archivos de `infra/litellm/` según el proveedor y los modelos confirmados.
3. Instalar Docker si falta, siguiendo la guía oficial de la distribución. Copiar los archivos a `/opt/costearte-ia`. El dueño llena el `.env`.
4. `docker compose up -d`; probar con curl desde el servidor (`localhost:4000`).
5. Agregar la ruta del túnel de Cloudflare. Probar desde esta computadora contra `https://<subdominio>`: sin la clave → 401; con la clave → 200.
6. Probar con una llave inválida, la ruta de audio y un reinicio.
7. Entregar a Cristopher los valores que van en Supabase. Él ejecuta `supabase secrets set IA_BASE_URL=https://<subdominio> IA_API_KEY=<clave maestra> IA_TIMEOUT_MS=8000`; el agente no los ve.

## Validación
1. `make verify`: no hay código TS en este PRP, pero `prettier --check` cubre YAML y Markdown.
2. **Pruebas a crear:** no hay pruebas automáticas; la verificación son las llamadas HTTP de los criterios, con salida resumida (código de estado, sin llaves).
3. **Prueba manual:** los pasos 4–6 de Tareas, anotando los resultados en `docs/traspasos/CU-09-cristopher.md`.

## Fuera de alcance
- Postgres, interfaz de LiteLLM, claves virtuales y seguimiento de gasto.
- Más de una instancia (Redis).
- Edición de imágenes a través del proxy: va directo a OpenRouter.

## Notas / riesgos
**Datos pendientes del dueño del servidor** (prompt enviado; ver la conversación del 2026-10-10):
1. Nombre o IP del servidor en Tailscale, usuario con sudo y modo de SSH. Además, **Tailscale instalado en esta computadora** y unido al tailnet.
2. Distribución de Linux, Docker y puertos 4000/8080.
3. Subdominio y si ya existe un túnel de `cloudflared`.
4. Proveedor de las llaves (OpenRouter o Gemini directo), cantidad, si son de cuentas distintas, y los modelos.
5. Confirmación de que el servidor queda encendido durante el evento.

**Autorización:** el dueño autorizó «lo que quieras» en su servidor para este despliegue. El destino concreto (host y usuario) aún no está definido.
