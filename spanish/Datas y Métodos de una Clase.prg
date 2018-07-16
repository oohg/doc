/*
 * Determinar las DATAs, METHODs e INLINEs de una clase dada.
 * Autor: Fernando Yurisich <fyurisich@oohg.org>
 * Licenciado bajo The Code Project Open License (CPOL) 1.02
 * Ver <http://www.codeproject.com/info/cpol10.aspx>
 *
 * Basado en una contribución de Teo (user tfonfouge)
 * publicada en harbour-users@googlegroups.com
 *
 * Este ejemplo muestra cómo determinar las DATAs, METHODs
 * e INLINEs de una clase data. Vea las funciones DoMethod,
 * _OOHG_HasMethod and _OOHG_HasData en source/h_controlmisc.prg
 *
 * Para distinguir un DATA de un METHOD con o sin SETGET siga
 * las siguientes reglas:
 *
 * DATA: xyz es un DATA cuando la lista de DATAs contiene los
 * ítems xyz (mensaje 'get') y _xyz (mensaje 'set').
 *
 * METHOD con SETGET: xyz es un METHOD con SETGET cuando la lista
 * de METHODs contiene los ítems xyz y _xyz.
 *
 * INLINE o METHOD sin SETGET: xyz es un METHOD sin SETGET
 * cuando la lista de METHODs contiene el ítem xyz y no contiene
 * el ítem _xyz.
 *
 * NOTAS:
 *
 * Cuando la lista de DATAs contiene el ítem _xyz pero no
 * contiene el ítem xyz, en la clase padre xyz es un DATA
 * y en la clase es un METHOD sin SETGET.
 *
 * Visítenos en https://oohg.github.io
 */

#include "hbclass.ch"
#include "hboo.ch"

FUNCTION Main()
   LOCAL obj
   LOCAL aObjs
   LOCAL itm

   aObjs := { MyClass1():New(), MyClass2():New() }

   FOR EACH obj IN aObjs
      ? obj:ClassName
      ? "nNumber( 3 ) = ", obj:nNumber( 3 )
      FOR EACH itm IN __objGetMsgType( obj, ;
                                       HB_OO_MSG_DATA, ;
                                       HB_OO_CLSTP_EXPORTED, ;
                                       .F. )
         ? "Data:", itm
      NEXT
      FOR EACH itm IN __objGetMsgType( obj, ;
                                       HB_OO_MSG_METHOD, ;
                                       HB_OO_CLSTP_EXPORTED, ;
                                       .F. )
         ? "Method:", itm
      NEXT
      FOR EACH itm IN __objGetMsgType( obj, ;
                                       HB_OO_MSG_INLINE, ;
                                       HB_OO_CLSTP_EXPORTED, ;
                                       .F. )
         ? "Inline:", itm
      NEXT
      ?
   NEXT
RETURN NIL

CLASS MyClass1
   DATA _otherData
   DATA cText INIT "Default Text"
   DATA nNumber INIT 0
   METHOD _Now() INLINE Date()
   METHOD _Tomorrow() INLINE ::_Now() + 1
PROTECTED:
   DATA Prot1
ENDCLASS

CLASS MyClass2 FROM MyClass1
   DATA aValues INIT {0,1,2,3,4}
   DATA cTime INIT time()
   METHOD cText SETGET
   METHOD nNumber
ENDCLASS

METHOD FUNCTION cText( cNewText ) CLASS MyClass2
RETURN IIF( empty( cNewText ), ::cTime, ::cTime := time() )

METHOD FUNCTION nNumber( nItem ) CLASS MyClass2
RETURN ::aValues[ nItem ] := nItem * 2

STATIC FUNCTION __objGetMsgType( obj, msgType, msgScope, filtSuper )
   LOCAL itm
   LOCAL aClsSel
   LOCAL a := {}

   IF msgScope = NIL
      msgScope := 0
   ENDIF

   aClsSel := obj:ClassSel( HB_MSGLISTPURE, msgScope, .T. )

   FOR EACH itm IN aClsSel
      IF !filtSuper == .T. .OR. ;
         HB_BitAnd( itm[ HB_OO_DATA_SCOPE ], HB_OO_CLSTP_SUPER ) = 0
            IF msgType = NIL .OR. itm[ HB_OO_DATA_TYPE ] = msgType
               AAdd( a, itm[ HB_OO_DATA_SYMBOL ] )
            ENDIF
      ENDIF
   NEXT
RETURN a

/*
 * EOF
 */
