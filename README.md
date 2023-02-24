## Prueba OMNI.PRO 

# Arquitectura 

Se plantio una arquitectura limpia ya que aunque la funcionalidad es muy pequeña, se especifica en la prueba escribir el codigo de 
manera limpia, mantenible, testeable y teniendo en cuenta los principios solid. 

-[Documento de arquitectura bajo el modelo c4](https://structurizr.com/share/80404)

Esta compuesta por las siguientes capas: 

![ARQUITECURA ](https://user-images.githubusercontent.com/89667616/221234755-6aa35429-20d4-433a-a3dd-eb3f3875e0a9.png)


- APPLICATION: Capa que esta encargada de comunicar las acciones de la capa de presentacion a la capa de dominio, a esta capa se le injectan dependencias de la capa de 
  dominio (los casos de uso) esta capa no debe de conocer otras capas de la arquitectura a parte de la de dominio y su funcionalidad se debe restringir a manejar los     eventos y estados de la ui.
  
  ![APPLICATION](https://user-images.githubusercontent.com/89667616/221238649-2d5d4ebb-9782-4c44-9200-c6ace48ffefd.png)
  
- CORE: Capa con funcionalidades trasversales en la aplicacion a esta capa puede conocer todas los niveles del proyecto, en esta se encuentran utils y las injeciones     de las dependencias.

  ![CORE](https://user-images.githubusercontent.com/89667616/221239962-86c58a2f-264d-48d6-8687-f6e06e6e05e2.png)
  
- DOMAIN: Capa con la logica de negocio contiene los contratos de los repositorios, casos de uso y las entidades, esta capa esta encargada de las operaciones que puede realizar la app bajo los lineamientos del negocio, esta capa no conece ninguna otra y realiza sus operaciones a traves de los contratos de los repositorios. 

  ![DOMAIN](https://user-images.githubusercontent.com/89667616/221244235-99db8ff6-74fe-465f-ace2-a8a05ce3a6c4.png)

- INFRASTRUCTURA: Es la capa mas externa de la arquictetura esta compuesta por los datasources encargadores de realizar las peticiones a las diferentes 
  fuentes de datos, tambien en esta capa se encuentran las implementaciones de los repositorios que se encargan de orquestar los diferentes data sources 
  para una funcionalidad especifica y los mapper que convierten los modelos de datos DTO a modelos de dominio (no lo realiza el DTO para que la dependeciae entre los DTO y los modelos de dominio sea flexible), en esta capa tambien se encuentran el cliente HTTP, excepciones y cualquier servicio que se implemente que     dependa de fuentes externas, esta capa es la mas externa de la arquitectura y solo debe conocer su propia implementacion y no debe saber de la existencia de las       otras capas, exceptuando a las implementaciones de los repositorios que solo deben conocer el contrato que implementan de la capa de dominio. 

  ![INFRASTRUCTURA](https://user-images.githubusercontent.com/89667616/221244988-578d4e7c-31cf-4c5f-8e2d-9df693c72430.png)

- PRESENTACION: Capa con la ui de la aplicacion contiene todo los widgets de la app , usa la capa de APPLICATION para realizar las operaciones y  mostrar informacion o widgets de carga segun los sea necesario. 
 
  ![PRESENTATION](https://user-images.githubusercontent.com/89667616/221246649-9310d0b9-10f0-4119-8268-944d18463947.png)

# Caracteristicas de la App 

- Lista de fotos con paginacion, realiza la carga cada vez que el usuario llega al final de la lista. 
- Manejo y comunicacion de errores que ocurran realizando las peticiones a la API.
- Manejo y comunicacion de error por perdida de conexcion con carga automatica una vez se recupere la conexion a internet. 

# Requisitos  

- El proyecto necesita una version de dart SDK '>=2.18.1 <3.0.0'

# Paso a paso para ejecutar el proyecto 

- Ingrese a la raiz del proyecto en la terminal y ejecute el comando **make init** 
- Espere a que los archivos autogenerados se completen.
- Ejecute la app en el archivo main en su emulador iOS o Android. 
