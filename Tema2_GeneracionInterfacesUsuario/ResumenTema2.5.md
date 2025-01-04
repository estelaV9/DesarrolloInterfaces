# Patrones de Diseño y Arquitectónicos
## Patrones de Diseño
Los **patrones de diseño** son soluciones reutilizables y probadas para problemas comunes en desarrollo de software. Categorías principales:
  - **Creacionales:** Centrados en la creación de objetos.
  - **Estructurales:** Se enfocan en la composición de clases y objetos.
  - **De Comportamiento:** Gestionan la interacción y responsabilidades entre objetos.
  - **Concurrentes:** Manejan concurrencia y multitarea.
  - **De Gestión de Estado:** Específicos para gestionar el estado de una aplicación.
Además, existen los **patrones arquitectónicos** que guían la construcción de la estructura general de un proyecto de software.


## Patrones Creacionales
Se centran en la creación de objetos, ocultando los detalles de implementación y proporcionando flexibilidad.
- **Singleton**: Garantiza una única instancia de una clase y proporciona un punto de acceso global. En Flutter, se utiliza para gestionar clases únicas como `SharedPreferences` o gestores de estado.

- **Factoría**: Define una interfaz para crear objetos, delegando a subclases la decisión de qué clase instanciar. Ejemplo en Flutter, con constructores factoría:
  ```dart
  class CustomButton extends StatelessWidget {
    final String label;
    final VoidCallback onPressed;

    CustomButton._(this.label, this.onPressed);

    // FACTORY CONSTRUCTORS PARA DIFERENTES TIPOS DE BOTONES
    factory CustomButton.primary(String label, VoidCallback onPressed) {
      return CustomButton._(label, onPressed);
    }

    factory CustomButton.secondary(String label, VoidCallback onPressed) {
      return CustomButton._(label, onPressed);
    }

    @override
    Widget build(BuildContext context) {
      return ElevatedButton(
        onPressed: onPressed,
        child: Text(label),
      );
    }
  }
  ```

- **Builder**: Separa la construcción de un objeto de su representación. En Flutter, se usa en `ListView.builder` o `GridView.builder` para construir widgets de forma dinámica según sea necesario.


## Patrones Estructurales
Estos patrones se enfocan en la composición de clases y objetos para formar estructuras complejas, esenciales para construir el árbol de widgets en Flutter.

- **Adapter**: Permite que una interfaz incompatible se use como otra esperada. Por ejemplo, se usa para procesar datos provenientes de JSON y adaptarlos a widgets específicos.

- **Composite**: Permite tratar objetos individuales y compuestos de forma uniforme. En Flutter, se refleja en widgets como `Column`, `Row` y `Container`, que pueden contener otros widgets.

- **Decorator**: Añade responsabilidades a un objeto de forma dinámica. En Flutter, se utiliza para modificar la apariencia de widgets. Ejemplo: `Padding`, `DecoratedBox` o `Container` para añadir estilos, bordes o espaciados.

- **Facade**: Proporciona una interfaz simplificada para un subsistema complejo. Por ejemplo, puedes usar una clase `ApiService` para centralizar llamadas a APIs.
  

## Patrones de Comportamiento
Estos patrones se centran en las interacciones entre objetos y cómo se distribuyen responsabilidades. Son muy útiles para manejar interacciones y cambios de estado en Flutter.

- **Command**: Encapsula una solicitud como un objeto, permitiendo ejecutar, deshacer o almacenar comandos. Ejemplo:
  ```dart
  abstract class Command {
    void execute();
  }

  class PrintCommand implements Command {
    final String message;
    PrintCommand(this.message);
    @override
    void execute() {
      print(message);
    }
  }

  void main() {
    final helloCommand = PrintCommand('Hola, mundo!');
    final byeCommand = PrintCommand('Adiós, mundo!');

    // EJECUTAR COMANDOS
    helloCommand.execute(); // SALIDA: Hola, mundo!
    byeCommand.execute();   // SALIDA: Adiós, mundo!
  }
  ```

- **Observer**: Define una dependencia uno a muchos, notificando a los dependientes cuando el estado cambia. En Flutter, `Provider`, `ValueNotifier` y `ChangeNotifier` implementan este patrón. Ejemplo: `Provider` notifica automáticamente a los widgets cuando cambian los datos.

- **State**: Permite cambiar el comportamiento de un objeto según su estado interno. En Flutter, los `StatefulWidget` utilizan este patrón, con un objeto `State` para gestionar cambios de estado.

- **Strategy**: Define una familia de algoritmos, encapsula cada uno y permite intercambiarlos. Ejemplo: cambiar métodos de autenticación (correo, Google, LinkedIn) mediante clases con una interfaz común:
  ```dart
  abstract class AuthStrategy {
    void authenticate();
  }

  class GoogleAuth implements AuthStrategy {
    @override
    void authenticate() {
      print('Autenticación con Google');
    }
  }

  class EmailAuth implements AuthStrategy {
    @override
    void authenticate() {
      print('Autenticación con correo electrónico');
    }
  }

  void main() {
    AuthStrategy strategy = GoogleAuth();
    strategy.authenticate(); // SALIDA: Autenticación con Google
    strategy = EmailAuth();
    strategy.authenticate(); // SALIDA: Autenticación con correo electrónico
  }
  ```
  
## Patrones Concurrentes
Se encargan del manejo de concurrencia y multitarea. En Dart, se utilizan **Isolates** en lugar de hilos tradicionales.

- **Thread Pool**: Administra un conjunto de hilos reutilizables.  
  Se implementa con Isolates.
- **Monitor Object**: Controla el acceso a recursos compartidos.  
  Se puede simular con `Lock` de la biblioteca `async`.
- **Producer-Consumer**: Coordina la producción y el consumo de recursos.  
  En Flutter, esto se implementa usando Streams.


## Patrones Arquitectónicos
Estos patrones definen la estructura global de un proyecto de software. Algunos ejemplos comunes son:

- **Model-View-ViewModel (MVVM)**: Separa la lógica de negocio (ViewModel) de la interfaz de usuario (View). En Flutter, se combina con `Provider` o `Riverpod`.

- **Clean Architecture**: Divide la aplicación en capas:
  - **Dominio:** Entidades principales del negocio y casos de uso.
  - **Datos:** Obtención y almacenamiento (APIs, bases de datos).
  - **Presentación:** Interfaz de usuario y lógica de interacción.  
    Ejemplo: Usar MVVM en la capa de presentación.

- **Event-Driven Architecture**: Basada en la gestión de eventos. Ejemplo: `StreamBuilder` o `EventBus` para manejar eventos emitidos por Streams.

### Patrones de Gestión de Estado
Flutter, al ser reactivo, requiere una buena gestión de estados. Algunas opciones incluyen:
- **MVVM**: Utilizado con `Riverpod` o `Provider` para simplificar la lógica de negocio.
- **Redux**: Centraliza el estado, usando acciones, reducers y un store. Implementado con `flutter_redux`.
- **BLoC**: Separa la lógica de negocio de la interfaz con Streams y Sinks, usando `flutter_bloc`.


### Actividades
1. Implementar una aplicación que gestione una lista de productos (nombre y precio) utilizando Clean Architecture y MVVM:
   - Obtener datos de una API simulada (JSON estático).
   - Mostrar los productos en un `ListView`, simulando un tiempo de carga.
   - Crear un `ViewModel` para la lógica de presentación.

2. Revisar ejemplos y recomendaciones en:
   - [Caso de estudio oficial de Flutter](https://docs.flutter.dev/app-architecture/case-study)
   - [Recomendaciones de arquitectura](https://docs.flutter.dev/app-architecture/recommendations)


---
>_Estela de Vega Martín | IES Ribera de Castilla 24/25_
