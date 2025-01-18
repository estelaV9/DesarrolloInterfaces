# Resumen del Tema 3.1: Accesibilidad
La **accesibilidad** es la capacidad de una aplicación para ser utilizada por personas con discapacidades o necesidades especial.

## Herramientas principales de accesibilidad en Flutter
### Semantics Tree
El **Semantics Tree** es un mapa lógico que describe cómo los widgets se presentan a tacnologías de asistencia.
Usa tres Widgets:

- `Semantics`: Define cómo un widget debe ser representado en el árbol semántico.
    ```dart
    Semantics(
        // PROPORCIONA UNA DESCRIPCION TEXTUAL DEL WIDGET
        label: 'Botón de búsqueda',
        // AÑADE INFORMACION ADICIONAL
        hint: 'Realiza una búsqueda en la aplicación',
        child: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
        ),
    )
    ``` 
    <br>
    
    ```dart
    // EL LECTOR DIRA: "INTERRUPTOR DE ENCENDIDO, APAGADO, 
    // TOCA PARA ENCENDER
    Semantics(
        label: 'Interruptor de encendido',
        value: 'Apagado',
        hint: 'Toca para encender',
        child: Switch(
            value: false,
            onChanged: (bool newValue) {},
        ),
    )
    ```
- `Exclude Semantics`: Excluye un widget del árbol semántico. Por ejemplo, para ignorar elementos decorativos.
  ```dart
  // ESTE TEXNO NO SERA LEIDO POR EL LECTOR DE PANTALLA
   ExcludeSemantics(
        child: Text('Texto decorativo'),
    )
  ```
  **Propiedades**:
  -  ``label``: describe el widget para los lectores de pantalla.
  - ``hint``: ofrece sugerencias adicionales para su uso.
  - ``value``: representa el estado actual del widget.
  - ``onTapHint``: sugiere acciones que el usuario puede realizar.
  - ``enabled``: indica si el widget está activo o no.
  <br>
- `MergeSemantics`: Combina mútiples widgets en un único nodo semántico.
  ```dart
  // EL LECTOR DE PANTALLA INTERPRETARA ESTE ROW COMO "Favorito"
   MergeSemantics(
        child: Row(
            children: [
                Icon(Icons.star),
                Text('Favorito')
            ],
        ),
    )
  ```<br>

Otros widgets relevantes:
- `Tooltip`: proporciona información adicional al usuario cuando pasa sobre un elemento.
  ```dart
   Tooltip(
        message: 'Botón de búsqueda',
        child: Icon(Icons.search),
    )
  ```
- `FocusableActionDetector`: detecta interacciones del teclado y accesos directos.


## Testing automatizado de accesibilidad
```dart
// VALIDA QUE EL LABEL SEMANTICO ESTE BIEN CONFIGURADO
testWidgets('El botón tiene un label accesible', (WidgetTester tester) async {
 await tester.pumpWidget(MyApp());
 final semantics = find.bySemanticsLabel('Botón de búsqueda');
  expect(semantics, findsOneWidget);
 });
```

## Internacionalización
Paquetes como `intl` se usan para traducir etiquetas semánticas.
```dart
import 'package:intl/intl.dart';
Semantics(
    // TRADUCE EL LABEL SEGUN EL IDOMA DEL DISPOSITIVO
    label: Intl.message('Botón de búsqueda', name: 'searchButton'),
    child: IconButton(
        icon: Icon(Icons.search),
        onPressed: () {},
    ),
)
```

Formatos de fecha, hora y moneda sean correctos:
```dart
 Text(Intl.message('Hoy es ${DateFormat.yMMMMd().format(DateTime.now())}',
  name: 'todayDate'));
```

## Configuración de accesibilidad para múltiples idiomas
```dart
class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            // SE DEFINEN LOS RECURSOS EN EL MATERIALAPP
            localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [
                Locale('en', 'US'),
                Locale('es', 'ES'),
            ],
            locale: Locale('es', 'ES'),
            home: Scaffold(
                // SE USA Intl.message PARA GARANTIZAR QUE SEAN TRADUCIDOS
                appBar: AppBar(title: Text(Intl.message('Inicio', name: 'home'))),
                body: Semantics(
                    label: Intl.message('Botón de búsqueda', name: 'searchButton'),
                    child: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {},
                    ),
                ),
            ),
        );
    }
}
```