## Procedure to install ooHG official distro:

1. Download the .ZIP file from http://sourceforge.net/projects/oohg/files/.
2. If you already have a C:\OOHG folder in your hard drive, it's strongly recommended that you delete, rename or move it to another folder to avoid problems and improve support.
3. Extract the content of the downloaded file to C:\ folder so its files are placed at C:\OOHG folder.
4. Add C:\OOHG to your system's PATH so you can build samples and applications using COMPILE.BAT batch command file.


## Procedures to update your copy with the latest changes:

#### For people who develop OOHG:

1. Download "Git" from https://git-scm.com/download and install it.
2. Download "GitHub Desktop" from https://desktop.github.com/ and install it.
3. Open GitHub Desktop.
4. Click on "Clone a repository" and then on "URL".
5. At "Repository ..." enter https://github.com/oohg/core.git
6. At "Local path" enter C:\OOHG (the folder must not exists).
7. Click on "Clone".
8. To download the other repositories (distros, doc, fmt, ide, samples):
   * Click on "File" menu.
   * Click option "Clone a repository".
   * Click on "URL".
   * At "Repository ..." enter the corresponding address
     * https://github.com/oohg/distros.git
     * https://github.com/oohg/doc.git
     * https://github.com/oohg/fmt.git
     * https://github.com/oohg/ide.git
     * https://github.com/oohg/samples.git
   * At "Local path" enter
     * C:\OOHG\distros
     * C:\OOHG\doc
     * C:\OOHG\fmt
     * C:\OOHG\ide
     * C:\OOHG\samples
   * Click on "Clone".
9. Rebuild the libraries (see below).

#### For people who uses OOHG to develop apps:

1. Access the repositories at:
   * https://github.com/oohg/core (1)
   * https://github.com/oohg/distros
   * https://github.com/oohg/doc
   * https://github.com/oohg/fmt
   * https://github.com/oohg/ide
   * https://github.com/oohg/samples
2. Click on button "Clone or download".
3. Click on "Download zip" and save the file to your local drive.
4. Unpack the content of the file into an auxiliary folder.
5. Copy the content to the matching folder into C:\OOHG.
   (1) Do not copy "core" folder to C:\OOHG, just copy it's content.
6. Rebuild the libraries (see below).


## Procedure to update Harbour HB32's compiler:

1. Download Harbour's nightly version from this link:
   https://sourceforge.net/projects/harbour-project/files/binaries-windows/nightly/harbour-nightly-win.exe/download
2. Install Harbour to C:\OOHG\HB32
3. Rebuild the libraries (see below).


## Procedure to rebuild ooHG's libraries:

#### Traditional method:

1. At folder C:\OOHG\SOURCE create a text file named CLEAN.BAT with the following commands:
   ```
      SET PATH=C:\OOHG
      SET HG_HRB=
      SET HG_MINGW=
      SET HG_ROOT=
      SET LIB_GUI=
      SET LIB_HRB=
   ```
2. Open a CMD window at C:\OOHG\SOURCE folder.
3. Execute CLEAN.BAT
4. Execute the command:
   * "MAKELIB.BAT HB30" to rebuild using Harbour 3.0 and MinGW compiler.
   * "MAKELIB.BAT HB32" to rebuild using Harbour 3.2 and MinGW compiler.
   * "MAKELIB.BAT XB"   to rebuild using xHarbour    and BCC   compiler.
   * To use another C compiler you must tweak and use one of the alternative files MAKELIB_BCC.BAT, MAKELIB_PC.BAT or MAKELIB_VC.BAT

#### To rebuild ooHG libraries using Harbour's 'hbmk2' tool (only for HB30 and HB32):

1. Open a CMD window at C:\OOHG\SOURCE folder.
2. Execute command
      "BUILDLIB.BAT HB30" to rebuild using Harbour 3.0 and MinGW compiler.
      "BUILDLIB.BAT HB32" to rebuild using Harbour 3.2 and MinGW compiler.
