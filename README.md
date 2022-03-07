# Proyecto_Ing_Software_2

## Citizen Web Application
Citizen es una aplicación web que le permitirá a la administración de la ciudad tener una vista estructurada de los problemas en el área y en tiempo real. Esta solución facilita la planificación operativa y permite orientar las acciones preventivas o correctivas donde se necesiten (por ejemplo, deterioro de x infraestructura, daños a propiedad pública, elementos susceptibles a volcamiento, etc). La aplicación web, ayuda a crear un marco democrático para que los ciudadanos informen sobre cualquier peligro en la ciudad. Se utiliza una aplicación web para crear los reportes, clasificarlos teniendo en cuenta la prioridad (dada por consenso ciudadano), adjuntar fotografías y actualizar la trazabilidad de cada uno. La aplicación adjunta automáticamente las coordenadas de ubicación a la imagen y los datos se envían al servidor. La administración de la ciudad podrá visualizar los problemas emergentes en el mapa de la ciudad. Los ciudadanos pueden seguir el estado de los informes hasta que sean fijados por la administración de la ciudad.

## Diagrama de Componentes y Conectores

<div align="left">
    <img src="/docs/UML/Diagrama_Componentes_Conectores.PNG" width="600px"</img> 
</div>

## Diagrama Secuencia - Citizen
<div align="left">
    <img src="/docs/UML/Diagrama_Secuencia_Citizen.png" width="600px"</img> 
</div>

## Diagrama Secuencia - Usuario
<div align="left">
    <img src="/docs/UML/Diagrama_Secuencia_Usuario.png" width="600px"</img> 
</div>

## Diagrama de Modulos
<div align="left">
    <img src="/docs/UML/Diagrama_Modulos.PNG" width="600px"</img> 
</div>

## Modelo C4
El modelo C4 se utilizó para representar la arquitectura en diferentes niveles de abstracción:
```
1.Sistema: muestra los sistemas externos utilizados y la interacción con los usuarios
2.Contenedor: muestra los componentes de alto nivel que interactúan para completar una solicitud.
3.Componente: muestra cómo está organizado un componente específico.
```
## 1. Diagrama del Sistema
<div align="left">
    <img src="/docs/C4/Diagrama_Sistema.PNG" width="600px"</img> 
</div>

## 2. Diagrama de Contenedores
<div align="left">
    <img src="/docs/C4/Diagrama_Contenedores.PNG" width="600px"</img> 
</div>

## 3. Diagrama de Componentes
<div align="left">
    <img src="/docs/C4/Diagrama_Componentes.PNG" width="600px"</img> 
</div>

# Pasos para ejecutar el software
Se requiere del SDK Flutter para la ejecución del programa en desarrollo. Ver documentación oficial:
https://docs.flutter.dev/get-started/install

Para correr el programa ubiquese en la raiz del proyecto desde el terminal y ejecute el comando:
```
flutter run
```
Seleccione el dispositivo de depuración ingresando el número. Verá algo como esto:
```
Multiple devices found:
Chrome (web) • chrome • web-javascript • Google Chrome 98.0.4758.102
Edge (web)   • edge   • web-javascript • Microsoft Edge 99.0.1150.30
[1]: Chrome (chrome)
[2]: Edge (edge)
```
Para ejecutar el programa a pleno rendimiento sin depuración. Correr:
```
flutter run --profile
```


