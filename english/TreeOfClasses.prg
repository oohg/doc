/*
 * $Id: TreeOfClasses.prg $
 */
/*
 * Reads classes.md and shows the tree of classes in a a Tree control
 * Author: Fernando Yurisich <fyurisich@oohg.org>
 * Licensed under The Code Project Open License (CPOL) 1.02
 * See <http://www.codeproject.com/info/cpol10.aspx>
 */

#include "oohg.ch"

FUNCTION Main()

   SET EXACT ON

   DEFINE WINDOW MainForm ;
      OBJ oMainForm ;
      AT 0,0 ;
      WIDTH 648 ;
      HEIGHT 188 ;
      TITLE "Tree of ooHG's Classes" ;
      MAIN ;
      ON SIZE MainFormResize( oMainForm ) ;
      ON INIT {|| MainFormResize( oMainForm ), ;
                  Populate( oMainForm ), ;
                  oMainForm:lbl_wait:Visible := .F. , ;
                  oMainForm:Classes:Visible := .T. }

      @ 80, 10 LABEL lbl_wait ;
         VALUE "Working, please wait ..." ;
         CENTER ;
         BOLD ;
         SIZE 18 ;
         TRANSPARENT ;
         INVISIBLE ;
         HEIGHT 40 ;
         WIDTH oMainForm:ClientWidth - 20

      DEFINE TREE Classes ;
         AT 20,20 ;
         WIDTH 600 ;
         HEIGHT 400 ;
         ITEMIDS ;
         INVISIBLE ;
         FONT "Courier New"

      END TREE

      ON KEY ESCAPE ACTION oMainForm:Release()

   END WINDOW

   oMainForm:Center()
   oMainForm:activate()

RETURN NIL

/*
 * Size and place controls whenever the form's size is changed
 */
FUNCTION MainFormResize( oMainForm )

   LOCAL TitleHeight  := GetTitleHeight()
   LOCAL BorderHeight := GetBorderHeight()
   LOCAL ScreenDPI    := GetScreenDPI()

   WITH OBJECT oMainForm
      IF :Width < Int( 388 * ScreenDPI / 96 )
        :Width := Int( 388 * ScreenDPI / 96 )
      ENDIF

      IF :Height < Int( 388 * ScreenDPI / 96 )
         :Height := Int( 388 * ScreenDPI / 96 )
      ENDIF

      :Classes:Width  := :Width - ( BorderHeight * 2 ) - Int( 40 * ScreenDPI / 96 )
      :Classes:Height := :Height - TitleHeight - ( BorderHeight * 2 ) - Int( 40 * ScreenDPI / 96 )
   END WITH

RETURN NIL

/*
 * Populate tree with classes' information from classes.md file
 */
FUNCTION Populate( oMainForm )

   LOCAL oFile, cLine, cRest, i, j, cClassName, cParentClass
   LOCAL nClassId, nParentId, aTreeItems, aOrphans, nPos
   LOCAL cDataName, cMethodName, lNew, cOthers, aItems

   IF MSGYESNO( "Rebuild CLASSES.MD ?" )
      oMainForm:lbl_wait:Visible := .T.
      IF Rebuild()
         RETURN NIL
      ENDIF
   ELSE
      oMainForm:lbl_wait:Visible := .T.
   ENDIF

   oFile := TFileRead():New( "CLASSES.MD" )

   oFile:Open()

   IF oFile:Error()
      MSGSTOP( oFile:ErrorMsg( "FileRead: " ), "Tree of ooHG's Classes, msg #1" )
      oMainForm:Release()
   ELSE
      aTreeItems := {}          // Names of the items added to the tree control. Array index is the item's Id.
      aOrphans   := {}          // Items with parent not yet added to the tree control.
      nClassId   := 0           // Id of the last class added to the tree control (0 means orphaned class or no class).
      cClassName := ""          // Name of the last class added to tree control ("" means no class).
      cOthers    := ""          // For cases when the FROM clause contains more than one class.

      DO WHILE oFile:MoreToRead()
         cLine := AllTrim( oFile:ReadLine() )
         
         /*
          * Just process the lines with the the following structures:
          *    CLASS <ClassName>
          *    CLASS <ClassName> FROM <ParentClassName>
          *    DATA <DataName> [ <Additional information> ]
          *    METHOD <MethodName> [ <Additional information> ]
          *    ENDCLASS
          */

         IF Upper( Left( cLine, 6 ) ) == "CLASS " .OR. Upper( Left( cLine, 13 ) ) == "CREATE CLASS "
            IF Upper( Left( cLine, 13 ) ) == "CREATE CLASS "
               cRest := LTrim( SubStr( cLine, 14 ) )
            ELSE
               cRest := LTrim( SubStr( cLine, 7 ) )
            ENDIF

            i := At( " ", cRest )
            IF i > 0
              cClassName := Left( cRest, i - 1 )
              cRest      := SubStr( cRest, i + 1 )
            ELSE
               cClassName := cRest
               cRest      := ""
            ENDIF

            IF AScan( aTreeItems, cClassName ) > 0
               MSGSTOP( "CLASS " + cClassName + " already defined.", "Tree of ooHG's Classes, msg #2" )
               oMainForm:Release()
               RETURN NIL
            ENDIF

            IF Upper( Left( cRest, 5 ) ) == "FROM "
               cParentClass := LTrim( SubStr( cRest, 6 ) )

               IF Right( cParentClass, 7 ) == " STATIC"
                  cParentClass := Left( cParentClass, Len( cParentClass ) - 7 )
               ENDIF

               nPos := At( ",", cParentClass )
               IF nPos > 0
                  /*
                   * Class has more than one parent
                   */
                  cOthers := AllTrim( SubStr( cParentClass, nPos + 1 ) )
                  aItems  := {}

                  cParentClass := AllTrim( Left( cParentClass, nPos - 1) )
               ENDIF

               nParentId := AScan( aTreeItems, cParentClass )
               IF nParentId > 0
                  AAdd( aTreeItems, cClassName )
                  nClassId := Len( aTreeItems )

                  oMainForm:Classes:AddItem( cClassName, nParentId, nClassId )
               ELSE
                  /*
                   * When class parent isn't defined yet
                   * add class to the orphaned list.
                   * This list contains class' name, class' parent,
                   * an array of class' datas and methods and a flag
                   * indicating if cClassName must be unique.
                   */
                  AAdd( aOrphans, { cClassName, cParentClass, {}, Empty( cOthers ) } )
                  nClassId := 0
               ENDIF
            ELSE
               AAdd( aTreeItems, cClassName )
               nClassId := Len( aTreeItems )

               oMainForm:Classes:AddItem( cClassName, NIL, nClassId )
            ENDIF
         ELSEIF Upper( Left( cLine, 5 ) ) == "DATA " .OR. ;
                Upper( Left( cLine, 7 ) ) == "METHOD " .OR. ;
                Upper( Left( cLine, 8 ) ) == "MESSAGE " .OR. ;
                Upper( Left( cLine, 9 ) ) == "DELEGATE " .OR. ;
                ( Upper( Left( cLine, 6 ) ) == "ERROR " .AND. Upper( Left( LTrim( SubStr( cLine, 7 ) ), 8 ) ) == "HANDLER " )
            IF Empty( cClassName )
               MSGSTOP( "Found " + Chr( 13 ) + Chr( 10 ) + cLine + Chr( 13 ) + Chr( 10 ) + "without associated class.", "Tree of ooHG's Classes, msg #3" )
               oMainForm:Release()
               RETURN NIL
            ELSE
               IF AScan( aTreeItems, cClassName + cLine ) > 0
                  MSGSTOP( cLine + Chr( 13 ) + Chr( 10 ) + " already defined in CLASS " + Chr( 13 ) + Chr( 10 ) + cClassName + ".", "Tree of ooHG's Classes, msg #4" )
                  oMainForm:Release()
                  RETURN NIL
               ENDIF

               IF nClassId > 0
                  AAdd( aTreeItems, cClassName + cLine )

                  oMainForm:Classes:AddItem( cLine, nClassId, Len( aTreeItems ) )
               ELSE
                  AAdd( aOrphans[ Len( aOrphans ), 3 ], cLine )
               ENDIF

               IF ! Empty( cOthers )
                  AAdd( aItems, cLine )
               ENDIF
            ENDIF
         ELSEIF Upper( Left( cLine, 8 ) ) == "ENDCLASS"
            DO WHILE ! Empty( cOthers )
               nPos := At( ",", cOthers )
               IF nPos > 0
                  cParentClass := AllTrim( Left( cOthers, nPos - 1 ) )
                  cOthers      := AllTrim( SubStr( cOthers, nPos + 1 ) )
               ELSE
                  cParentClass := cOthers
                  cOthers    := ""
               ENDIF

               nParentId := AScan( aTreeItems, cParentClass )
               IF nParentId > 0
                  AAdd( aTreeItems, cClassName )
                  nClassId := Len( aTreeItems )

                  oMainForm:Classes:AddItem( cClassName, nParentId, nClassId )
               ELSE
                  /*
                   * When class parent isn't defined yet
                   * add class to the orphaned list.
                   * This list contains class' name, class' parent,
                   * an array of class' datas and methods and a flag
                   * indicating if cClassName must be unique.
                   */
                  AAdd( aOrphans, { cClassName, cParentClass, {}, .F. } )
                  nClassId := 0
               ENDIF

               FOR i := 1 TO Len( aItems )
                  IF nClassId > 0
                     AAdd( aTreeItems, cClassName + aItems[ i ] )

                     oMainForm:Classes:AddItem( aItems[ i ], nClassId, Len( aTreeItems ) )
                  ELSE
                     AAdd( aOrphans[ Len( aOrphans ), 3 ], aItems[ i ] )
                  ENDIF
               NEXT i
            ENDDO

            cClassName := ""
            nClassId   := 0
            aItems     := {}
         ENDIF
      ENDDO
      
      oFile:Close()
      
      /*
       * Add orphaned classes
       */
      DO WHILE Len( aOrphans ) > 0
         i := 1
         lNew := .F.

         DO WHILE i <= Len( aOrphans )
            IF aOrphans[ i, 4 ] .AND. AScan( aTreeItems, aOrphans[ i, 1 ] ) > 0
               MSGSTOP( "CLASS " + aOrphans[ i, 1 ] + " already defined.", "Tree of ooHG's Classes, msg #5" )
               oMainForm:Release()
               RETURN NIL
            ENDIF

            /*
             * Check if parent is in the tree control
             */
            nParentId := AScan( aTreeItems, aOrphans[ i, 2 ] )
            IF nParentId > 0
               /*
                * If it is, add class to tree
                */
               AAdd( aTreeItems, aOrphans[ i, 1 ] )
               nClassId := Len( aTreeItems )

               oMainForm:Classes:AddItem( aOrphans[ i, 1 ], nParentId, nClassId )
               
               /*
                * Add datas and methods
                */
               FOR j := 1 TO Len( aOrphans[ i, 3 ] )
                  IF aOrphans[ i, 4 ] .AND. AScan( aTreeItems, aOrphans[ i, 1 ] + aOrphans[ i, 3, j ] ) > 0
                     MSGSTOP( aOrphans[ i, 3, j ] + Chr( 13 ) + Chr( 10 ) + " already defined in CLASS " + Chr( 13 ) + Chr( 10 ) + aOrphans[ i, 1 ] + ".", "Tree of ooHG's Classes, msg #6" )
                     oMainForm:Release()
                     RETURN NIL
                  ENDIF

                  AAdd( aTreeItems, aOrphans[ i, 1 ] + aOrphans[ i, 3, j ] )

                  oMainForm:Classes:AddItem( aOrphans[ i, 3, j ], nClassId, Len( aTreeItems ) )
               NEXT

               lNew := .T.
               
               /*
                * Delete orphan
                */
               ADel( aOrphans, i )
               ASize( aOrphans, Len( aOrphans ) - 1 )
               
               /*
                * Restart from the first item in aOrphans
                */
               EXIT
            ELSE
               /*
                * If it's not, process next item in aOrphans
                */
               i ++
            ENDIF
         ENDDO
         
         IF ! lNew
            MSGSTOP( "CLASS " + aOrphans[ 1, 2 ] + " not defined.", "Tree of ooHG's Classes, msg #7" )
            oMainForm:Release()
            RETURN NIL
         ENDIF
      ENDDO

      IF Len( aTreeItems ) == 0
         MSGSTOP( "CLASSES.MD does not contains classes' data.", "Tree of ooHG's Classes, msg #8" )
         oMainForm:Release()
      ENDIF
   ENDIF

RETURN NIL

FUNCTION Rebuild

   LOCAL aClass, aFiles, aLines := {}, cClassName, cFile, cInput, cLine, cRoot, lIsOpen := .F., oFile
   LOCAL cWord2, cWord3, nPos

   IF Empty( cRoot := GetEnv( "HG_ROOT" ) )
      MSGSTOP( "HG_ROOT envvar is not set.", "Tree of ooHG's Classes, msg #9" )
      oMainForm:Release()
      RETURN .T.
   ENDIF
   cRoot += "\source\"
   aFiles := Array( ADir( cRoot + "*.prg" ) )
   ADir( cRoot + "*.prg", aFiles )

   FOR EACH cFile IN aFiles
      oFile := TFileRead():New( cRoot + cFile )

      oFile:Open()

      IF oFile:Error()
         MSGSTOP( oFile:ErrorMsg( "FileRead: " ), "Tree of ooHG's Classes, msg #10" )
         oMainForm:Release()
         RETURN .T.
      ENDIF

      DO WHILE oFile:MoreToRead()
         cInput := oFile:ReadLine()
         cLine := AllTrim( cInput ) + " "

         /*
          * Just process the lines with the the following structures:
          *    CLASS <ClassName>
          *    CLASS <ClassName> FROM <ParentClassName>
          *    DATA <DataName> [ <Additional information> ]
          *    METHOD <MethodName> [ <Additional information> ]
          *    ENDCLASS
          */

         IF Upper( Left( cLine, 6 ) ) == "CLASS " .OR. Upper( Left( cLine, 13 ) ) == "CREATE CLASS "
            IF lIsOpen
               MSGSTOP( "CLASS " + DQM( aClass[ 1 ] ) + " from " + DQM( cFile ) + "has no ENDCLASS.", "Tree of ooHG's Classes, msg #11" )
               AAdd( aLines, aClass )
            ELSE
               lIsOpen := .T.
            ENDIF
            IF Upper( Left( cLine, 6 ) ) == "CREATE CLASS "
               cInput := StrTran( cInput, "CREATE CLASS ", "CLASS ", 1, 1 )
            ENDIF
            aClass := { AllTrim( cInput ) }
         ELSEIF Upper( Left( cLine, 5 ) ) == "DATA " .OR. ;
                Upper( Left( cLine, 7 ) ) == "METHOD " .OR. ;
                Upper( Left( cLine, 8 ) ) == "MESSAGE " .OR. ;
                Upper( Left( cLine, 9 ) ) == "DELEGATE " .OR. ;
                ( Upper( Left( cLine, 6 ) ) == "ERROR " .AND. Upper( Left( LTrim( SubStr( cLine, 7 ) ), 8 ) ) == "HANDLER " )
            IF lIsOpen
               IF Upper( Left( cLine, 5 ) ) == "DATA "
                  cWord2 := LTrim( SubStr( cLine, 6 ) )
                  IF ( nPos := At( " ", cWord2 ) ) > 0
                     cWord3 := LTrim( SubStr( cWord2, nPos ) )
                     cWord2 := Left( cWord2, nPos - 1 )
                  ELSE
                     cWord3 := ""
                  ENDIF
                  cInput := "DATA " + RTrim( cWord2 )
                  IF Len( cInput ) + 3 < 48
                     cInput += Space( 48 - 3 - Len( cInput ) )
                  ENDIF
                  IF Right( cInput, 1 ) # " "
                     cInput += " "
                  ENDIF
                  cInput += cWord3
                  AAdd( aClass, Space( 3 ) + AllTrim( cInput ) )
               ELSEIF Upper( Left( cLine, 7 ) ) == "METHOD "
                  cWord2 := LTrim( SubStr( cLine, 8 ) )
                  IF ( nPos := At( " BLOCK ", Upper( cWord2 ) ) ) > 0
                     cWord3 := SubStr( cWord2, nPos + 1 )
                     cWord2 := Left( cWord2, nPos - 1 )
                  ELSEIF ( nPos := At( " INLINE ", Upper( cWord2 ) ) ) > 0
                     cWord3 := SubStr( cWord2, nPos + 1 )
                     cWord2 := Left( cWord2, nPos - 1 )
                  ELSEIF ( nPos := At( " SETGET ", Upper( cWord2 ) ) ) > 0
                     cWord3 := SubStr( cWord2, nPos + 1 )
                     cWord2 := Left( cWord2, nPos - 1 )
                  ELSEIF ( nPos := At( " HIDDEN ", Upper( cWord2 ) ) ) > 0
                     cWord3 := SubStr( cWord2, nPos + 1 )
                     cWord2 := Left( cWord2, nPos - 1 )
                  ELSE
                     cWord3 := ""
                  ENDIF
                  cInput := "METHOD " + RTrim( cWord2 )
                  IF Len( cInput ) + 3 < 48
                     cInput += Space( 48 - 3 - Len( cInput ) )
                  ENDIF
                  IF Right( cInput, 1 ) # " "
                     cInput += " "
                  ENDIF
                  cInput += cWord3
                  AAdd( aClass, Space( 3 ) + AllTrim( cInput ) )
               ELSEIF Upper( Left( cLine, 8 ) ) == "MESSAGE "
                  cWord2 := LTrim( SubStr( cLine, 8 ) )
                  IF ( nPos := At( " METHOD ", Upper( cWord2 ) ) ) > 0
                     cWord3 := SubStr( cWord2, nPos + 1 )
                     cWord2 := Left( cWord2, nPos - 1 )
                  ELSE
                     cWord3 := ""
                  ENDIF
                  cInput := "MESSAGE " + RTrim( cWord2 )
                  IF Len( cInput ) + 3 < 48
                     cInput += Space( 48 - 3 - Len( cInput ) )
                  ENDIF
                  IF Right( cInput, 1 ) # " "
                     cInput += " "
                  ENDIF
                  cInput += cWord3
                  AAdd( aClass, Space( 3 ) + AllTrim( cInput ) )
               ELSE
                  AAdd( aClass, Space( 3 ) + AllTrim( cInput ) )
               ENDIF
            ENDIF
         ELSEIF Upper( Left( cLine, 8 ) ) == "ENDCLASS"
            IF lIsOpen
               AAdd( aClass, cLine )
               AAdd( aLines, aClass )
               lIsOpen := .F.
            ELSE
               MSGSTOP( DQM( cLine ) + " from " + DQM( cFile ) + "has no CLASS.", "Tree of ooHG's Classes, msg #13" )
            ENDIF
         ENDIF
      ENDDO
   NEXT

   cFile := "## OOHG Classes" + CRLF + ;
            CRLF + ;
            "```" + CRLF + ;
            "/*--------------------------------------------------------------------------------------------------------------------------------*/" + CRLF

   FOR EACH aClass IN aLines
      FOR EACH cLine IN aClass
         cFile += cLine + CRLF
      NEXT
      cFile += CRLF + ;
               "/*--------------------------------------------------------------------------------------------------------------------------------*/" + CRLF
   NEXT
   cFile += "```" + CRLF

   hb_MemoWrit( "Classes.md", cFile )

RETURN .F.

/*
 * C functions
 */
#pragma BEGINDUMP

#include <windows.h>
#include <hbapi.h>

/*
 * Get screen's number of dots per inch
 */
HB_FUNC( GETSCREENDPI )
{
   HDC hDC;
   int iDPI;

   memset ( &iDPI, 0, sizeof ( iDPI ) );
   memset ( &hDC, 0, sizeof ( hDC ) );

   hDC = GetDC( HWND_DESKTOP );

   iDPI = GetDeviceCaps( hDC, LOGPIXELSX );

   ReleaseDC( HWND_DESKTOP, hDC );

   hb_retni( iDPI );
}

#pragma ENDDUMP

/*
 * EOF
 */
