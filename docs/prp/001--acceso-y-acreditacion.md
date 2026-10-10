# PRP 001 — Acceso con Google y acreditación RNA

- Caso de uso: CU-01 (`docs/plan.md`)
- Responsable: Cristopher · Revisor: <por asignar> + subagente `reviewer`
- Estado: listo
- Rama: `cu-01/acceso-acreditacion`

## Objetivo
Tres actores pueden entrar y quedan con su perfil y permisos correctos:
- **Comprador:** entra a la web con Google.
- **Artesano:** entra a la APK con Google, completa su perfil (WhatsApp, lugar, asociación, historia, número RNA) y queda con la acreditación `pendiente`.
- **Administrador:** en `/admin` de la web, ve las solicitudes pendientes y las aprueba o rechaza con una nota.

## Por qué
Es el criterio 1 del reto: el vendedor queda acreditado con validación básica de confianza. Sin acreditación no se publica (regla 1 de `docs/dominio.md`).

## Criterios de aceptación
- [ ] En la web, «Continuar con Google» crea un `perfil` con `rol = comprador`. En la APK, crea uno con `rol = artesano` y `acreditacion = pendiente`.
- [ ] En la APK, el login abre el navegador del sistema y **vuelve a la app** con la sesión iniciada, en un Android real.
- [ ] Un usuario **no puede** asignarse `rol = admin` ni cambiar su propia `acreditacion`: el intento falla con un error de RLS o de trigger. Hay una prueba que lo verifica.
- [ ] El artesano no puede enviar su solicitud sin `whatsapp` (E.164), `lugar` (de la lista) ni `rna_numero`.
- [ ] El administrador aprueba o rechaza y el cambio se refleja en la APK al recargar. Un usuario que no es admin recibe un error al intentarlo.
- [ ] El visitante anónimo solo puede leer los campos públicos de los artesanos `aprobada`.
- [ ] La sesión persiste al cerrar y reabrir la APK, también sin conexión: muestra la sesión guardada.

## Contexto necesario
- **Dominio:** Perfil, RNA, Acreditación, Lugar, Asociación; estados de Acreditación.
- **Contratos:** `docs/contratos.md` §`perfil`, §Permisos (RLS), §Convenciones (lugares, variables).
- **Decisiones:** `0001-stack.md` (login con Google por deep link), `CC-01.md`.
- **Código existente a imitar:** `src/compartido/supabase.ts` (PRP 000).
- **Documentación externa:**
  - https://supabase.com/docs/guides/auth/social-login/auth-google: cliente OAuth *Web application*, scopes básicos, `signInWithOAuth`.
  - https://supabase.com/docs/guides/auth/native-mobile-deep-linking: scheme, "Additional Redirect URLs", `intent-filter`.
  - https://capacitorjs.com/docs/apis/app (`appUrlOpen`) y https://capacitorjs.com/docs/apis/browser.
- **Trampas conocidas:**
  - **Login en la APK:** usar `flowType: 'pkce'` y `signInWithOAuth({ provider: 'google', options: { redirectTo: 'pe.costearte.artesano://auth', skipBrowserRedirect: true } })`. Abrir `data.url` con `Browser.open` y, en `appUrlOpen`, llamar a `exchangeCodeForSession(code)` y luego a `Browser.close()`. **No verificado con Capacitor:** si en el dispositivo no vuelve a la app, detenerse y avisar antes de buscar alternativas.
  - **Google bloquea el OAuth dentro de un WebView embebido.** Por eso se usa el navegador del sistema (`@capacitor/browser`).
  - **Seguridad de `upsert`:** sin un trigger, un cliente podría enviar `rol: 'admin'`. El trigger `proteger_perfil` debe impedir cambiar `rol` y `acreditacion` salvo que lo haga un admin.
  - **Usuarios de prueba:** si la app de Google queda en modo de prueba, registrar las cuentas de la demo como usuarios de prueba en Google Auth Platform.
  - **Crear el admin:** `update perfil set rol = 'admin' where id = '<uuid>'` en el SQL Editor. **No** va en las migraciones.

## Archivos (alcance cerrado)
| Acción | Ruta | Responsabilidad |
| --- | --- | --- |
| crear | `supabase/migrations/0001_perfil.sql` | tipos `rol` y `acreditacion`; tabla `perfil`; RLS; trigger `proteger_perfil`; vista `artesano_publico`; función `es_artesano_aprobado(uuid)` |
| crear | `supabase/tests/perfil.test.sql` | pgTAP: autoasignarse admin falla, anónimo solo ve aprobados, admin aprueba |
| crear | `src/compartido/dominio/lugares.ts` | lista de lugares preliminar de `contratos.md` |
| crear | `src/acceso/sesion.ts` | login web y APK (deep link), cierre de sesión, sesión actual |
| crear | `src/acceso/perfil.ts` | leer y `upsert` el perfil; validar los datos del artesano |
| crear | `src/acceso/perfil.test.ts` | validaciones (E.164, lugar, RNA obligatorio) |
| crear | `src/acceso/PantallaIngreso.tsx` | botón «Continuar con Google» |
| crear | `src/acceso/CompletarPerfil.tsx` | formulario del artesano (APK) |
| crear | `src/acceso/EstadoAcreditacion.tsx` | aviso pendiente / aprobada / rechazada con su nota |
| crear | `src/admin/PanelAcreditacion.tsx` | lista de pendientes con botones Aprobar y Rechazar |
| modificar | `src/app/AppWeb.tsx`, `src/app/AppArtesano.tsx` | rutas protegidas |
| modificar | `android/app/src/main/AndroidManifest.xml` | `intent-filter` del scheme `pe.costearte.artesano` |

Cualquier archivo fuera de esta tabla requiere aprobación del responsable.

## Tareas (en orden)
1. Escribir la migración y las pruebas pgTAP. Aplicarlas con `supabase db push` (o en local con `supabase db reset`) — `supabase/migrations/0001_perfil.sql`, `supabase/tests/perfil.test.sql`.
2. Configurar Google en Google Cloud y Supabase: Client ID y Secret en el dashboard, redirect URL `pe.costearte.artesano://auth` y la URL de Vercel. Es un paso manual de Cristopher. No se commitean valores.
3. Crear `sesion.ts` y `PantallaIngreso` para la web y la APK.
4. Agregar el `intent-filter` al manifiesto y probar el regreso a la app en el Android.
5. Crear `perfil.ts` con sus validaciones y pruebas, más `CompletarPerfil` y `EstadoAcreditacion`.
6. Crear `PanelAcreditacion` en `/admin`, visible solo con `rol = admin`.

## Validación
1. `make verify`. Además, `supabase test db` si hay una instancia local de Supabase (Docker); si no, ejecutar las pruebas pgTAP contra el proyecto remoto de desarrollo.
2. **Pruebas a crear:**
   - Caso feliz: un perfil válido se guarda.
   - Error: WhatsApp sin `+51`, un lugar fuera de la lista o sin RNA.
   - Borde: autoasignarse admin o aprobarse a sí mismo.
3. **Prueba manual:**
   - Entrar a la APK en el Android → completar el perfil → ver «pendiente».
   - Entrar a la web como admin → aprobar → recargar la APK → ver «aprobada».

## Fuera de alcance
- Consulta automática del RNA.
- Asociaciones con gestión propia y líderes.
- Preferencias del comprador.
- Login con correo.

## Notas / riesgos
- Si el deep link falla en el dispositivo, es bloqueante para la demo del artesano. Avisar de inmediato.
