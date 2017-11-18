## Procedimiento para instalar la distribución oficial de ooHG:

1. Descargar el archivo .ZIP desde http://sourceforge.net/projects/oohg/files/
2. Si ya existe una carpeta C:\OOHG en su disco duro, es muy recomendable borrarla, renombarla o moverla a otro lugar para evitar problemas y mejorar la calidad del soporte en caso de que exista alguno.
3. Extraer el contenido del archivo descargado en C:\ de forma que los archivos sean copiados a la carpeta C:\OOHG.
4. Agregar C:\OOHG al PATH del sistema de forma que se puedan construir los ejemplos y aplicaciones utilizando el comando COMPILE.BAT


## Procedimientos para actualizar la distribución con los últimos cambios en los fuentes:

#### Para desarrolladores:

1. Descargar e instalar "Git" desde https://git-scm.com/download
2. Descargar e instalar "GitHub Desktop" desde https://desktop.github.com/
3. Ingresar a GitHub Desktop.
4. Hacer clic en "Clone a repository" y luego en "URL".
5. En "Repository ..." ingresar https://github.com/oohg/core.git
6. En "Local path" ingresar C:\OOHG (la carpeta no debe existir).
7. Clic en "Clone".
8. Para descargar los otros repositorios (distros, doc, ejemplos, fmt, ide, samples):
* Hacer clic en menú "File".
* Hacer clic en opción "Clone a repository".
* Hacer clic en "URL".
* En "Repository ..." ingresar la dirección que corresponda
  * https://github.com/oohg/distros.git
  * https://github.com/oohg/doc.git
  * https://github.com/oohg/ejemplos.git
  * https://github.com/oohg/fmt.git
  * https://github.com/oohg/ide.git
  * https://github.com/oohg/samples.git
* En "Local path" ingresar
  * C:\OOHG\distros
  * C:\OOHG\doc
  * C:\OOHG\ejemplos
  * C:\OOHG\fmt
  * C:\OOHG\ide
  * C:\OOHG\samples
* Hacer clic en "Clone".
9. Reconstruir las librerías (ver más abajo).

#### Para usuarios:

1. Ingresar a las páginas de los diferentes repositorios:
   * https://github.com/oohg/core
   * https://github.com/oohg/distros
   * https://github.com/oohg/doc
   * https://github.com/oohg/ejemplos
   * https://github.com/oohg/fmt
   * https://github.com/oohg/ide
   * https://github.com/oohg/samples
2. Hacer clic en el botón "Clone or download".
3. Hacer clic en "Download zip" y guardar en el disco local.
4. Desempaquetar el contenido en una carpeta auxiliar.
5. Copiar el contenido a la correspondiente carpeta en C:\OOHG.
6. Reconstruir las librerías (ver más abajo).


## Procedimiento para actualizar el compilador Harbour 3.2:

1. Descargar la versión Nightly de Harbour desde este enlace:
   https://sourceforge.net/projects/harbour-project/files/binaries-windows/nightly/harbour-nightly-win.exe/download
2. Instalar Harbour en C:\OOHG\HB32
3. En la carpeta C:\OOHG\SOURCE crear un archivo de texto llamado CLEAN.BAT con el siguiente contenido:
      SET PATH=C:\OOHG
      SET HG_HRB=
      SET HG_MINGW=
      SET HG_ROOT=
      SET LIB_GUI=
      SET LIB_HRB=
      CALL MAKELIB.BAT HB32
4. Abrir una Consola de Comandos en la carpeta C:\OOHG\SOURCE y ejecutar CLEAN.BAT
5. Reconstruir las librerías (ver más abajo).


## Procedimiento para reconstruir las librerías:

#### Método tradicional:

1. Abrir una ventana de comandos de Windows en la carpeta C:\OOHG\SOURCE.
2. Verificar que el PATH del sistema incluye C:\OOHG y que las siguientes variables de ambiente no están seteadas:
   * HG_HRB
   * HG_MINGW
   * HG_ROOT
   * LIB_GUI
   * LIB_HRB
   Si tiene dudas, puede crear y ejecutar un archivo llamado CLEAN.BAT con el siguiente contenido:
   >   SET PATH=C:\OOHG
   >   SET HG_HRB=
   >   SET HG_MINGW=
   >   SET HG_ROOT=
   >   SET LIB_GUI=
   >   SET LIB_HRB=
3. Ejecutar el comando
   * "MAKELIB.BAT HB30" para reconstruir utilizando los compiladores Harbour 3.0 y MinGW.
   * "MAKELIB.BAT HB32" para reconstruir utilizando los compiladores Harbour 3.2 y MinGW.
   * "MAKELIB.BAT XB"   para reconstruir utilizando los compiladores xHarbour    y BCC.
   * Para utilizar otros compiladores C deberá ajustar y utilizar uno de los archivos alternativos MAKELIB_BCC.BAT, MAKELIB_PC.BAT o MAKELIB_VC.BAT

#### Utilizando HBMK2 (solo HB30 y HB32):

1. Abrir una ventana de comandos de Windows en la carpeta C:\OOHG\SOURCE.
2. Ejecutar el comando
   * "BUILDLIB.BAT HB30" para reconstruir utilizando los compiladores Harbour 3.0 y MinGW.
   * "BUILDLIB.BAT HB32" para reconstruir utilizando los compiladores Harbour 3.2 y MinGW.
