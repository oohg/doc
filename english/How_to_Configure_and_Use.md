# How to configure and use

Let's assume you installed a prebuilt OOHG package at `C:\OOHG` folder.
If you choose another path, please substitute all instances of `C:\OOHG` with your chosen path.

#### The easiest way

If you are planning to build your apps with `COMPILE.BAT` or `BUILDAPP.BAT` batch files, all you need to do is add `C:\OOHG` to the system's PATH.

#### The hardest way

If you want to build your apps with `COMPILE.BAT` or `BUILDAPP.BAT` batch files but using tools not located at the default paths,
please take note that before building you must set the following environment variables:

* If your OOHG libraries are located at folder C:\OOHG\MYLIBS then:
```
set LIB_GUI=MYLIBS
```

* If your (x)Harbour compiler is located at folder C:\MYHARBOUR then:
```
set HG_HRB=D:\MYHARBOUR
```

* If your (x)Harbour compiler binaries are located at folder D:\MYHARBOUR\BIN" then:
```
set BIN_HRB=BIN
```

* If your (x)Harbour compiler libraries are located at folder C:\MYHARBOUR\LIBS\WIN then:
```
set LIB_HRB=LIBS\WIN
```

* If your C compiler is located at C:\MYCCOMP then:
```
set HG_CCOMP=D:\MYCCOMP
```

## Basic procedure to build an app:

1. Open a `CMD` window and check that your environment is configured properly.
2. Change to the folder where your source code (*.prg files) resides.
3. Execute this command:
```
compile myApp [options]
```
4. Available options are (options must be separated by spaces, / can be replaced by -):
* /P | to create a preprocessor's output file (.ppo file).
* /C | create a console or mixed mode app.
* /D | to include Harbour's debugger in your app.
* /S | to run silently.
* /V | to run verbosely.
* /L | to send output to oohglog.txt file (also /LOG).
* /W3 | to set (x)Harbour warning level to its maximum.
* /NR | to build without running (also /NORUN).
* /NORC | to exclude resource file

#### Notes:

* If the app has more than one source file (f.e.: `myApp.prg` and `myFuncs.prg`), to build it successfully you need to add at the end of `myApp.prg`:
```
#include "myFuncs.prg"
```
* To include a resource file (.rc) you must name it `myApp.rc` and place it at the same folder where `myApp.prg` is.
* To include an adicional resource file you must add at the end of `myApp.rc`:
```
#include "another.rc"
```
* By default, this building process automatically __includes__ ooHG's resource file (see file `OOHG.RC` at folder INCLUDE).
* If you have more than one OOHG version installed in the same folder, yo must specify which one has to be used. For that, use `compile version MYAPP`. For more details execute `COMPILE.BAT` without arguments.

## Alternative procedure to build an app using Harbour:

1. Use `BUILDAPP.BAT` instead of `COMPILE.BAT`.

#### Notes:

* Harbour's `HBMK2` utility will be used to build the app.
* All the notes for the basic procedure apply.
* With this procedure you can also use a `MYAPP.HBP` file detailing all the sources:
```
#include "MYAPP.PRG"
#include "MYFUNCS.PRG"
```
* If you have more than one OOHG version installed in the same folder, yo must specify which one has to be used. For that, use `buildapp version myApp`. For more details execute `BUILDAPP.BAT` without arguments.

## Another alternative procedure to build an app using Harbour:

1. Add to the system's PATH the folder where Harbour binaries are located.
2. Add to the system's PATH the folder where the C compiler is located.
3. Copy `BUILD_GUI.HBP` (for GUI or mixed mode) or `BUILD_CON.HBP` (for console mode) to your working folder as `myapp.hbp` and configure it.
4. Open a `CMD` window and execute this command:
```
HBMK2 MYAPP.HBP
```

## And yet another alternative procedure to build an app using Harbour:

1. Open a `CMD` window and execute these commands:
```
SET HG_ROOT=C:\OOHG
SET LIB_GUI=LIB\HB\MINGW
PATH %HG_ROOT%;%HG_ROOT%\HB32\BIN;%HG_ROOT%\HB32\MINGW;"%PATH%"
HBMK2 myprg %HG_ROOT%\OOHG.HBC
```

#### Notes:

* If your app needs a resouce file, you can add one at the section `# Source` of the .HBP file.
* To include an adicional resource file, you must add at the end of the .rc file:
```
#include "another.rc"
```
* By default, this building process does not include `OOHG.RC` resource file.
* If your app needs its resources you must explicitly add the file by one of the aformentioned methods and using its full name: `C:\OOHG\RESOURCES\OOHG.RC`.
