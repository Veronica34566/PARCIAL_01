# Parte I: Diagrama Entidad-Relación

## Introducción

En esta parte del parcial realicé un diagrama entidad-relación para organizar la información de una empresa de servicios digitales. Para hacerlo, identifiqué las entidades principales del sistema, sus atributos y la forma en que se relacionan entre sí.

## Desarrollo

Para elaborar el diagrama utilicé Draw.io. En él representé seis entidades: usuarios, autenticación, servicios, contrataciones, pagos y auditoría.

Cada entidad tiene sus propios campos para almacenar la información necesaria. También utilicé claves primarias (PK) para identificar los registros y claves foráneas (FK) para relacionar las tablas.

Las relaciones que establecí fueron las siguientes:

- Un usuario puede realizar varias contrataciones.
- Un servicio puede estar incluido en varias contrataciones.
- Una contratación puede tener varios pagos.
- Un usuario puede tener varios registros de autenticación.
- Un usuario puede tener varios registros en auditoría.

De esta manera, la información queda organizada y se puede consultar de forma relacionada.

## Herramienta utilizada

Utilicé Draw.io para dibujar las entidades, agregar sus atributos y representar las relaciones entre ellas.

## Conclusión

Con esta actividad aprendí a diseñar un diagrama entidad-relación y a identificar las tablas que necesita una base de datos. También comprendí mejor cómo funcionan las claves primarias, las claves foráneas y las relaciones entre las entidades.

Este diagrama me sirvió como guía para organizar la información antes de trabajar con las consultas SQL.
