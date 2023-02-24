## Prueba OMNI.PRO 

# Arquitectura 

Se plantio una arquitectura limpia ya que aunque la funcionalidad es muy pequeña, se especifica en la prueba escribir el codigo de 
manera limpia, mantenible, testeable y teniendo en cuenta los principios solid. 

Esta compuesta por las siguientes capas: 

![ARQUITECURA ](https://user-images.githubusercontent.com/89667616/221234755-6aa35429-20d4-433a-a3dd-eb3f3875e0a9.png)

![DOCUMENTACION C4 NIVEL GENERAL](https://structurizr.com/share/80404)

- INFRASTRCUTURA: Es la capa mas externa de la arquictetura esta compuesta por los datasources encargadores de realizar las peticiones a las diferentes 
  fuentes de datos, tambien en esta capa se encuentran las implementaciones de los repositorios que se encargan de orquestar los diferentes data sources 
  para una funcionalidad especifica y los mapper que convierten los modelos de datos DTO a modelos de dominio (no lo realiza el DTO para que la dependecia  
  e entre los DTO y los modelos de dominio sea flexible), en esta capa tambien se encuentran el cliente HTTP y cualquier servicio que se implemente que dependa de       fuentes externas, esta capa es la mas externa de la arquitectura y solo debe conocer su propia implementacion y no debe saber de la existencia de las otras capas,
  exceptuando a las implementaciones de los repositorios que solo deben conocer el contrato que implementan de la capa de dominio. 


[Documento de arquitectura bajo el modelo c4](https://structurizr.com/share/80404)

# Caracteristicas 

- Lista de fotos con paginacion, realiza la carga cada vez que el usuario llega al final de la lista. 
- 

El proyecto necesita una version de dart SDK '>=2.18.1 <3.0.0'

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
