## How to configure and use

If you installed a prebuild OOHG package in C:\OOHG there's no need to change the default configuration.
Simply add C:\OOHG to the system's PATH and use one of the method described in the following sections.

* If OOHG package was installed in another folder (e.g. D:\XYZ), you must set the following environment variable, before using the compilation commands:
```
set HG_ROOT=D:\XYZ
```

* By default, OOHG package build with Harbour 3.0 uses the folder "LIB" to store it's libraries.
For OOHG package build with Harbour 3.2, "LIB\HB\WIN" is used.
To use a different folder (e.g. C:\OOHG\LIB\MYLIBS), set the following environment variable, before using the compilation commands:
```
set LIB_GUI=LIB\MYLIBS
```

* By default, OOHG package uses a bundled version of Harbour to compile projects.
To use a different version of Harbour (e.g. installed in D:\MYHRB), set the following environment variable, before using the compilation commands:
```
set HG_HRB=D:\MYHRB
```

* If the new version stores it's libraries in a folder different than "D:\MYHRB\LIB" (e.g. at D:\MYHRB\LIB\MYLIBS), set the following environment variable, before using the compilation commands:
```
set LIB_HRB=D:\MYHRB\LIB\MYLIBS
```

* If the new version stores it's binaries in a folder different than "D:\MYHRB\BIN" (e.g. at D:\MYHRB\BIN\WIN\MINGW), set the following environment variable, before using the compilation commands:
```
set BIN_HRB=D:\MYHRB\BIN\WIN\MINGW
```

* By default, OOHG package uses a bundled version of MinGW to compile projects. To use a different version of MinGW (e.g. installed in D:\MYMINGW), set the following environment variable, before using the compilation commands:
```
set HG_MINGW=D:\MYMINGW
```

* To use Borland C++ compiler instead of MinGW, edit C:\OOHG\COMPILE.BAT and replace its content with:
```
   @echo off
   cls
   rem *** Set Paths ***
   if "%HG_ROOT%"=="" set HG_ROOT=c:\oohg
   rem *** Call Compiler Specific Batch File ***
   call %HG_ROOT%\compile_bcc.bat %1 %2 %3 %4 %5 %6 %7 %8 %9
```

If the compiler is not installed at C:\BORLAND\BCC55 (e.g. at D:\MYBCC), set the following environment variable before using the compilation commands:
```
set HG_BCC=D:\MYBCC
```

* To use Pelles C compiler instead of MinGW, edit C:\OOHG\COMPILE.BAT and replace its content with:
```
   @echo off
   cls
   rem *** Set Paths ***
   if "%HG_ROOT%"=="" set HG_ROOT=c:\oohg
   rem *** Call Compiler Specific Batch File ***
   call %HG_ROOT%\compile_pc.bat %1 %2 %3 %4 %5 %6 %7 %8 %9
```

If the compiler is not installed at C:\PELLESC (e.g. at D:\PCC), set the following environment variable before using the compilation commands:
```
set HG_PC=D:\PCC
```

To use Microsoft Visual Studio 9.0 compiler instead of MinGW, edit C:\OOHG\COMPILE.BAT and replace its content with:
```
   @echo off
   cls
   rem *** Set Paths ***
   if "%HG_ROOT%"=="" set HG_ROOT=c:\oohg
   rem *** Call Compiler Specific Batch File ***
   call %HG_ROOT%\compile_vc.bat %1 %2 %3 %4 %5 %6 %7 %8 %9
```

If the compiler is not installed at %PROGRAMFILES%\MICROSOFT VISUAL STUDIO 9.0\vc (e.g. at D:\VS9), set the following environment variable before using the compilation commands:
```
set HG_VC=D:\VS9
```


## Basic procedure to build and app:

1. Be sure that the system's PATH includes C:\OOHG folder, if not you must add it.
2. Open a CMD window and change to the folder where your souce code (*.prg files) resides.
3. Execute this command:
   ```
   compile myApp
   ```
4. To create a preprocessor's output file (.ppo file) use this command instead:
   ```
   compile myApp /p
   ```
5. If your app is intented to run in console use this command instead:
   ```
   compile myApp /c
   ```
6. If you want to include Harbour's debugger use this command instead:
   ```
   compile myApp /d
   ```

#### Notes:

* If the app has more than one source file (e.g.: myApp.prg and myFuncs.prg), to build it successfully you need to add at the end of myApp.prg:
   ```
   #include "myFuncs.prg"
   ```
* To include a resource file (.rc) you must name it myApp.rc and place it at the same folder where myApp.prg is.
* To include an adicional resource file you must add at the end of myApp.rc:
   ```
   #include "another.rc"
   ```
* By default, this building process automatically __includes__ ooHG's resource file (see file oohg.rc at include folder).
* This method also works for distros based on xHarbour and BCC.
* If you have more than one OOHG version installed in the same folder, yo must specify which one has to be used. For that, use "compile version myApp". For more details execute "compile" without arguments.


## Alternate procedure to build and app using Harbour and MinGW:

1. Use "buildapp" instead of "compile".

#### Notes:

* Harbour's HBMK2 utility will be used to build the app.
* All the basic procedure's notes apply.
* With this procedure you can also use a myApp.hbp file detailing  all the sources:
   ```
   #include "myApp.prg"
   #include "myFuncs.prg"
   ```
* If you have more than one OOHG version installed in the same folder, yo must specify which one has to be used. For that, use "buildapp version myApp". For more details execute "buildapp" without arguments.


## Another alternate procedure to build and app using Harbour and MinGW:

1. Be sure that the system's PATH includes C:\OOHG\HB30\BIN and C:\OOHG\HB30\COMP\MINGW\BIN for Harbour 3.0 distro, or C:\OOHG\HB32\BIN and C:\OOHG\HB32\COMP\MINGW\BIN for Harbour 3.2 distro.
2. If your app is intented to run in GUI or mixed mode, copy BUILD_GUI.HBP file to the folder where the source files are located.
3. Open a CMD window and change to the folder.
4. Execute this command:
   ```
   HBMK2 BUILD_GUI.HBP
   ```
5. If your app is intented to run in console mode, copy BUILD_CON.HBP file to the folder where the source files are located.
6. Open a CMD window and change to the folder.
7. Execute this command:
   ```
   HBMK2 BUILD_CON.HBP
   ```

#### Notes:

* You can add a resouce file at the section '# Source' of the .HBP file, if your app needs one.
* To include an adicional resource file you must add at the end of the .rc file:
   ```
   #include "another.rc"
   ```
* By default, this building process does not automatically __includes__ ooHG's resource file (see file oohg.rc at include folder).
* If the app needs the resources of this file you must add it by one of the aformentioned methods and using its full name (C:\OOHG\RESOURCES\OOHG.RC).
