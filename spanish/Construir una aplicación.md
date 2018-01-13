## Procedimiento básico para construir una aplicación:

1. Asegúrese que el PATH del sistema incluye la carpeta C:\OOHG, en caso contrario deberá agregarla.
2. Abra una ventana de comandos y cámbiese a la carpeta que contiene el código fuente (archivos .prg).
3. Ejecute el siguiente comando:
   ```
   compile myApp
   ```
4. Para generar un archivo de preprocesador utilice:
   ```
   compile myApp /p
   ```
5. Si la aplicación está programada en modo consola utilice:
   ```
   compile myApp /c
   ```
6. Si desea añadir el debugger de Harbour utilice:
   ```
   compile myApp /d
   ```

#### Notas:

* Si la aplicación tiene más de un archivo fuente (ej.: myApp.prg y myFuncs.prg), para construirla con éxito necesitará agregar al final de myApp.prg:
   ```
   #include "myFuncs.prg"
   ```
* Para incluir un archivo de recursos (.rc) deberá nombrarlo myApp.rc y colocarlo en la misma carpeta donde está ubicado myApp.prg.
* Para utilizar un archivo de recursos adicionales deberá agregar al final de myApp.rc:
   ```
   #include "otro.rc"
   ```
* Por defecto, el proceso de construcción del ejecutable __incluye__ automáticamente el archivo de recursos de ooHG (archivo oohg.rc de la carpeta include).
* Este método de construcción también funcionará con la distribuciones basada en xHarbour y BCC.


## Procedimiento alternativo para quienes utilizan Harbour y MinGW:

1. En lugar de "compile" utilice "buildapp".

#### Notas:

* Para la construcción del ejecutable se utilizará la utilidad HBMK2.EXE de Harbour.
* Aplican todas las notas del procedimiento básico.
* Con este procedimiento también se puede utilizar un archivo myApp.hbp conteniendo:
   ```
   #include "myApp.prg"
   #include "myFuncs.prg"
   ```


## Otro procedimiento alternativo para quienes utilizan Harbour y MinGW:

1. Asegúrese que el PATH del sistema incluye C:\OOHG\HB30\BIN y C:\OOHG\HB30\COMP\MINGW\BIN para la distribución basada en Harbour 3.0, o C:\OOHG\HB32\BIN y C:\OOHG\HB32\COMP\MINGW\BIN para la distribución basada en Harbour 3.2.
2. Si la aplicación trabaja en modo GUI o en modo mixto, copie el archivo BUILD_GUI.HBP en la carpeta donde están los archivos fuente (archivos .prg).
3. Abra una ventana DOS y cambie a la carpeta de la aplicación.
4. Ejecute el siguiente comando:
   ```
   HBMK2 BUILD_GUI.HBP
   ```
5. Si la aplicación trabaja en modo consola, copie el archivo BUILD_CON.HBP en la carpeta donde están los archivos fuente.
6. Abra una ventana DOS y cambie a la carpeta de la aplicación.
7. Ejecute el siguiente comando:
   ```
   HBMK2 BUILD_CON.HBP
   ```

#### Notas:

* Se puede agregar un archivo de recursos (archivo .rc) en la sección '# Source' del archivo .HBP, si la aplicación utiliza uno.
* Para utilizar archivos de recursos adicionales, agréguelos al final del primer archivo de recursos utilizando #include "otro.rc".
* Por defecto, el proceso de construcción __no incluye__ automáticamente el archivo de recursos de OOHG.
* Si la aplicación utiliza recursos de este archivo, debe agregarlo mediante alguno de los métodos antes mencionados, especificando su nombre completo (C:\OOHG\RESOURCES\OOHG.RC).
