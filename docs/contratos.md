# Contratos compartidos

Fuente única de las interfaces entre partes del sistema. Cambiar algo aquí exige
PR propio, aviso al equipo y `docs/cambios/CC-XX.md` (ver `AGENTS.md`).

Responsable: <nombre> · Última revisión: <AAAA-MM-DD>

## Entidades compartidas
| Entidad (de `dominio.md`) | Campos | Tipo | Obligatorio | Notas |
| --- | --- | --- | --- | --- |
| <Entidad> | <campo> | <tipo> | sí/no | <...> |

## Interfaces (API / eventos / módulos)
### <nombre de la operación>
- Tipo: <HTTP / evento / función>
- Ruta o nombre: <...>
- Entrada: <esquema>
- Salida: <esquema>
- Errores: <código → significado>
- Usado por: <CU-XX>
- Responsable: <nombre>

## Convenciones
- Formato de fechas: <...>
- Identificadores: <...>
- Errores: <...>
