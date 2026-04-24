# Prueba String — Manual de usuario
Requisitos
- Java JDK (17+ recomendado)
- Apache Maven instalado y en PATH
- JFlex y CUP configurados en el pom.xml del proyecto

Generar archivos (lexer / parser)
1. Generar parser (CUP):

```bash
$ mvn cup:generate
```

2. Generar lexer (JFlex):

```bash
$ mvn jflex:generate
```

Estos comandos crean las clases generadas (ubicación según tu pom, típicamente en `target/generated-sources` o directamente en `src/main/java` si está configurado así).

Compilar y verificar
- Ejecutar las pruebas y la verificación del proyecto:

```bash
$ mvn clean verify
```

Empaquetar
- Generar el JAR ejecutable (si el pom está configurado para ello):

```bash
$ mvn clean package
```

El JAR resultante suele quedar en:
  target/<artifactId>-<version>.jar

Ejecutar la aplicación
1. Si se generó un JAR ejecutable (con Main-Class en el manifiesto):

```bash
$ java -jar target/<artifactId>-<version>.jar [args]
```

2. Usando Maven exec (útil si no hay JAR o quieres ejecutar sin empaquetar):

```bash
$ mvn -Dexec.mainClass="com.tu.paquete.Main" exec:java -Dexec.args="arg1 arg2"
```
- Reemplaza `com.tu.paquete.Main` por la clase con el método `main`.

Resúmen de como realizar el proceso completo antes de ejecutar el programa
- Generar lexer/parser:

```bash
$ mvn cup:generate
$ mvn jflex:generate
```

- Compilar, probar y empaquetar:

```bash
$ mvn clean verify
$ mvn clean package
```

- Ejecutar jar:

```bash
$ java -jar target/prueba-string-1.0.jar
```

# Ejecución del programa

Al ejecutar el programa, se abrirá una ventana de consola donde se solicitará al usuario que ingrese una cadena de texto. El programa procesará la cadena utilizando el lexer y parser generados, y luego mostrará el resultado del análisis sintáctico.
- Ejemplo de entradas validas:

```bash
$ numero_entero = 15
$ numero_decimal = 3.14
$ texto = "Hola, mundo!"
```

- Al tener una entrada válida volvera a dar la opción de ingresar más texto para analizar
- Si el programa detecta un error léxico o sisntactico, devuelve el error
- Ejemplo de entrada no válida:

```bash
$ numero decimal = 3,14
$ texto = Hola, mundo!
$ numero_entero = "1
```