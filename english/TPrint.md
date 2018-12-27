## TPRINT Class

### oTPrintObject := TPRINT( cPrintLibrary )

The function call initializes the class and establishes the printing library to be used by the class. Returns an object that allows the configuration, creation and filing of a print job.

cPrintLibrary available values are:

* HBPRINTER: to print using HBprinter library.
* MINIPRINT: to print using Miniprint library.
* DOSPRINT: to print to a DOS printer.
* TXTPRINT: to generate a text file.
* EXCELPRINT: to generate an Excel file (Excel must be installed).
* CALCPRINT: to generate an OpenOffice Calc file (OpenOffice must be installed).
* RTFPRINT: to generate an RTF file.
* CSVPRINT: to generate a CSV file.
* HTMLPRINT: to generate an HTML file using EXCEL (default) or Calc.
* HTMLPRINTFROMCALC: to generate an HTML file using Calc (OpenOffice must be installed).
* HTMLPRINTFROMEXCEL: to generate an HTML file using Excel (Excel must be installed).
* PDFPRINT: to generate a PDF file.
* RAWPRINT: to print to a printer spool using binary format.
* SPREADSHEETPRINT: to generate an Excel file using BIFF format (no Excel nor OpenOffice needed).

When omited, cPrintLibrary defaults to the value of \_OOHG\_PrintLibrary global variable.
\_OOHG\_PrintLibrary also sets the default printing library for "Report form", "Edit" and "Edit Extended" commands.
The starting values of \_OOHG\_PrintLibrary is "MINIPRINT".

### Main methods

Note: All the parameters of all the methods are optional.

::Init()

Initializes the variables needed by the library.

::SelPrinter( lSelect, lPreview, lLandscape, nPaperSize, cPrinterX, lShow, nRes, nBin )

Initializes the printer.

    lSelect    = .T. shows a dialog for printer selection (default), .F. means use the system's default printer.
    lPreview   = .T. shows the output before printer (default), .F. prints without showing.
    lLandscape = .T. sets landscape printing, .F. sets portrait painting (default).
    nPaperSize = a constant that sets the paper's size (see below).
    cPrinterX  = sets the output printer by its name when you don't want to use the default printer nor select one using the dialog.
    lShow      = .T. shows a splash screen while the printing (default), .F. prints without showing.
    nRes       = sets the printer's resolución, defaults to PRINTER_RES_MEDIUM.
    nBin       = sets the printer's input tray (defaults to NIL meaning use printer's default tray).

::BeginDoc( cName )

Signals the start of the document.

    cName = document's and output file's names, defaults to library's name. To save the file in a specific folder add the path to cName.

::SetPreviewSize( nValue )

Sets the size of the HBPRINTER's preview (it has no effect on other libraries).

    nValue = 1 small,  2 a little bigger than 1, 3 a little bigger than 2, etc.

::BeginPage()

Signals the start of a new page.

::PrintData( nRow, nCol, uData, cFontName, nFontSize, lBold, aColor, cAlign, nWidth )

Prints data.

    nRow      = row where the data must be placed at the document.
    nCol      = column where the data must be placed at the document.
    uData     = data to print.
    cFontName = name of the font to print the data with, defaults to current font or Courier New.
    nFontSize = size of the font to print the data with, defaults to current size or 12 points.
    lBold     = .T. to set the font's bold attribute, defaults to .F.
    aColor    = color to print the data with.
    cAlign    = data position into the printing zone (nCol to nCol + nWidth), use "L" (default), "C" or "R" for left, center or right.
    nWidth    = size of the printing zone, defaults to 15.

::PrintImage( nRowFrom, nColFrom, nRowTo, nColTo, cName )

Prints an image from file.

    nRowFrom = starting row.
    nColFrom = starting col.
    nRowTo   = ending row.
    nColTo   = ending col.
    cName    = filename of the image to print.

::PrintLine( nRowFrom, nColFrom, nRowTo, nColTo, aColor, nPenWidth )

Prints a line. Note that DOSPRINT only prints a line if nRowTo equals nRowFrom.

    nRowFrom  = starting row.
    nColFrom  = starting col.
    nRowTo    = ending row.
    nColTo    = ending col.
    aColor    = color to print the line with.
    nPenWidth = line width, defaults to 1.

::PrintRectangle( nRowFrom, nColFrom, nRowTo, nColTo, aColor, nPenWidth )

Prints a rectangle.

    nRowFrom  = starting row.
    nColFrom  = starting col.
    nRowTo    = ending row.
    nColTo    = ending col.
    aColor    = color to print the rectangle with.
    nPenWidth = line width, defaults to 1.

::PrintRoundRectangle(nfila, ncol, nfilaf, ncolf, atcolor, ntwpen)

Prints a rectangle width rounded corners.

    nRowFrom  = starting row.
    nColFrom  = starting col.
    nRowTo    = ending row.
    nColTo    = ending col.
    aColor    = color to print the rectangle with.
    nPenWidth = line width, defaults to 1.

::SetColor( aColor )

Sets the default printing color.

    aColor = color to print with.

::GetDefPrinter()

Gets the name of the default printer.

::SetUnits( cUnits )

Sets the printing positioning unit.

    cUnits = "MM" or "ROWCOL" (default).

::EndPage()

Signals the end of a page.

::EndDoc()

Signals the end of a document.

::Release()

Releases the TPRINT object freeing all the allocated resources.

::Version()

Returns a string containing the version code of the TPrint class.

::SetLMargin( nLMar )

Sets the left margin of the document.

    nLMar = width of the left margin.

::SetTMargin( nTMar )

Sets the top margin of the document.

    nTMar = width of the top margin.

::SetFont( cFont, nSize, aColor, lBold, lItalic )

Sets the default font.

    cFont   = font name.
    nSize   = font size.
    aColor  = font color.
    lBold   = .T. to set the font's bold attribute.
    lItalic = .T. to set the font's italic attribute.

::SetCPL( nCPL )

Sets the font's size using the number of character per line.

    nCPL = 60, 80, 96, 120, 140 or 160 to set size to 14, 12, 10, 8, 7 or 6 points.

::PrintBarCode( nRow, nCol, cBarcode, cType, aColor, lHorizontal, nWidth, nHeight )

Prints a barcode.

    nRow        = row to print at.
    nCol        = column to print at.
    cBarcode    = barcode to print.
    cType       = code type.
    aColor      = color to print with.
    lHorizontal = .T. for horizontal printing (default), .F. for vertical printing.
    nWidth      = width of the bars.
    nHeight     = height of the bars.

:SetProp( lMode )

Sets the reference to use to define the rows height.

    lMode = .T. means height is proportional to the current font size, .F. means is proportional to size 10 (default).

### Important variables

<table>
  <tr>
    <td>::aPrinters</td>
    <td>Array with the system's available printers.</td>
  </tr>
  <tr>
    <td>::aPorts</td>
    <td>Array with the system's available ports.</td>
  </tr>
  <tr>
    <td>::lPrError</td>
    <td>.T. if an error has occurred in a method.</td>
  </tr>
  <tr>
    <td>::aColor</td>
    <td>Color of the current pen used for drawing lines and boxes, defaults to black.</td>
  </tr>
  <tr>
    <td>::cFontName</td>
    <td>Name of the current font, defaults to "Courier New".</td>
  </tr>
  <tr>
    <td>::nFontSize</td>
    <td>Size of the current font, defaults to 10.</td>
  </tr>
  <tr>
    <td>::aFontColor</td>
    <td>Color of the current font, defaults to black.</td>
  </tr>
  <tr>
    <td>::lFontBold</td>
    <td>.T. if the current font has bold attribute.</td>
  </tr>
  <tr>
    <td>::lFontTtalic</td>
    <td>.T. if the current font has italic attribute.</td>
  </tr>
  <tr>
    <td>::cVersion</td>
    <td>Class version number.</td>
  </tr>
</table>

### Paper size

See miniprint.ch, i_report.ch or winprint.ch

Note that not all the sizes are supported by all the different Windows versions, see wingdi.h at the C compiler's include folder.
