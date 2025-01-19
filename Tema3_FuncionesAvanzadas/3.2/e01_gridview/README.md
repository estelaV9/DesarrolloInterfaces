#  Ejercicio 1: Crear una UI adaptativa con GridView
Crea una interfaz que use ``GridView`` para mostrar elementos en una cuadrícula. La
cantidad de columnas debe depender del ancho de la ventana:
- 1 columna para menos de 600px.
- 2 columnas para entre 600px y 1200px.
- 4 columnas para más de 1200px.

Usa ``MediaQuery.sizeOf`` para determinar el ancho de la ventana y selecciona el
número de columnas con ``SliverGridDelegateWithFixedCrossAxisCount`` .
