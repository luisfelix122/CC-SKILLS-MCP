# Contexto de CosteARTE para trabajar en VS Code

## Objetivo
Reto 17 de la hackatón: vitrina digital para pequeños artesanos de las playas del norte. La Vaca Loca Tours busca facilitar la incorporación del vendedor, la digitalización del producto mediante foto y descripción hablada o escrita, la venta, el pago y la coordinación del despacho.
La entrevista con Daniela destaca el acompañamiento presencial, la colaboración mediante asociaciones y la sostenibilidad de la plataforma: cómo atraer compradores y mantener la operación.
Esta síntesis orienta el trabajo; el detalle del reto y la entrevista permanece en `docs/reto-17/README.md` y `docs/reto-17/entrevista-daniela-acuna.md` del repositorio.

## Estado del repositorio leído
Repositorio: `CC-SKILLS-MCP`. La documentación de proyecto, dominio, plan y contratos estaba todavía en forma de plantilla cuando se revisó. No se debe asumir un stack, una aplicación implementada ni una base de datos operativa. Verificar el estado actual antes de trabajar.
Leer `AGENTS.md` y sus reglas de alcance por PRP. Este paquete aporta datos y contexto; no aprueba cambios de producto o contratos.

## Fuente y alcance de los datos
Origen: `Sectorizado total ACTUALIZADO VISITA.xlsx`, hoja DATA TOTAL. La tabla Table_2 del libro apunta a un resumen auxiliar y NO a las encuestas.
Se conservan 188 filas con fecha válida; 116 corresponden a Actividad = Artesano. Fechas de encuesta: septiembre de 2025 a marzo de 2026.
Los JSON son una instantánea derivada del mismo modelo preparado para Power BI. No se actualizan solos cuando cambia el Excel.
El modelo analítico omite nombres personales. No hay teléfonos, emails, asociaciones, productos, imágenes, coordenadas, compras, pedidos ni pagos en estos JSON.

## Archivos que se deben leer
- `datos/esquema.json`: tablas, campos, tipos y relaciones.
- `DICCIONARIO.md`: significado de los campos y reglas de interpretación.
- `datos/controles.json`: conteos para comprobar los cálculos del segmento Artesano.
- `datos/encuestas.json`: 188 encuestas completas; filtrar Actividad = Artesano cuando corresponda al reto.
- `datos/zonas.json`: provincia y localidad de origen normalizadas sin inferir geografía.
- `datos/registros_declarados.json`: múltiples registros declarados por encuesta.
- `datos/calendario.json`: fechas del levantamiento de campo.
- `medidas_powerbi.dax`: medidas del reporte, para estudiar o adaptar en Power BI.

## Reglas esenciales
1. IdEncuesta es la fila del Excel original. No es un DNI ni un identificador estable de persona. Si se reordena el origen puede cambiar.
2. No deduplicar encuestas por nombre, edad o localidad; no afirmar que hay 116 personas únicas.
3. IngresoTurismo es un importe mensual autodeclarado utilizable según la regla conservadora. null significa ausente o ambiguo. Cero explícito se conserva.
4. No convertir rangos, montos anuales, mínimos, aproximaciones o narrativas a un importe mensual inventado. Consultar IngresoTurismoOriginal y EstadoIngreso.
5. Mostrar la cantidad y el porcentaje de respuestas utilizables junto con la mediana o el promedio.
6. RecibioCapacitacion no demuestra dominio digital. ImpactoCapacitacion solo se interpreta entre quienes respondieron Sí; ImpactoOriginal conserva la respuesta de origen.
7. MencionaRUC y MencionaRNA reflejan menciones, no consultas ni verificaciones oficiales. No mencionado no significa que carezca de registro.
8. RegistrosDeclarados tiene respuestas múltiples. Contar IdEncuesta distintos por categoría y no sumar las categorías para obtener el total de encuestas.
9. La fecha de encuesta no es fecha de venta. No crear una serie temporal de ventas o de ingresos usando esa fecha.
10. Revisar ProvinciaOriginal, LocalidadOriginal y Revision; no corregir Paitacasa ni dividir localidades combinadas por suposición.

## Uso práctico
Para estudiar perfiles y seleccionar el piloto, usar Encuestas con el segmento Artesano, cruzada con zonas y calendario.
Para desarrollar la vitrina se deben definir y capturar nuevas entidades: Artesano con identificador estable, Producto, Pedido, DetallePedido, Pago, Despacho y eventos de visitas con origen. Son propuestas de diseño pendientes, no tablas existentes ni contratos aprobados.
El panel de Power BI tiene cuatro páginas: Diagnóstico del piloto, Acompañamiento y acreditación, Situación económica inicial y Calidad de los datos. El proyecto editable se entrega por separado en CosteARTE_PowerBI.zip.

## Comprobaciones iniciales
Segmento Artesano: 116 encuestas, 103 mujeres, 97 capacitados, 78 trabajando, 38 sin registro declarado, 52 mencionan RUC, 14 mencionan RNA.
Ingresos: 73 utilizables, 32 por revisar, 11 no informados. Mediana de utilizables: S/ 500, incluidos ceros explícitos.
Son controles del corte recibido, no metas de negocio ni métricas de ventas de la plataforma.
