# Parte II – Implementación de Base de Datos con Docker

## 1. Introducción

En esta parte del parcial trabajé en la creación de una base de datos para una empresa de servicios digitales. Utilicé Docker para ejecutar MariaDB y poder trabajar con la base de datos sin tener que instalar el motor directamente en Windows.

El objetivo fue crear las tablas, relacionarlas, insertar datos y realizar consultas para comprobar que todo funcionara correctamente.

## 2. Herramientas utilizadas

- Docker Desktop
- Docker Compose
- MariaDB 11
- SQL
- Visual Studio Code y CMD para trabajar con los archivos y ejecutar los comandos

## 3. Configuración de Docker

Para el proyecto utilicé un contenedor llamado `parcial01-mariadb`, con la imagen `mariadb:11`.

La base de datos se llama `parcial01` y utilicé el puerto `3307` de mi computadora para conectarme al puerto `3306` del contenedor.

También configuré un usuario para trabajar con la base de datos y una contraseña para el acceso.

## 4. Comandos utilizados

### Iniciar el contenedor

Este comando permite iniciar los servicios definidos en el archivo `docker-compose.yml`.

```bash
docker compose up -d
```

### Verificar el estado del contenedor

Con este comando revisé si el contenedor estaba ejecutándose.

```bash
docker ps
```

### Revisar los logs

Este comando permite ver los mensajes del contenedor para comprobar su funcionamiento y revisar posibles errores.

```bash
docker logs parcial01-mariadb
```

### Entrar a MariaDB como administrador

Utilicé el siguiente comando para entrar a la consola de MariaDB:

```bash
docker exec -it parcial01-mariadb mariadb -u root -p
```

### Entrar con el usuario de trabajo

Para conectarme directamente a la base de datos `parcial01`, utilicé:

```bash
docker exec -it parcial01-mariadb mariadb -u estudiante -p parcial01
```

## 5. Creación de las tablas

Creé seis tablas para organizar la información del sistema:

- **usuarios:** almacena los datos de los usuarios.
- **servicios:** contiene los servicios que ofrece la empresa.
- **contrataciones:** relaciona los usuarios con los servicios que contratan.
- **pagos:** registra los pagos asociados a las contrataciones.
- **autenticacion:** almacena información sobre los intentos de acceso.
- **auditoria:** registra acciones realizadas en el sistema.

Para relacionar las tablas utilicé claves primarias y claves foráneas. También agregué restricciones como `NOT NULL`, `UNIQUE` y `CHECK` para ayudar a mantener los datos correctos.

Además, cada tabla incluye campos de tipo lista mediante `ENUM`, campos booleanos y restricciones de unicidad, según los requisitos del parcial.

## 6. Inserción de datos

Después de crear las tablas, inserté diez registros en cada una. En total, la base de datos tiene 60 registros distribuidos entre las seis tablas.

Los datos están relacionados mediante las claves foráneas. Por ejemplo, los pagos corresponden a contrataciones existentes y las contrataciones están relacionadas con usuarios y servicios.

## 7. Operaciones CRUD

Realicé pruebas CRUD para comprobar que podía trabajar con los datos.

- **CREATE:** inserté un usuario de prueba.
- **READ:** consulté los registros para comprobar que los datos se guardaran correctamente.
- **UPDATE:** modifiqué el estado de un servicio.
- **DELETE:** eliminé el usuario de prueba después de verificarlo.

Estas pruebas me permitieron comprobar las operaciones básicas de una base de datos. La eliminación realizada fue física, porque el registro de prueba se borró de la tabla.

## 8. Creación de vistas SQL

Creé cuatro vistas para consultar información de forma más organizada.

### `v_contrataciones`

Permite consultar información relacionada con los usuarios, los servicios y sus contrataciones.

### `v_seguridad`

Muestra información de los usuarios sin incluir sus correos electrónicos, lo que permite limitar la exposición de algunos datos personales.

### `v_auditoria`

Permite revisar las acciones registradas en el sistema junto con la información relacionada con los usuarios.

### `v_ia`

Es una vista adicional que ejecuta la operación matemática `2+4`. Al consultarla, el resultado obtenido es `6`.

Para verificar las vistas utilicé consultas `SELECT`.

## 9. Normalización de la base de datos

La normalización permite organizar los datos para reducir la repetición de información y evitar problemas al insertar, actualizar o eliminar registros.

**Primera Forma Normal (1FN):** organicé los campos para que cada uno almacene un solo valor y no se repitan grupos de datos en una misma columna.

**Segunda Forma Normal (2FN):** distribuí la información en tablas según su función, evitando que los atributos dependan solo de una parte de una clave compuesta cuando esta exista.

**Tercera Forma Normal (3FN):** separé la información de usuarios, servicios, contrataciones, pagos, autenticación y auditoría. De esta manera, cada tabla tiene una función específica y se reduce la duplicación innecesaria de datos.

Considero que este diseño facilita el mantenimiento de la base de datos y permite relacionar la información mediante claves foráneas.

## 10. Respaldo de la base de datos

Generé un respaldo SQL llamado `respaldo_parcial01.sql`. Este archivo contiene la estructura y los datos de la base de datos, además de las vistas incluidas en el respaldo.

El archivo se encuentra en esta carpeta y sirve para conservar el trabajo realizado y facilitar su recuperación.

## 11. Evidencias

En esta sección se agregarán las capturas de pantalla que muestran las pruebas realizadas durante el desarrollo del parcial:

- Estado del contenedor Docker.
- Logs de MariaDB.
- Conexión a la base de datos.
- Tablas creadas y registros insertados.
- Pruebas CRUD.
- Creación y consulta de las vistas SQL.

## 12. Conclusión

Con este trabajo pude practicar el uso de Docker para ejecutar MariaDB, crear una base de datos relacional y administrar la información mediante SQL. También trabajé con claves primarias, claves foráneas, restricciones, operaciones CRUD y vistas.

La práctica me ayudó a comprender mejor cómo organizar una base de datos y cómo comprobar su funcionamiento desde la consola.
