## Procedure to install OOHG official distro:

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


## Procedure to update (x)Harbour compiler:

1. Harbour 3.0 has no new version so do not try to update it.
2. Harbour 3.2 32 bits: download the 'nightly' version from
   https://sourceforge.net/projects/harbour-project/files/binaries-windows/nightly/harbour-nightly-win.exe/download
   * Install into C:\OOHG\HB32 and rebuild the libraries (see below).
3. Harbour 3.2 64 bits: download from
   http://www.whosaway.com/
   * Install into C:\OOHG\HB32 and rebuild the libraries (see below).
4. Harbour 3.4 32 and 64 bits: download from
   https://github.com/vszakats/harbour-core/releases/download/v3.4.0dev/harbour-snapshot-win.7z
   * Install into C:\OOHG\HB34 and rebuild the libraries (see below).
   * Note that this package includes both versions.
5. xHarbour for BCC 5.5.1 and BCC 5.8.2: download from
   http://www.whosaway.com/
   * Install into C:\OOHG\xhbcc.
   * Note that these packages do not include the BCC compiler.
   * You can download then from
   http://www.whosaway.com/
5. xHarbour for MinGw: download from
   http://www.whosaway.com/
   * Install into C:\OOHG\xhmingw and rebuild the libraries (see below).


## Procedure to rebuild OOHG's libraries:

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
   * "MAKELIB.BAT HM30"   to rebuild using Harbour 3.0 and MinGW compiler.
   * "MAKELIB.BAT HM32"   to rebuild using Harbour 3.2 32 bits and MinGW compiler.
   * "MAKELIB.BAT HM3264" to rebuild using Harbour 3.2 64 bits and MinGW compiler.
   * "MAKELIB.BAT HM34"   to rebuild using Harbour 3.4 32 bits and MinGW compiler.
   * "MAKELIB.BAT HM3464" to rebuild using Harbour 3.4 64 bits and MinGW compiler.
   * "MAKELIB.BAT XB55"   to rebuild using xHarbour and BCC 5.5.1 compiler.
   * "MAKELIB.BAT XB58"   to rebuild using xHarbour and BCC 5.8.2 compiler.
   * "MAKELIB.BAT XM"     to rebuild using xHarbour and MinGW compiler.
   * To use another C compiler you must tweak and use one of the alternative files MAKELIB_BCC.BAT, MAKELIB_PC.BAT or MAKELIB_VC.BAT

#### To rebuild OOHG libraries using Harbour's 'hbmk2' tool (only for Harbour based distros):

1. Open a CMD window at C:\OOHG\SOURCE folder.
2. Execute command
      "BUILDLIB.BAT HB30"   to rebuild using Harbour 3.0 and MinGW compiler.
      "BUILDLIB.BAT HB32"   to rebuild using Harbour 3.2 32 bits and MinGW compiler.
      "BUILDLIB.BAT HB3264" to rebuild using Harbour 3.2 64 bits and MinGW compiler.
      "BUILDLIB.BAT HB34"   to rebuild using Harbour 3.4 32 bits and MinGW compiler.
      "BUILDLIB.BAT HB3464" to rebuild using Harbour 3.4 64 bits and MinGW compiler.
