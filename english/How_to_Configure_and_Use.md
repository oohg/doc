# How to configure the development environment

## Setting the root folder

For the rest of this document let's assume you installed an OOHG package at `C:\OOHG` folder.

The first configuration step is to add the following environment variable:
```
SET HG_ROOT=C:\OOHG
```

## To use the batch construction tools included in an unmodified prebuilt OOHG package

Add `C:\OOHG` to the system's PATH.

## To use the unmodified batch construction tools with a customized OOHG package

Add `C:\OOHG` to the system's PATH and set the following environment variables:
* If the OOHG libraries are located at folder C:\OOHG\MYLIBS then:
```
SET LIB_GUI=MYLIBS
```
* If the (x)Harbour compiler is located at folder C:\MYHARBOUR then:
```
SET HG_HRB=D:\MYHARBOUR
```
* If the (x)Harbour compiler binaries are located at folder D:\MYHARBOUR\BIN" then:
```
SET BIN_HRB=BIN
```
* If the (x)Harbour compiler libraries are located at folder C:\MYHARBOUR\LIBS\WIN then:
```
SET LIB_HRB=LIBS\WIN
```
* If the C compiler is located at C:\MYCCOMP then:
```
SET HG_CCOMP=D:\MYCCOMP
```

## To use Harbour's HBMK2.EXE construction tool with an unmodified prebuilt OOHG package

For HM32 flavor, set the following environment variables:
```
SET LIB_GUI=LIB\HB\MINGW
SET HG_HRB=%HG_ROOT%\HB32
SET BIN_HRB=BIN
SET LIB_HRB=LIB\WIN\MINGW
SET HG_CCOMP=%HG_ROOT%\%HG_HRB%\COMP\MINGW
```
For HM3264 flavor, set the following environment variables:
```
SET LIB_GUI=LIB\HB\MINGW64
SET HG_HRB=%HG_ROOT%\HB3264
SET BIN_HRB=BIN
SET LIB_HRB=LIB\WIN\MINGW64
SET HG_CCOMP=%HG_ROOT%\%HG_HRB%\COMP\MINGW
```
Finally, add to the system's PATH the folder where the Harbour's binaries are located and the folder where the C compiler is located.
```
PATH %HG_ROOT%\%HG_HRB%\%BIN_HRB%;%HG_CCOMP%;%PATH%
```

## To use Harbour's HBMK2.EXE construction tool with a customized OOHG package

Set the aformentioned environment variables to your customized paths.
Add to the system's PATH the folder where the Harbour's binaries are located and the folder where the C compiler is located (see previous sections).

# How to build and app

## Using `COMPILE.BAT`

1. Open a `CMD` window and check that your environment is configured properly.
2. Change to the folder where your source code (*.prg files) resides.
3. Execute this command:
```
compile myApp [options]
```
4. myApp must be a .prg file with or without the extension.
5. Available options are (options must be separated by spaces, / can be replaced by -):
* /P | to create a preprocessor's output file (.ppo file).
* /C | create a console or mixed mode app.
* /D | to include Harbour's debugger in your app.
* /S | to run silently.
* /V | to run verbosely.
* /L | to send output to oohglog.txt file (also /LOG).
* /W3 | to set (x)Harbour warning level to its maximum.
* /NR | to build without running (also /NORUN).
* /NORC | to exclude OOHG's resource file

#### Notes:

* If the app has more than one source file (f.e.: `myApp.prg` and `myFuncs.prg`), to build it successfully you need to add at, the end of `myApp.prg`:
```
#include "myFuncs.prg"
```
* To include a resource file (.rc) you must name it `myApp.rc` and place it at the same folder where `myApp.prg` is.
* To include an adicional resource file you must add at the end of `myApp.rc`:
```
#include "another.rc"
```
* By default, this building process automatically includes ooHG's resource file (see file `OOHG.RC` at folder INCLUDE).
* If you have more than one OOHG flavor installed in the same folder, you must specify which one has to be used. For that, use `compile version MYAPP`. For more details execute `COMPILE.BAT` without arguments.

## Using `BUILDAPP.BAT` (based on Harbour's `HBMK2.EXE` utility)

1. Open a `CMD` window and check that your environment is configured properly.
2. Change to the folder where your source code (*.prg files) resides.
3. Execute this command:
```
buildapp myApp [options]
```
4. myApp must be a .prg or .hbp file with or without the extension.
5. Available options are (options must be separated by spaces, / can be replaced by -):
* /SL | to suppress the creation of the log.
* /NR | to build without running (also /NORUN).
* /GTWIN | to create a console or mixed mode app.
* /NOHBC | to build without including OOHG.HBC
* /NORC | to exclude OOHG's resource file
* -rebuild | to force the compilation of all the sources.
* Other options supported by HBMK2.EXE
6. You can use `BUILD_GUI.HBP` (for GUI or mixed mode) or `BUILD_CON.HBP` (for console mode) if you need a template for you app.

## Using Harbour's `HBMK2.EXE` utility

1. Open a `CMD` window and check that your environment is configured properly.
2. Change to the folder where your source code (*.prg files) resides.
3. Execute this command:
```
HBMK2 myApp [options]
```
4. myApp must be a .prg or .hbp file with or without the extension.
5. To learn about the available options please read Harbour's documentation.
6. You can use `BUILD_GUI.HBP` (for GUI or mixed mode) or `BUILD_CON.HBP` (for console mode) if you need a template for you app.
7. You can add the file OOHG.HBC (located at C:\OOHG folder) to your .hbp file or to the command line to set the needed parameters for building you app with OOHG libraries.
8. If your app needs a resource file, you can add **one** at the section `# Source` of the .hbp file or at the command line.
9. To include an aditional resource file, you must add at the end of the first .rc file:
```
#include "another.rc"
```
10. If your app uses any of the OOHG resources you must add `C:\OOHG\RESOURCES\OOHG.RC` file by one of the aformentioned methods.

# How to configure and use more than one version

You can install and use more than one flavor in the same system but be warned that you need to be extra careful when setting your environment to avoid errors.
If you really need this kind of installation then the recommended way is to install all the versions to `C:\OOHG` and use `COMPILE.BAT` and `BUILDAPP.BAT` files to build your apps.
Note that, in order to build an app, you must use `compile flavor myApp` or `buildapp flavor myApp`.
Look at `COMPILE.BAT` or `BUILDAPP.BAT` to see the currently supported flavors.
