# retailpro

RetailPro | Análisis de ventas con SQL
RetailPro es un proyecto de análisis de datos que simula la operación comercial de una empresa minorista. El proyecto parte de la creación de una base de datos relacional y utiliza SQL para responder preguntas de negocio sobre el desempeño mensual, los productos más vendidos y la recurrencia de compra. El modelo incorpora canales de venta, medios de pago y territorios para ampliar el análisis comercial.

Etapas del proyecto
Etapa	Trabajo realizado	Recursos de SQL
1. Creación y carga de la base de datos.	Se creó la base de datos y se cargaron las tablas iniciales de ventas, productos, clientes y categorías.	DDL y DML, con sentencias como CREATE TABLE e INSERT INTO.
2. Consultas para equipos de negocio.	Se preparó un resumen ejecutivo mensual, un ranking de productos, un análisis de clientes recurrentes y una comparación de productos por encima y por debajo del promedio.	DQL, con funciones de agregación como SUM, COUNT y AVG, expresiones CASE con alias AS, y cláusulas GROUP BY, HAVING y ORDER BY.
3. Integración y consolidación de datos.	Se construyó la vista base del proyecto, se identificaron clientes sin ventas y productos sin ventas, y se consolidaron las ventas por segmento etario.	Distintos tipos de JOIN para relacionar tablas y UNION y UNION ALL para combinar conjuntos de resultados.
4. Ampliación del modelo comercial.	Se incorporaron las tablas de canales de venta, medios de pago y territorios, habilitando nuevas dimensiones para segmentar las ventas.	DDL para ampliar el esquema, DML para cargar los datos y DQL para consultar las nuevas dimensiones.


Herramientas
- SQL para definir el esquema, cargar los datos, crear la vista base y desarrollar las consultas de análisis.
- Un motor de base de datos relacional y un cliente SQL compatible para ejecutar los scripts desde una interfaz gráfica o la terminal.
- GitHub para documentar el proyecto y compartir los scripts.

Cómo ejecutar los scripts
1. Cloná el repositorio o descargalo como ZIP desde el menú Code de GitHub.
2. Abrí los archivos .sql en un cliente compatible con el motor de base de datos del proyecto.
3. Ejecutá el script de creación de la base de datos y de las tablas iniciales. Asegurate de que tu conexión apunte a RetailPro antes de continuar.
4. Ejecutá los scripts de carga inicial para poblar las tablas de ventas, productos, clientes y categorías.
5. Ejecutá las consultas de análisis inicial. Para las consultas que dependen de la vista base, ejecutá primero la sentencia que la crea.
6. Para analizar ventas por canal, medio de pago o territorio, ejecutá primero los scripts que crean y cargan esas tablas. Luego corré las consultas que utilizan esas dimensiones.
