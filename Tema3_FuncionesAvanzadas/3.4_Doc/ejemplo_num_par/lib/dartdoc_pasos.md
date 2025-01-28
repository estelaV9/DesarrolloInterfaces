# Pasos para hacer dartdoc

## Instalar DartDoc
Ejecutar: `dart pub global activate dartdoc`.
Esto instalará o activará la herramienta dartdoc si no está activa.

## Prepara tu proyecto
Antes de generar la documentación, asegúrate de que tu proyecto está limpio y que no hay errores: `dart analyze`
Esto verificará si hay problemas en el código. Corrige cualquier error antes de continuar.

## Genera la documentación
Desde el directorio raíz de tu proyecto, ejecuta: `dart doc`.
Esto generará automáticamente la documentación en la carpeta doc/api/.

## Visualiza la documentación
Para abrir la documentación en tu navegador, puedes usar un servidor local:

- Instala el servidor local (si no lo tienes): `dart pub global activate dhttpd`
- Sirve la carpeta de la documentación: `dart pub global run dhttpd --path doc/api`.
- Abre el navegador en la dirección que te dé, normalmente será: http://localhost:8080