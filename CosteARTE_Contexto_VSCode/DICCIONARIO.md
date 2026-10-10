# Diccionario de datos

## Encuestas

| Campo | Tipo JSON | Significado |
|---|---|---|
| IdEncuesta | integer | Fila del Excel de origen; identifica una encuesta, no una persona. |
| FechaEncuesta | string (fecha ISO) | Fecha de levantamiento, en ISO YYYY-MM-DD; no fecha de transacción. |
| IdZona | string | Clave de provincia y localidad normalizadas, separadas por |. |
| ProvinciaOriginal | string | Provincia declarada, con espacios normalizados; sirve para trazabilidad. |
| LocalidadOriginal | string | Localidad declarada; no necesariamente equivale a distrito oficial. |
| Sexo | string | Sexo declarado; no inferir desde nombres. |
| Edad | integer | Edad declarada en años. |
| RangoEdad | string | Agrupación de edad: 18–29, 30–44, 45–59, 60+ o Sin respuesta. |
| EstadoCivil | string | Respuesta declarada del formulario; consultar el encabezado original del Excel. |
| NivelEducativo | string | Respuesta declarada del formulario; consultar el encabezado original del Excel. |
| RecibioCapacitacion | string | Sí/No/Sin respuesta a capacitación en los últimos cinco años. |
| TemaCapacitacionOriginal | string | Texto abierto sobre tema y duración de capacitación. |
| TuvoIngresos | string | Respuesta sobre ingresos de algún trabajo en los últimos 12 meses. |
| IngresoGeneralOriginal | string | Respuesta abierta sobre ingreso general. No está convertida a número. |
| Actividad | string | Categoría declarada: Artesano, Restaurante, Transportista o Servicio de playa. |
| TrabajaActualmente | string | Situación de trabajo actual declarada. |
| TipoOcupacion | string | Dependiente/Independiente/Sin respuesta; no certifica formalidad. |
| RegistrosOriginal | string | Texto original de registros del negocio; admite múltiples opciones. |
| TieneTrabajadores | string | Trabajadores permanentes a cargo declarados. |
| Contrato | string | Respuesta sobre contrato; aplica de modo distinto a dependientes y empleadores. |
| BeneficiosOriginal | string | Texto de beneficios; distinguir beneficios propios de beneficios del personal. |
| IngresoTurismoOriginal | string | Respuesta fuente sobre promedio mensual del trabajo relacionado con turismo. |
| IngresoTurismo | number | Importe numérico utilizable. null no es 0. No equivale a ventas de CosteARTE. |
| EstadoIngreso | string | Número original, Texto convertido, Cero declarado, Revisar respuesta o No informado. |
| RangoIngreso | string | Rango calculado a partir del importe utilizable; conserva el grupo 0 declarado. |
| AniosEstudioOriginal | string | Respuesta abierta sobre años de educación técnica o universitaria. |
| ImpactoOriginal | string | Respuesta original de mejora de ingresos percibida por capacitación. |
| ImpactoCapacitacion | string | Impacto normalizado solo cuando capacitación es Sí; de otro modo No aplica. |
| OcupacionOriginal | string | Trabajo u ocupación declarados en texto abierto. |
| DisponibilidadOriginal | string | Respuesta complementaria del formulario; no convertir automáticamente en estado laboral. |
| MencionaRUC | string | Sí/No mencionado según el texto de registros. Sin verificación oficial. |
| MencionaRNA | string | Sí/No mencionado según el texto de registros. Sin verificación oficial. |
| SinRegistroDeclarado | string | Sí si la respuesta dice explícitamente que no cuenta con ningún registro. |
| Revision | string | Incidencias detectadas: ingreso ambiguo, provincia por validar, o impacto respondido sin capacitación. |

## Relaciones

- zonas.IdZona (1) → encuestas.IdZona (*).
- calendario.Fecha (1) → encuestas.FechaEncuesta (*).
- encuestas.IdEncuesta (1) → registros_declarados.IdEncuesta (*).

## Regla de ingresos

Se aceptan números originales no negativos y texto que, al quitar solo unidades conocidas, queda como un número entero o con hasta dos decimales. No se interpretan separadores de miles ni se extraen números de narrativas. Se conservan respuestas originales. Los importes utilizables no se deben sumar como si fueran ventas del proyecto.