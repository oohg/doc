## OOHG Classes

```
/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TActiveX FROM TControl
   DATA Type      INIT "ACTIVEX" READONLY
   DATA nWidth    INIT nil
   DATA nHeight   INIT nil
   DATA oOle      INIT nil
   DATA cProgId   INIT ""
   DATA hSink     INIT nil
   DATA hAtl      INIT nil
   METHOD Define
   METHOD Release
   DELEGATE Set TO oOle
   DELEGATE Get TO oOle
   ERROR HANDLER __Error
   DATA aAxEv        INIT {}              // oSkAr 20070829
   DATA aAxExec      INIT {}              // oSkAr 20070829
   METHOD EventMap( nMsg, xExec, oSelf )  // oSkAr 20070829
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TAniGIF FROM TImage
   DATA aDelays                   INIT {}
   DATA aInfo                     INIT { "", 0, 0 }
   DATA aPictures                 INIT {}
   DATA CurrentFrame              INIT 0
   DATA FileName                  INIT ""
   DATA oTimer                    INIT Nil
   DATA Type                      INIT "ANIGIF" READONLY
   METHOD Define
   METHOD FrameCount              BLOCK { |Self| Len( ::aPictures ) }
   METHOD FrameDelay
   METHOD FrameHeight             BLOCK { |Self| ::aInfo[ 3 ] }
   METHOD FrameWidth              BLOCK { |Self| ::aInfo[ 2 ] }
   METHOD IsPlaying               BLOCK { |Self| ::oTimer:Enabled }
   METHOD Load
   METHOD Play                    BLOCK { |Self| ::oTimer:Enabled := ( ::FrameCount > 1 ) }
   METHOD Release
   METHOD ShowNextFrame
   METHOD Stop                    BLOCK { |Self| ::oTimer:Enabled := .F. }
   METHOD Version                 BLOCK { |Self| ::aInfo[ 1 ] }
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TApplication
   DATA aEventsStack              INIT {}  HIDDEN
   DATA aFonts                    INIT {}  READONLY
   DATA aFramesStack              INIT {}  HIDDEN
   DATA aMenusStack               INIT {}  HIDDEN
   DATA AppMutex                  INIT NIL HIDDEN
   DATA ArgC                      INIT NIL READONLY
   DATA Args                      INIT NIL READONLY
   DATA aVars                     INIT NIL HIDDEN
   DATA Drive                     INIT NIL READONLY
   DATA ExeName                   INIT NIL READONLY
   DATA FileName                  INIT NIL READONLY
   DATA Path                      INIT NIL READONLY
   METHOD Define                  
   METHOD ActiveFrameContainer
   METHOD ActiveFrameGet
   METHOD ActiveFramePop
   METHOD ActiveFramePush
   METHOD ActiveMenuGet
   METHOD ActiveMenuPop
   METHOD ActiveMenuPush
   METHOD ActiveMenuRemove
   METHOD BackColor               SETGET
   METHOD Col                     SETGET
   METHOD CreateGlobalMutex       HIDDEN
   METHOD Cursor                  SETGET
   METHOD DefineLogFont
   METHOD EventInfoClear
   METHOD EventInfoList
   METHOD EventInfoPop
   METHOD EventInfoPush
   METHOD GetLogFontHandle
   METHOD GetLogFontID
   METHOD GetLogFontParams
   METHOD GetLogFontParamsByRef
   METHOD Height                  SETGET
   METHOD HelpButton              SETGET
   METHOD HotKeySet
   METHOD hWnd
   METHOD MultipleInstances       SETGET
   METHOD MainClientHeight        SETGET
   METHOD MainClientWidth         SETGET
   METHOD MainName
   METHOD MainObject
   METHOD MainStyle               SETGET
   METHOD MutexLock
   METHOD MutexUnlock
   METHOD New
   METHOD Release
   METHOD ReleaseLogFont
   METHOD Row                     SETGET
   METHOD Title                   SETGET
   METHOD TopMost                 SETGET
   METHOD Value_Pos01             SETGET
   METHOD Value_Pos02             SETGET
   METHOD Value_Pos03             SETGET
   METHOD Value_Pos04             SETGET
   METHOD Value_Pos05             SETGET
   METHOD Value_Pos06             SETGET
   METHOD Value_Pos07             SETGET
   METHOD Value_Pos08             SETGET
   METHOD Value_Pos09             SETGET
   METHOD Value_Pos10             SETGET
   METHOD Value_Pos11             SETGET
   METHOD Value_Pos12             SETGET
   METHOD Value_Pos13             SETGET
   METHOD Value_Pos14             SETGET
   METHOD Value_Pos15             SETGET
   METHOD Value_Pos16             SETGET
   METHOD Value_Pos17             SETGET
   METHOD Value_Pos18             SETGET
   METHOD Value_Pos19             SETGET
   METHOD Value_Pos20             SETGET
   METHOD Value_Pos21             SETGET
   METHOD Value_Pos22             SETGET
   METHOD Value_Pos23             SETGET
   METHOD Value_Pos24             SETGET
   METHOD Value_Pos25             SETGET
   METHOD Value_Pos26             SETGET
   METHOD Value_Pos27             SETGET
   METHOD Value_Pos28             SETGET
   METHOD Value_Pos29             SETGET
   METHOD Value_Pos30             SETGET
   METHOD Value_Pos31             SETGET
   METHOD Value_Pos32             SETGET
   METHOD Value_Pos33             SETGET
   METHOD Value_Pos34             SETGET
   METHOD Value_Pos35             SETGET
   METHOD Value_Pos36             SETGET
   METHOD Value_Pos37             SETGET
   METHOD Value_Pos38             SETGET
   METHOD Value_Pos39             SETGET
   METHOD Value_Pos40             SETGET
   METHOD Value_Pos41             SETGET
   METHOD Value_Pos42             SETGET
   METHOD Value_Pos43             SETGET
   METHOD Value_Pos44             SETGET
   METHOD Value_Pos45             SETGET
   METHOD Value_Pos46
   METHOD Value_Pos47             SETGET
   METHOD Value_Pos48             SETGET
   METHOD Value_Pos49             SETGET
   METHOD Value_Pos50
   METHOD Value_Pos51             SETGET
   METHOD Value_Pos52             SETGET
   METHOD Value_Pos53             SETGET
   METHOD Value_Pos54             SETGET
   METHOD Width                   SETGET
   MESSAGE Cargo                  METHOD Value_Pos31
   MESSAGE ErrorLevel             METHOD Value_Pos38
   MESSAGE FormObject             METHOD MainObject
   MESSAGE Handle                 METHOD hWnd
   MESSAGE HotKeysGet             METHOD Value_Pos46
   MESSAGE Icon                   METHOD Value_Pos29
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TOBrowse FROM TXBrowse
   DATA Type                      INIT "BROWSE" READONLY
   DATA aRecMap                   INIT {}
   DATA lUpdateAll                INIT .F.
   DATA nRecLastValue             INIT 0 PROTECTED
   DATA SyncStatus                INIT Nil
   METHOD BrowseOnChange
   METHOD CurrentRow              SETGET
   METHOD DbGoTo
   METHOD DbSkip
   METHOD Define
   METHOD Define3
   METHOD Delete
   METHOD DeleteItem
   METHOD DoChange
   METHOD Down
   METHOD EditAllCells
   METHOD EditCell
   METHOD EditGrid
   METHOD EditItem_B
   METHOD End
   METHOD Events
   METHOD Events_Notify
   METHOD FastUpdate
   METHOD Home
   METHOD MoveTo                  BLOCK { || Nil }
   METHOD PageDown
   METHOD PageUp
   METHOD Refresh
   METHOD RefreshData
   METHOD VScrollUpdate
   METHOD SetControlValue         BLOCK { || Nil }
   METHOD SetScrollPos
   METHOD SetValue
   METHOD TopBottom
   METHOD Up
   METHOD Update
   METHOD UpdateColors
   METHOD Value                   SETGET
   MESSAGE GoBottom               METHOD End
   MESSAGE GoTop                  METHOD Home
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TOBrowseByCell FROM TOBrowse
   DATA lFocusRect                INIT .F.
   DATA Type                      INIT "BROWSEBYCELL" READONLY
   METHOD AddColumn
   METHOD BrowseOnChange
   METHOD CurrentCol              SETGET
   METHOD Define3
   METHOD Delete
   METHOD DeleteAllItems
   METHOD DeleteColumn
   METHOD DoChange
   METHOD Down
   METHOD EditAllCells
   METHOD EditCell
   METHOD EditCell2
   METHOD EditGrid
   METHOD EditItem_B
   METHOD End
   METHOD Events
   METHOD Events_Notify
   METHOD GoBottom
   METHOD GoTop
   METHOD Home
   METHOD Left
   METHOD MoveToFirstCol
   METHOD MoveToFirstVisibleCol
   METHOD MoveToLastCol
   METHOD MoveToLastVisibleCol
   METHOD PageDown
   METHOD PageUp
   METHOD Right
   METHOD SetScrollPos
   METHOD SetSelectedColors
   METHOD SetValue
   METHOD Up
   METHOD Value                   SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TButton FROM TControl
   DATA aImageMargin              INIT { 0, 0, 0, 0 }      // top, left, bottom, right
   DATA aTextMargin               INIT { 0, 0, 0, 0 }      // top, left, bottom, right
   DATA AutoFit                   INIT .F.
   DATA cBuffer                   INIT ""
   DATA cPicture                  INIT ""
   DATA hImage                    INIT NIL
   DATA ImageBkClr                INIT -1
   DATA ImageSize                 INIT .F.
   DATA lFitImg                   INIT .F.
   DATA lFitTxt                   INIT .F.
   DATA lLibDraw                  INIT .F.
   DATA lNo3DColors               INIT .F.
   DATA lNoDIBSection             INIT .T.
   DATA lNoFocusRect              INIT .F.
   DATA lNoHotLight               INIT .F.
   DATA lNoImgLst                 INIT .F.
   DATA lNoTransparent            INIT .F.
   DATA lNoPrintOver              INIT .F.
   DATA lSolid                    INIT .F.
   DATA nAlign                    INIT -1
   DATA nHeight                   INIT 28
   DATA nTextAlign                INIT BS_CENTER + BS_VCENTER
   DATA nWidth                    INIT 100
   DATA Stretch                   INIT .F.
   DATA Type                      INIT "BUTTON" READONLY
   METHOD Buffer                  SETGET
   METHOD Define
   METHOD DefineImage
   METHOD Events_Notify
   METHOD HBitMap                 SETGET
   METHOD ImageMargin             SETGET
   METHOD Picture                 SETGET
   METHOD Release
   METHOD RePaint
   METHOD SetFocus
   METHOD SizePos
   METHOD TextMargin              SETGET
   METHOD Value                   SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TButtonCheck FROM TButton
   DATA Type      INIT "CHECKBUTTON" READONLY
   DATA nWidth    INIT 100
   DATA nHeight   INIT 28
   METHOD Define
   METHOD DefineImage
   METHOD Value       SETGET
   METHOD Events_Command
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TCheckBox FROM TLabel
   DATA cPicture                  INIT ""
   DATA IconWidth                 INIT 21
   DATA LeftAlign                 INIT .F.
   DATA lLibDraw                  INIT .F.
   DATA lNoFocusRect              INIT .F.
   DATA nHeight                   INIT 28
   DATA nWidth                    INIT 100
   DATA Threestate                INIT .F.
   DATA Type                      INIT "CHECKBOX" READONLY
   METHOD Define
   METHOD Events_Color
   METHOD Events_Command
   METHOD Events_Notify
   METHOD Value                   SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TCheckList FROM TGrid
   DATA Type                   INIT "CHECKLIST" READONLY
   DATA lCheckBoxes            INIT .T. READONLY
   DATA FullMove               INIT .F. READONLY
   DATA InPlace                INIT .F. READONLY
   DATA AllowEdit              INIT .F. READONLY
   DATA LastChangedItem        INIT 0
   METHOD Define
   METHOD Value                SETGET
   METHOD Events
   METHOD Events_Notify
   METHOD Width                SETGET
   METHOD CheckItem            SETGET
   METHOD DeleteAllItems
   METHOD AddItem
   METHOD InsertItem
   METHOD Sort
   METHOD DeleteItem
   METHOD ItemVisible
   METHOD Item
   METHOD SetRangeColor
   METHOD ItemCaption          SETGET
   METHOD ItemImage            SETGET
   METHOD DoChange
   METHOD BackColor            SETGET
   METHOD CountPerPage         BLOCK { | Self | ListViewGetCountPerPage( ::hWnd ) }
   METHOD Define2
   METHOD Events_Enter
   METHOD FirstSelectedItem    BLOCK { | Self | ListView_GetFirstItem( ::hWnd ) }
   METHOD FontColor            SETGET
   METHOD InsertBlank
   METHOD ItemCount            BLOCK { | Self | ListViewGetItemCount( ::hWnd ) }
   METHOD OnEnter
   METHOD Release
   METHOD SetItemColor
   METHOD SetSelectedColors
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TCombo FROM TLabel
   DATA aValues                   INIT {}
   DATA cText                     INIT ""
   DATA ImageListColor            INIT CLR_DEFAULT
   DATA ImageListFlags            INIT LR_LOADTRANSPARENT + LR_DEFAULTCOLOR + LR_LOADMAP3DCOLORS
   DATA ImageSource               INIT NIL
   DATA ItemNumber                INIT NIL
   DATA lAdjustImages             INIT .F.
   DATA lDelayLoad                INIT .F.
   DATA lFocused                  INIT .F.
   DATA lIncremental              INIT .F.
   DATA lRefresh                  INIT NIL
   DATA nHeight2                  INIT 150
   DATA nLastFound                INIT 0
   DATA nLastItem                 INIT 0
   DATA nTextHeight               INIT 0
   DATA nWidth                    INIT 120
   DATA oEditBox                  INIT NIL
   DATA oListBox                  INIT NIL
   DATA OnListClose               INIT NIL
   DATA OnListDisplay             INIT NIL
   DATA OnRefresh                 INIT NIL
   DATA SearchLapse               INIT 1000
   DATA SourceOrder               INIT NIL
   DATA Type                      INIT "COMBO" READONLY
   DATA uField                    INIT NIL
   DATA uIniTime                  INIT 0
   DATA uValueSource              INIT NIL
   DATA WorkArea                  INIT ""
   METHOD AddItem
   METHOD Autosize                SETGET
   METHOD AutosizeDropDown
   METHOD CaretPos                SETGET
   METHOD Define
   METHOD DeleteAllItems
   METHOD DeleteItem
   METHOD DisplayValue            SETGET    /// Caption alias
   METHOD EditHeight              SETGET
   METHOD Events
   METHOD Events_Command
   METHOD Events_DrawItem
   METHOD Events_MeasureItem
   METHOD Field                   SETGET
   METHOD FindString
   METHOD FindStringExact
   METHOD ForceHide               BLOCK { |Self| SendMessage( ::hWnd, CB_SHOWDROPDOWN, 0, 0 ), ::Super:ForceHide() }
   METHOD GetDropDownWidth
   METHOD GetEditSel
   METHOD InsertItem
   METHOD Item                    BLOCK { |Self, nItem, uValue| ComboItem( Self, nItem, uValue ) }
   METHOD ItemBySource
   METHOD ItemCount               BLOCK { |Self| ComboboxGetItemCount( ::hWnd ) }
   METHOD ItemHeight
   METHOD ItemValue
   METHOD nHeight                 SETGET
   METHOD OptionsHeight           SETGET
   METHOD Refresh
   METHOD RefreshData
   METHOD Release
   METHOD SelectFirstItem         BLOCK { |Self| ComboSetCursel( ::hWnd, 1 ) }
   METHOD SelectLastItem          BLOCK { |Self| ComboSetCursel( ::hWnd, ::ItemCount ) }
   METHOD SetDropDownWidth
   METHOD SetEditSel
   METHOD ShowDropDown
   METHOD Value                   SETGET
   METHOD ValueSource             SETGET
   METHOD Visible                 SETGET
   METHOD VisibleItems
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TListCombo FROM TControl STATIC
   METHOD Define
   METHOD Events_VScroll
   METHOD FindString( c, n )      BLOCK { |Self, c, n| ListboxFindString( ::hWnd, n, c ) }
   METHOD FindStringExact( c, n)  BLOCK { |Self, c, n| ListboxFindStringExact( ::hWnd, n, c ) }
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TEditCombo FROM TControl STATIC
   DATA LastKey                   INIT 0
   DATA nMaxLength                INIT 0
   DATA Type                      INIT "EDITCOMBO"
   METHOD Define
   METHOD Events
   METHOD MaxLength               SETGET
   METHOD Release
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TControl FROM TWindow
   DATA oToolTipCtrl         INIT Nil
   DATA cToolTip             INIT ""
   DATA AuxHandle            INIT 0
   DATA Transparent          INIT .F.
   DATA HelpId               INIT 0
   DATA OnChange             INIT nil
   DATA Id                   INIT 0
   DATA ImageListColor       INIT CLR_NONE
   DATA ImageListFlags       INIT LR_LOADTRANSPARENT
   DATA SetImageListCommand  INIT 0   // Must be explicit for each control
   DATA SetImageListWParam   INIT TVSIL_NORMAL
   DATA hCursor              INIT 0
   DATA postBlock            INIT nil
   DATA lCancel              INIT .F.
   DATA OnEnter              INIT nil
   DATA xOldValue            INIT nil
   DATA OldValue             INIT nil
   DATA OldColor
   DATA OldBackColor
   DATA oBkGrnd              INIT NIL
   METHOD Row                SETGET
   METHOD Col                SETGET
   METHOD Width              SETGET
   METHOD Height             SETGET
   METHOD ToolTip            SETGET
   METHOD SetForm
   METHOD InitStyle
   METHOD Register
   METHOD AddToCtrlsArrays
   METHOD PreAddToCtrlsArrays
   METHOD DelFromCtrlsArrays
   METHOD TabIndex           SETGET
   METHOD Refresh            BLOCK { |Self| ::ReDraw() }
   METHOD Release
   METHOD SetFont
   METHOD FocusEffect
   METHOD ContainerRow       BLOCK { |Self| IF( ::Container != NIL, IF( ValidHandler( ::Container:ContainerhWndValue ), 0, ::Container:ContainerRow ) + ::Container:RowMargin, ::Parent:RowMargin ) + ::Row }
   METHOD ContainerCol       BLOCK { |Self| IF( ::Container != NIL, IF( ValidHandler( ::Container:ContainerhWndValue ), 0, ::Container:ContainerCol ) + ::Container:ColMargin, ::Parent:ColMargin ) + ::Col }
   METHOD ContainerhWnd      BLOCK { |Self| IF( ::Container == NIL, ::Parent:hWnd, if( ValidHandler( ::Container:ContainerhWndValue ), ::Container:ContainerhWndValue, ::Container:ContainerhWnd ) ) }
   METHOD FontName           SETGET
   METHOD FontSize           SETGET
   METHOD FontBold           SETGET
   METHOD FontItalic         SETGET
   METHOD FontUnderline      SETGET
   METHOD FontStrikeout      SETGET
   METHOD FontAngle          SETGET
   METHOD FontCharset        SETGET
   METHOD FontWidth          SETGET
   METHOD FontOrientation    SETGET
   METHOD FontAdvancedGM     SETGET
   METHOD SizePos
   METHOD Move
   METHOD ForceHide
   METHOD SetFocus
   METHOD SetVarBlock
   METHOD AddBitMap
   METHOD ClearBitMaps
   METHOD DoEvent
   METHOD DoEventMouseCoords
   METHOD DoLostFocus
   METHOD DoChange
   METHOD oToolTip           SETGET
   METHOD Events
   METHOD Events_Color
   METHOD Events_Enter
   METHOD Events_Command
   METHOD Events_Notify
   METHOD Events_DrawItem    BLOCK { || NIL }
   METHOD Events_MeasureItem BLOCK { || NIL }
   METHOD Cursor             SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TControlGroup FROM TControl
   DATA Type      INIT "CONTROLGROUP" READONLY
   DATA lHidden   INIT .F.
   METHOD Define
   METHOD Enabled             SETGET
   METHOD Visible             SETGET
   METHOD AddControl
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TDatePick FROM TControl
   DATA Type                      INIT "DATEPICK" READONLY
   DATA nWidth                    INIT 120
   DATA nHeight                   INIT 24
   DATA cDateFormat               INIT ""
   METHOD Define
   METHOD Value                   SETGET
   METHOD Events_Notify
   METHOD SetRange
   METHOD DateFormat              SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TTimePick FROM TControl
   DATA Type                      INIT "TIMEPICK" READONLY
   DATA nWidth                    INIT 120
   DATA nHeight                   INIT 24
   DATA cTimeFormat               INIT ""
   METHOD Define
   METHOD Value                   SETGET
   METHOD Events_Notify
   METHOD TimeFormat              SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TEdit FROM TText
   DATA Type             INIT "EDIT" READONLY
   DATA nOnFocusPos      INIT -4
   DATA OnHScroll        INIT Nil
   DATA OnVScroll        INIT Nil
   DATA nWidth           INIT 120
   DATA nHeight          INIT 240
   METHOD Define
   METHOD LookForKey
   METHOD Events_Command
   METHOD Events_Enter   BLOCK { || Nil }
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS OOHG_TErrorHtml
   DATA aMessages                 INIT NIL
   DATA cBufferFile               INIT ""
   DATA cBufferScreen             INIT ""
   DATA cLang                     INIT ""
   DATA FileName                  INIT "ErrorLog.htm"
   DATA Path                      INIT ""
   DATA PostHeader                INIT '</p>'
   DATA PreHeader                 INIT '<HR>' + CRLF + '<p class="updated">'
   METHOD CopyLog
   METHOD CreateLog
   METHOD DeleteLog
   METHOD ErrorHeader
   METHOD ErrorMessage
   METHOD FileHeader
   METHOD New
   METHOD PutMsg
   METHOD Write
   METHOD Write2
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS OOHG_TErrorTxt FROM OOHG_TErrorHtml
   DATA PreHeader                 INIT " " + CRLF + Replicate( "-", 80 ) + CRLF + " " + CRLF
   DATA PostHeader                INIT CRLF + CRLF
   DATA FileName                  INIT "ErrorLog.txt"
   DATA FileHeader                INIT ""
   METHOD Write2
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TForm FROM TWindow
   DATA oToolTip           INIT nil
   DATA Focused            INIT .T.
   DATA LastFocusedControl INIT 0
   DATA AutoRelease        INIT .F.
   DATA ActivateCount      INIT { 0, NIL, .T. }
   DATA oMenu              INIT nil
   DATA hWndClient         INIT NIL
   DATA oWndClient         INIT NIL
   DATA lInternal          INIT .F.
   DATA lForm              INIT .T.
   DATA nWidth             INIT 300
   DATA nHeight            INIT 300
   DATA lShowed            INIT .F.
   DATA lStretchBack       INIT .T.
   DATA hBackImage         INIT nil
   DATA lentersizemove     INIT .F.
   DATA ldefined           INIT .F.
   DATA uFormCursor        INIT IDC_ARROW
   DATA OnRelease          INIT nil
   DATA OnInit             INIT nil
   DATA OnMove             INIT nil
   DATA OnSize             INIT nil
   DATA OnPaint            INIT nil
   DATA OnScrollUp         INIT nil
   DATA OnScrollDown       INIT nil
   DATA OnScrollLeft       INIT nil
   DATA OnScrollRight      INIT nil
   DATA OnHScrollBox       INIT nil
   DATA OnVScrollBox       INIT nil
   DATA OnInteractiveClose INIT nil
   DATA OnMaximize         INIT nil
   DATA OnMinimize         INIT nil
   DATA OnRestore          INIT nil
   DATA nVirtualHeight     INIT 0
   DATA nVirtualWidth      INIT 0
   DATA RangeHeight        INIT 0
   DATA RangeWidth         INIT 0
   DATA MinWidth           INIT 0
   DATA MaxWidth           INIT 0
   DATA MinHeight          INIT 0
   DATA MaxHeight          INIT 0
   DATA ForceRow           INIT nil     // Must be NIL instead of 0
   DATA ForceCol           INIT nil     // Must be NIL instead of 0
   DATA GraphControls      INIT {}
   DATA GraphTasks         INIT {}
   DATA GraphCommand       INIT nil
   DATA GraphData          INIT {}
   DATA SplitChildList     INIT {}    // INTERNAL windows.
   DATA aChildPopUp        INIT {}    // POP UP windows.
   DATA lTopmost           INIT .F.
   DATA aNotifyIcons       INIT {}
   METHOD Title               SETGET
   METHOD Height              SETGET
   METHOD Width               SETGET
   METHOD Col                 SETGET
   METHOD Row                 SETGET
   METHOD Cursor              SETGET
   METHOD BackColor           SETGET
   METHOD TopMost             SETGET
   METHOD VirtualWidth        SETGET
   METHOD VirtualHeight       SETGET
   METHOD BackImage           SETGET
   METHOD AutoAdjust
   METHOD AdjustWindowSize
   METHOD ClientsPos
   METHOD Closable            SETGET
   METHOD FocusedControl
   METHOD SizePos
   METHOD Define
   METHOD Define2
   METHOD EndWindow
   METHOD Register
   METHOD Visible             SETGET
   METHOD Show
   METHOD Hide
   METHOD Flash
   METHOD Activate
   METHOD Release
   METHOD RefreshData
   METHOD Center()      BLOCK { | Self | C_Center( ::hWnd ) }
   METHOD Restore()     BLOCK { | Self | Restore( ::hWnd ) }
   METHOD Minimize()    BLOCK { | Self | Minimize( ::hWnd ) }
   METHOD Maximize()    BLOCK { | Self | Maximize( ::hWnd ) }
   METHOD DefWindowProc(nMsg,wParam,lParam)       BLOCK { |Self,nMsg,wParam,lParam| IF( ValidHandler( ::hWndClient ), ;
   METHOD ToolTipWidth( nWidth )          BLOCK { |Self, nWidth | ::oToolTip:WindowWidth( nWidth ) }
   METHOD ToolTipMultiLine( lMultiLine )  BLOCK { |Self,lMultiLine| ::oToolTip:MultiLine( lMultiLine ) }
   METHOD ToolTipAutoPopTime( nMilliSec ) BLOCK { |Self,nMilliSec| ::oToolTip:AutoPopTime( nMilliSec ) }
   METHOD ToolTipInitialTime( nMilliSec ) BLOCK { |Self,nMilliSec| ::oToolTip:InitialTime( nMilliSec ) }
   METHOD ToolTipResetDelays( nMilliSec ) BLOCK { |Self,nMilliSec| ::oToolTip:ResetDelays( nMilliSec ) }
   METHOD ToolTipReshowTime( nMilliSec )  BLOCK { |Self,nMilliSec| ::oToolTip:ReshowTime( nMilliSec ) }
   METHOD ToolTipIcon( nIcon )            BLOCK { |Self,nIcon| ::oToolTip:Icon( nIcon ) }
   METHOD ToolTipTitle( cTitle )          BLOCK { |Self,cTitle| ::oToolTip:Title( cTitle ) }
   METHOD GetWindowState()
   METHOD SetActivationFocus
   METHOD ProcessInitProcedure
   METHOD DeleteControl
   METHOD OnHideFocusManagement
   METHOD CheckInteractiveClose
   METHOD DoEvent
   METHOD Events
   METHOD Events_Destroy
   METHOD Events_VScroll
   METHOD Events_HScroll
   METHOD HelpButton          SETGET
   METHOD HelpTopic(lParam)   BLOCK { | Self, lParam | HelpTopic( GetControlObjectByHandle( GetHelpData( lParam ) ):HelpId , 2 ), Self, nil }
   METHOD ScrollControls
   METHOD MessageLoop
   METHOD HasStatusBar        BLOCK { | Self | aScan( ::aControls, { |c| c:Type == "MESSAGEBAR" } ) > 0 }
   METHOD Inspector           BLOCK { | Self | Inspector( Self ) }
   METHOD NotifyIconObject
   METHOD NotifyIcon            SETGET
   METHOD NotifyToolTip         SETGET
   METHOD NotifyIconLeftClick   SETGET
   METHOD NotifyIconDblClick    SETGET
   METHOD NotifyIconRightClick  SETGET
   METHOD NotifyIconRDblClick   SETGET
   METHOD NotifyIconMidClick    SETGET
   METHOD NotifyIconMDblClick   SETGET
   METHOD NotifyMenu            SETGET
   METHOD cNotifyIconName       SETGET
   METHOD cNotifyIconToolTip    SETGET
   METHOD AddNotifyIcon
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TFormMain FROM TForm
   DATA Type           INIT "A" READONLY
   DATA lFirstActivate INIT .F.
   METHOD Define
   METHOD Activate
   METHOD Release
   METHOD CheckInteractiveClose
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TFormModal FROM TForm
   DATA Type           INIT "M" READONLY
   DATA LockedForms    INIT {}
   DATA oPrevWindow    INIT nil
   METHOD Define
   METHOD Visible      SETGET
   METHOD Activate
   METHOD Release
   METHOD OnHideFocusManagement
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TFormInternal FROM TForm
   DATA Type           INIT "I" READONLY
   DATA lInternal      INIT .T.
   DATA lAdjust        INIT .F.
   DATA Focused        INIT .F.
   METHOD Define
   METHOD Define2
   METHOD SizePos
   METHOD Row       SETGET
   METHOD Col       SETGET
   METHOD ContainerRow        BLOCK { |Self| IF( ::Container != NIL, IF( ValidHandler( ::Container:ContainerhWndValue ), 0, ::Container:ContainerRow ) + ::Container:RowMargin, ::Parent:RowMargin ) + ::Row }
   METHOD ContainerCol        BLOCK { |Self| IF( ::Container != NIL, IF( ValidHandler( ::Container:ContainerhWndValue ), 0, ::Container:ContainerCol ) + ::Container:ColMargin, ::Parent:ColMargin ) + ::Col }
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TFormSplit FROM TFormInternal
   DATA Type           INIT "X" READONLY
   METHOD Define
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TFormMDIClient FROM TFormInternal
   DATA Type           INIT "D" READONLY
   DATA nWidth         INIT 0
   DATA nHeight        INIT 0
   METHOD Define
   METHOD DefWindowProc(nMsg,wParam,lParam) BLOCK { |Self,nMsg,wParam,lParam| DefMDIChildProc( ::hWnd, nMsg, wParam, lParam ) }
   METHOD Events_Size
   METHOD Release                           BLOCK { |Self| _OOHG_RemoveMdi( ::hWnd ) , ::Super:Release() }
   METHOD Cascade
   METHOD TileHorizontal                    BLOCK { |Self| SendMessage( ::hWnd, WM_MDITILE, 1, 0 ) }
   METHOD TileVertical                      BLOCK { |Self| SendMessage( ::hWnd, WM_MDITILE, 0, 0 ) }
   METHOD IconArrange                       BLOCK { |Self| SendMessage( ::hWnd, WM_MDIICONARRANGE, 0, 0 ) }
   METHOD ActiveChild
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TFormMDIChild FROM TFormInternal
   DATA Type           INIT "L" READONLY
   METHOD Define
   METHOD DefWindowProc(nMsg,wParam,lParam) BLOCK { |Self,nMsg,wParam,lParam| DefMDIChildProc( ::hWnd, nMsg, wParam, lParam ) }
   METHOD IsActive                          BLOCK { |Self| ::Parent:ActiveChild:hWnd == ::hWnd }
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TFrame FROM TControl
   DATA Type           INIT "FRAME" READONLY
   DATA nWidth         INIT 140
   DATA nHeight        INIT 140
   DATA TabHandle      INIT 0
   DATA aExcludeArea   INIT {}
   METHOD Caption      SETGET
   METHOD Define
   METHOD Events
   METHOD ToolTip      SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TGrid FROM TControl
   DATA aEditControls             INIT Nil
   DATA aEditKeys                 INIT Nil
   DATA aHeadClick                INIT {}
   DATA aHeaderImage              INIT {}
   DATA aHeaderImageAlign         INIT {}
   DATA aHeaders                  INIT {}
   DATA aHiddenCols               INIT {}
   DATA aJust                     INIT {}
   DATA AllowAppend               INIT .F.
   DATA AllowChangeSize           INIT .T.
   DATA AllowDelete               INIT .F.
   DATA AllowEdit                 INIT .F.
   DATA AllowMoveColumn           INIT .T.
   DATA aSelectedColors           INIT {}
   DATA aWhen                     INIT {}
   DATA aWidths                   INIT {}
   DATA bAfterColMove             INIT Nil
   DATA bAfterColSize             INIT Nil
   DATA bBeforeAutofit            INIT Nil
   DATA bBeforeColMove            INIT Nil
   DATA bBeforeColSize            INIT Nil
   DATA bCompareItems             INIT Nil
   DATA bDelWhen                  INIT Nil
   DATA bEditCellValue            INIT Nil
   DATA bHeadRClick               INIT Nil
   DATA bOnEnter                  INIT Nil
   DATA bOnScroll                 INIT NIL
   DATA bPosition                 INIT 0
   DATA cEditKey                  INIT "F2"
   DATA ClickOnCheckbox           INIT .T.
   DATA cRowEditTitle             INIT Nil
   DATA cText                     INIT ""
   DATA ColType                   INIT {}
   DATA DelMsg                    INIT Nil
   DATA aDynamicBackColor         INIT {}
   DATA aDynamicForeColor         INIT {}
   DATA EditControls              INIT Nil
   DATA FullMove                  INIT .F.
   DATA GridBackColor             INIT {}
   DATA GridForeColor             INIT {}
   DATA GridSelectedColors        INIT {}
   DATA HeaderFontHandle          INIT 0
   DATA HeaderImageList           INIT 0
   DATA ImageListColor            INIT CLR_DEFAULT
   DATA ImageListFlags            INIT LR_LOADTRANSPARENT + LR_DEFAULTCOLOR + LR_LOADMAP3DCOLORS
   DATA InPlace                   INIT .F.
   DATA lAppendMode               INIT .F.
   DATA lAppendOnAltA             INIT .F.
   DATA lAtFirstCol               INIT .T.
   DATA lBeginTrack               INIT .F.
   DATA lButtons                  INIT .F.
   DATA lCalledFromClass          INIT .F. PROTECTED
   DATA lChangeBeforeEdit         INIT .F.
   DATA lCheckBoxes               INIT .F.
   DATA lDividerDblclick          INIT .F.
   DATA lEditMode                 INIT .F.
   DATA lEndTrack                 INIT .F.
   DATA lExtendDblClick           INIT .F.
   DATA lFixedControls            INIT .F.
   DATA lFocusRect                INIT .T.
   DATA lKeysLikeClipper          INIT .F.
   DATA lLikeExcel                INIT .F.
   DATA lKeysOn                   INIT .T.
   DATA lNeedsAdjust              INIT .F.
   DATA lNested                   INIT .F.
   DATA lNestedEdit               INIT .F.
   DATA lNoDelMsg                 INIT .F.
   DATA lNoGrid                   INIT .F.
   DATA lNoHSB                    INIT .F.
   DATA lNoModal                  INIT .F.
   DATA lNoneUnsels               INIT .F.
   DATA lNoVSB                    INIT .F.
   DATA lPLM                      INIT .F.
   DATA lScrollBarUsesClientArea  INIT .F.
   DATA lShowItemAtTop            INIT .F.
   DATA lSilent                   INIT .F.
   DATA lTracking                 INIT .F.
   DATA nColPos                   INIT 0 PROTECTED
   DATA nDelayedClick             INIT { 0, 0, 0, Nil } PROTECTED
   DATA nEditRow                  INIT 0 PROTECTED
   DATA nHeight                   INIT 120
   DATA nRowPos                   INIT 0 PROTECTED
   DATA nVisibleItems             INIT 0
   DATA nWidth                    INIT 240
   DATA OnAbortEdit               INIT Nil
   DATA OnAppend                  INIT Nil
   DATA OnBeforeEditCell          INIT Nil
   DATA OnCheckChange             INIT Nil
   DATA OnDelete                  INIT Nil
   DATA OnDispInfo                INIT Nil
   DATA OnEditCell                INIT Nil
   DATA OnEditCellEnd             INIT Nil
   DATA OnInsert                  INIT Nil
   DATA Picture                   INIT {}
   DATA RClickOnCheckbox          INIT .T.
   DATA ReadOnly                  INIT Nil
   DATA SearchCol                 INIT 0
   DATA SearchLapse               INIT 1000
   DATA SearchWrap                INIT .T.
   DATA SetImageListCommand       INIT LVM_SETIMAGELIST
   DATA SetImageListWParam        INIT LVSIL_SMALL
   DATA Type                      INIT "GRID" READONLY
   DATA uIniTime                  INIT 0
   DATA Valid                     INIT Nil
   DATA ValidMessages             INIT Nil
   METHOD AddBitMap
   METHOD AddColumn
   METHOD AddItem
   METHOD AdjustResize
   METHOD Append                  SETGET
   METHOD AppendItem
   METHOD aItems                  SETGET
   METHOD BackColor               SETGET
   METHOD Cell
   METHOD CellCaption             BLOCK { | Self, nRow, nCol, cValue | CellRawValue( ::hWnd, nRow, nCol, 1, cValue ) }
   METHOD CellImage               BLOCK { | Self, nRow, nCol, nValue | CellRawValue( ::hWnd, nRow, nCol, 2, nValue ) }
   METHOD CheckItem               SETGET
   METHOD ColumnAutoFit
   METHOD ColumnAutoFitH
   METHOD ColumnBetterAutoFit
   METHOD ColumnCount
   METHOD ColumnHide
   METHOD ColumnOrder             SETGET
   METHOD ColumnsAutoFit
   METHOD ColumnsAutoFitH
   METHOD ColumnsBetterAutoFit
   METHOD ColumnShow
   METHOD ColumnWidth
   METHOD CompareItems
   METHOD CountPerPage            BLOCK { | Self | ListViewGetCountPerPage( ::hWnd ) }
   METHOD Define
   METHOD Define2
   METHOD Define4
   METHOD DeleteAllItems          BLOCK { | Self | ListViewReset( ::hWnd ), ::GridForeColor := Nil, ::GridBackColor := Nil, ::DoChange() }
   METHOD DeleteColumn
   METHOD DeleteItem
   METHOD DoEventMouseCoords
   METHOD Down
   METHOD DynamicBackColor         SETGET
   METHOD DynamicForeColor         SETGET
   METHOD EditAllCells
   METHOD EditCell
   METHOD EditCell2
   METHOD EditControlLikeExcel
   METHOD EditGrid
   METHOD EditItem
   METHOD EditItem2
   METHOD Events
   METHOD Events_Enter
   METHOD Events_Notify
   METHOD FirstColInOrder
   METHOD FirstSelectedItem       BLOCK { | Self | ListView_GetFirstItem( ::hWnd ) }
   METHOD FirstVisibleColumn
   METHOD FirstVisibleItem
   METHOD FixControls             SETGET
   METHOD FontColor               SETGET
   METHOD GoBottom
   METHOD GoTop
   METHOD Header
   METHOD HeaderHeight
   METHOD HeaderImage
   METHOD HeaderImageAlign
   METHOD HeaderSetFont
   METHOD HScrollUpdate
   METHOD HScrollVisible          SETGET
   METHOD InsertBlank
   METHOD InsertItem
   METHOD IsColumnReadOnly
   METHOD IsColumnWhen
   METHOD Item
   METHOD ItemCount               BLOCK { | Self | ListViewGetItemCount( ::hWnd ) }
   METHOD ItemHeight
   METHOD Justify
   METHOD LastColInOrder
   METHOD LastVisibleColumn
   METHOD Left
   METHOD LoadHeaderImages
   METHOD NextColInOrder
   METHOD NextPosToEdit
   METHOD OnEnter                 SETGET
   METHOD PageDown
   METHOD PageUp
   METHOD PriorColInOrder
   METHOD RefreshColors
   METHOD Release
   METHOD Right
   METHOD ScrollToCol
   METHOD ScrollToLeft
   METHOD ScrollToNext
   METHOD ScrollToPrior
   METHOD ScrollToRight
   METHOD SetColumn
   METHOD SetControlValue         BLOCK { |Self, nRow, nCol| Empty( nCol ), ::Value := nRow }
   METHOD SetItemColor
   METHOD SetRangeColor
   METHOD SetSelectedColors
   METHOD SortColumn
   METHOD SortItems
   METHOD ToExcel
   METHOD ToOpenOffice
   METHOD Up
   METHOD Value                   SETGET
   METHOD VScrollUpdate
   METHOD VScrollVisible          SETGET
   MESSAGE End                    METHOD GoBottom
   MESSAGE Home                   METHOD GoTop
   MESSAGE PanToLeft              METHOD ScrollToPrior
   MESSAGE PanToRight             METHOD ScrollToNext
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TGridMulti FROM TGrid
   DATA lDeleteAll                INIT .F.
   DATA Type                      INIT "MULTIGRID" READONLY
   METHOD Define
   METHOD DoChange
   METHOD Events_Notify
   METHOD SetControlValue         BLOCK { |Self, nRow, nCol| Empty( nCol ), ::Value := { nRow } }
   METHOD Value                   SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TGridByCell FROM TGrid
   DATA lFocusRect                INIT .F.
   DATA Type                      INIT "GRIDBYCELL" READONLY
   METHOD AddColumn
   METHOD Define
   METHOD DeleteAllItems
   METHOD DeleteColumn
   METHOD DeleteItem
   METHOD DoChange
   METHOD Down
   METHOD EditCell
   METHOD EditCell2
   METHOD EditGrid
   METHOD End
   METHOD Events
   METHOD Events_Notify
   METHOD GoBottom
   METHOD GoTop
   METHOD Home
   METHOD InsertBlank
   METHOD Left
   METHOD MoveToFirstCol
   METHOD MoveToFirstVisibleCol
   METHOD MoveToLastCol
   METHOD MoveToLastVisibleCol
   METHOD PageDown
   METHOD PageUp
   METHOD Right
   METHOD SetControlValue         BLOCK { |Self, nRow, nCol| If( nCol == NIL, nCol := 1, ), ::Value := { nRow, nCol } }
   METHOD SetSelectedColors
   METHOD Up
   METHOD Value                   SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TGridControl
   DATA Type                      INIT "TGRIDCONTROL" READONLY
   DATA oControl                  INIT Nil
   DATA oWindow                   INIT Nil
   DATA oGrid                     INIT Nil
   DATA Value                     INIT Nil
   DATA bWhen                     INIT Nil
   DATA cMemVar                   INIT Nil
   DATA bValid                    INIT Nil
   DATA cValidMessage             INIT Nil
   DATA nDefWidth                 INIT 140
   DATA nDefHeight                INIT 24
   DATA bCancel                   INIT Nil
   DATA bOk                       INIT Nil
   DATA lButtons                  INIT .F.
   DATA cImageOk                  INIT 'EDIT_OK_16'
   DATA cImageCancel              INIT 'EDIT_CANCEL_16'
   DATA lLikeExcel                INIT .F.
   DATA nOnFocusPos               INIT Nil
   DATA lNoModal                  INIT .F.
   METHOD New                     BLOCK { | Self | _OOHG_Eval( _OOHG_InitTGridControlDatas, Self ) }
   METHOD CreateWindow
   METHOD Valid
   METHOD Str2Val( uValue )       BLOCK { | Self, uValue | Empty( Self ), uValue }
   METHOD GridValue( uValue )     BLOCK { | Self, uValue | Empty( Self ), If( ValType( uValue ) $ "CM", Trim( uValue ), uValue ) }
   METHOD SetFocus                BLOCK { | Self | ::oControl:SetFocus() }
   METHOD SetValue( uValue )      BLOCK { | Self, uValue | ::oControl:Value := uValue }
   METHOD ControlValue            SETGET
   METHOD Enabled                 SETGET
   METHOD OnLostFocus             SETGET
   METHOD Visible                 SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TGridControlTextBox FROM TGridControl
   DATA cMask                     INIT ""
   DATA cType                     INIT ""
   DATA cEditKey                  INIT "F2"
   DATA lForceModal               INIT .F.
   DATA Type                      INIT "TGRIDCONTROLTEXTBOX" READONLY
   METHOD New
   METHOD CreateWindow
   METHOD CreateControl
   METHOD Str2Val
   METHOD GridValue
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TGridControlTextBoxAction FROM TGridControlTextBox
   DATA bAction                   INIT Nil
   DATA bAction2                  INIT Nil
   DATA Type                      INIT "TGRIDCONTROLTEXTBOXACTION" READONLY
   METHOD New
   METHOD CreateControl
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TGridControlMemo FROM TGridControl
   DATA nDefHeight                INIT 84
   DATA cTitle                    INIT _OOHG_Messages( 1, 11 )
   DATA lCleanCRLF                INIT .F.
   DATA nWidth                    INIT 350
   DATA nHeight                   INIT 265
   DATA lSize                     INIT .F.
   DATA lNoHScroll                INIT .F.
   DATA Type                      INIT "TGRIDCONTROLMEMO" READONLY
   METHOD New
   METHOD CreateWindow
   METHOD CreateControl
   METHOD GridValue
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TGridControlDatePicker FROM TGridControl
   DATA lUpDown
   DATA lShowNone
   DATA Type                      INIT "TGRIDCONTROLDATEPICKER" READONLY
   METHOD New
   METHOD CreateWindow
   METHOD CreateControl
   METHOD Str2Val( uValue )   BLOCK { |Self, uValue| Empty( Self ), CtoD( uValue ) }
   METHOD GridValue( uValue ) BLOCK { |Self, uValue| Empty( Self ), DtoC( uValue ) }
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TGridControlComboBox FROM TGridControl
   DATA aItems                    INIT {}
   DATA aValues                   INIT Nil
   DATA cWorkArea                 INIT ""
   DATA cField                    INIT ""
   DATA cValueSource              INIT ""
   DATA cRetValType               INIT "N"   // Needed because cWorkArea can be not opened yet when ::New is first executed
   DATA Type                      INIT "TGRIDCONTROLCOMBOBOX" READONLY
   METHOD New
   METHOD CreateWindow
   METHOD CreateControl
   METHOD Str2Val
   METHOD GridValue
   METHOD Refresh
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TGridControlComboBoxText FROM TGridControl
   DATA aItems                    INIT {}
   DATA lIncremental              INIT .F.
   DATA lWinSize                  INIT .F.
   DATA Type                      INIT "TGRIDCONTROLCOMBOBOXTEXT" READONLY
   METHOD New
   METHOD CreateWindow
   METHOD CreateControl
   METHOD Str2Val
   METHOD GridValue( uValue )     BLOCK { |Self, uValue| ::Str2Val( uValue ) }
   METHOD ControlValue            SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TGridControlSpinner FROM TGridControl
   DATA nRangeMin                 INIT 0
   DATA nRangeMax                 INIT 100
   DATA Type                      INIT "TGRIDCONTROLSPINNER" READONLY
   METHOD New
   METHOD CreateWindow
   METHOD CreateControl
   METHOD Str2Val( uValue )       BLOCK { |Self, uValue| Empty( Self ), Val( AllTrim( uValue ) ) }
   METHOD GridValue( uValue)      BLOCK { |Self, uValue| Empty( Self ), LTrim( Str( uValue ) ) }
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TGridControlCheckBox FROM TGridControl
   DATA cTrue                     INIT ".T."
   DATA cFalse                    INIT ".F."
   DATA Type                      INIT "TGRIDCONTROLCHECKBOX" READONLY
   METHOD New
   METHOD CreateWindow
   METHOD CreateControl
   METHOD Str2Val( uValue )       BLOCK { |Self, uValue| ( uValue == ::cTrue .OR. Upper( uValue ) == ".T." ) }
   METHOD GridValue( uValue )     BLOCK { |Self, uValue| If( uValue, ::cTrue, ::cFalse ) }
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TGridControlImageList FROM TGridControl
   DATA Type                      INIT "TGRIDCONTROLIMAGELIST" READONLY
   METHOD New
   METHOD CreateWindow
   METHOD CreateControl
   METHOD Str2Val( uValue )       BLOCK { |Self, uValue| Empty( Self ), If( ValType( uValue ) == "C", Val( uValue ), uValue ) }
   METHOD ControlValue            SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TGridControlImageData FROM TGridControl
   DATA Type                      INIT "TGRIDCONTROLIMAGEDATA" READONLY
   DATA oData
   METHOD New
   METHOD CreateWindow
   METHOD CreateControl
   METHOD ControlValue            SETGET
   METHOD OnLostFocus             SETGET
   METHOD Enabled                 SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TGridControlLComboBox FROM TGridControl
   DATA cTrue                     INIT ".T."
   DATA cFalse                    INIT ".F."
   DATA Type                      INIT "TGRIDCONTROLLCOMBOBOX" READONLY
   METHOD New
   METHOD CreateWindow
   METHOD CreateControl
   METHOD Str2Val( uValue )       BLOCK { |Self, uValue| ( uValue == ::cTrue .OR. Upper( uValue ) == ".T." ) }
   METHOD GridValue( uValue )     BLOCK { |Self, uValue| If( uValue, ::cTrue, ::cFalse ) }
   METHOD ControlValue            SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS THotKey FROM TControl
   DATA Type      INIT "HOTKEY" READONLY
   DATA nKey      INIT 0
   DATA nMod      INIT 0
   DATA OnClick
   METHOD Define
   METHOD Enabled      SETGET
   METHOD Release
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS THotKeyBox FROM TLabel
   DATA Type            INIT "HOTKEYBOX" READONLY
   DATA nWidth          INIT 120
   DATA nHeight         INIT 40
   DATA lForceAlt       INIT .T.
   METHOD Define
   METHOD Value       SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS THyperLink FROM TLabel
   DATA Type                      INIT "HYPERLINK" READONLY
   DATA URL                       INIT ""
   METHOD Define
   METHOD Address                 SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TImage FROM TControl
   DATA aCopies                   INIT {}
   DATA aExcludeArea              INIT {}
   DATA AutoFit                   INIT .T.
   DATA bOnClick                  INIT ""
   DATA bOnDblClick               INIT ""
   DATA bOnMClick                 INIT ""
   DATA bOnMDblClick              INIT ""
   DATA bOnRClick                 INIT ""
   DATA bOnRDblClick              INIT ""
   DATA cBuffer                   INIT ""
   DATA cPicture                  INIT ""
   DATA hImage                    INIT NIL
   DATA ImageSize                 INIT .F.
   DATA lNoCheckDepth             INIT .F.
   DATA lNo3DColors               INIT .F.
   DATA lNoDIBSection             INIT .F.
   DATA lNoTransparent            INIT .F.
   DATA lParentRedraw             INIT .T.
   DATA nHeight                   INIT 100
   DATA nWidth                    INIT 100
   DATA Stretch                   INIT .F.
   DATA Type                      INIT "IMAGE" READONLY
   METHOD Blend
   METHOD Buffer                  SETGET
   METHOD Copy
   METHOD CurrentSize
   METHOD Define
   METHOD Events
   METHOD HBitMap                 SETGET
   METHOD OnClick                 SETGET
   METHOD OnDblClick              SETGET
   METHOD OnMClick                SETGET
   METHOD OnMDblClick             SETGET
   METHOD OnRClick                SETGET
   METHOD OnRDblClick             SETGET
   METHOD OriginalSize
   METHOD Picture                 SETGET
   METHOD Release
   METHOD RePaint
   METHOD Save
   METHOD SizePos
   METHOD ToolTip                 SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TInternal FROM TControl
   DATA Type      INIT "INTERNAL" READONLY
   DATA nVirtualHeight INIT 0
   DATA nVirtualWidth  INIT 0
   DATA RangeHeight    INIT 0
   DATA RangeWidth     INIT 0
   DATA OnScrollUp     INIT nil
   DATA OnScrollDown   INIT nil
   DATA OnScrollLeft   INIT nil
   DATA OnScrollRight  INIT nil
   DATA OnHScrollBox   INIT nil
   DATA OnVScrollBox   INIT nil
   METHOD Define
   METHOD Events_VScroll
   METHOD Events_HScroll
   METHOD VirtualWidth        SETGET
   METHOD VirtualHeight       SETGET
   METHOD SizePos
   METHOD ScrollControls
   METHOD Events
   METHOD BackColor           SETGET
   METHOD BackColorCode       SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TIpAddress FROM TLabel
   DATA nHeight                   INIT 24
   DATA nWidth                    INIT 120
   DATA Type                      INIT "IPADDRESS" READONLY
   METHOD Define
   METHOD IsBlank
   METHOD String                  SETGET
   METHOD Value                   SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TLabel FROM TControl
   DATA Type                      INIT "LABEL" READONLY
   DATA lAutoSize                 INIT .F.
   DATA IconWidth                 INIT 0
   DATA nWidth                    INIT 120
   DATA nHeight                   INIT 24
   DATA Picture                   INIT nil
   METHOD SetText( cText )        BLOCK {| Self, cText | ::Caption := cText }
   METHOD GetText()               BLOCK {| Self | ::Caption }
   METHOD Define
   METHOD Value                   SETGET
   METHOD Caption                 SETGET
   METHOD AutoSize                SETGET
   METHOD Align                   SETGET
   METHOD SetFont
   METHOD LeftAlign               BLOCK {| Self | ::Align( SS_LEFT ) }
   METHOD RightAlign              BLOCK {| Self | ::Align( SS_RIGHT ) }
   METHOD CenterAlign             BLOCK {| Self | ::Align( SS_CENTER ) }
   METHOD SizePos
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TList FROM TControl
   DATA Type                      INIT "LIST" READONLY
   DATA nWidth                    INIT 120
   DATA nHeight                   INIT 120
   DATA nTextHeight               INIT 0
   DATA bOnEnter                  INIT Nil
   DATA lAdjustImages             INIT .F.
   DATA ImageListColor            INIT CLR_DEFAULT
   DATA ImageListFlags            INIT LR_LOADTRANSPARENT + LR_DEFAULTCOLOR + LR_LOADMAP3DCOLORS
   DATA lFocused                  INIT .F.
   DATA lMultiTab                 INIT .F.
   DATA nColWidth                 INIT 120
   DATA DragItem                  INIT 0
   DATA DragTo                    INIT 0
   METHOD Define
   METHOD Define2
   METHOD Value                   SETGET
   METHOD OnEnter                 SETGET
   METHOD Events
   METHOD Events_Command
   METHOD Events_Drag
   METHOD Events_DrawItem
   METHOD Events_MeasureItem
   METHOD AddItem
   METHOD DeleteItem( nItem )     BLOCK { |Self, nItem| ListBoxDeleteString( Self, nItem ) }
   METHOD DeleteAllItems          BLOCK { |Self| ListBoxReset( ::hWnd ) }
   METHOD Item
   METHOD InsertItem
   METHOD ItemCount               BLOCK { |Self| ListBoxGetItemCount( ::hWnd ) }
   METHOD ItemHeight              BLOCK { |Self| ListBoxGetItemHeight( ::hWnd ) }
   METHOD ColumnWidth             SETGET
   METHOD TopIndex                SETGET
   METHOD EnsureVisible
   METHOD aItems                  SETGET
   METHOD FindString
   METHOD FindStringExact
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TListMulti FROM TList
   DATA Type                      INIT "MULTILIST" READONLY
   METHOD Define
   METHOD Value                   SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TPlayer FROM TControl
   DATA Type      INIT "PLAYER" READONLY
   METHOD Define
   METHOD Release
   METHOD Play()             BLOCK { |Self| mcifunc( ::hWnd,  1 ) }
   METHOD Stop()             BLOCK { |Self| mcifunc( ::hWnd,  2 ) }
   METHOD Pause()            BLOCK { |Self| mcifunc( ::hWnd,  3 ) }
   METHOD Close()            BLOCK { |Self| mcifunc( ::hWnd,  4 ) }
   METHOD Eject()            BLOCK { |Self| mcifunc( ::hWnd,  6 ) }
   METHOD PositionEnd()      BLOCK { |Self| mcifunc( ::hWnd,  7 ) }
   METHOD PositionHome()     BLOCK { |Self| mcifunc( ::hWnd,  8 ) }
   METHOD Open(File)         BLOCK { |Self,File| mcifunc( ::hWnd,  9, File ) }
   METHOD OpenDialog()       BLOCK { |Self| mcifunc( ::hWnd, 10 ) }
   METHOD PlayReverse()      BLOCK { |Self| mcifunc( ::hWnd, 11 ) }
   METHOD Resume()           BLOCK { |Self| mcifunc( ::hWnd, 12 ) }
   METHOD Repeat(Status)     BLOCK { |Self,Status| mcifunc( ::hWnd, 13, Status ) }
   METHOD RepeatOn()         BLOCK { |Self| mcifunc( ::hWnd, 13, .t. ) }
   METHOD RepeatOff()        BLOCK { |Self| mcifunc( ::hWnd, 13, .f. ) }
   METHOD Speed(Speed)       BLOCK { |Self,Speed| mcifunc( ::hWnd, 14, Speed ) }
   METHOD Zoom(Zoom)         BLOCK { |Self,Zoom| mcifunc( ::hWnd, 16, Zoom ) }
   METHOD Length()           BLOCK { |Self| mcifunc( ::hWnd, 17 ) }
   METHOD Volume             SETGET
   METHOD Position           SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TAnimateBox FROM TControl
   DATA Type      INIT "ANIMATEBOX" READONLY
   METHOD Define
   METHOD Release            BLOCK { |Self| destroyanimate( ::hWnd ) , ::Super:Release() }
   METHOD Open(File)         BLOCK { |Self,File| openanimate( ::hWnd, File ) }
   METHOD Play               BLOCK { |Self| playanimate( ::hWnd ) }
   METHOD Stop               BLOCK { |Self| stopanimate( ::hWnd ) }
   METHOD Close              BLOCK { |Self| closeanimate( ::hWnd ) }
   METHOD Seek(Frame)        BLOCK { |Self,Frame| seekanimate( ::hWnd, Frame ) }
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TMenuParams
   DATA aMenuParams                    INIT _OOHG_DefaultMenuParams
   DATA lOwnerDraw                     INIT _OOHG_OwnerDrawMenus
   DATA Type                           INIT "MENUPARAMS"
   METHOD Border3D                     SETGET
   METHOD Colors                       SETGET
   METHOD CursorType                   SETGET
   METHOD Gradient                     SETGET
   METHOD OwnerDraw                    SETGET
   METHOD Params                       SETGET
   METHOD SeparatorType                SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TMenu FROM TControl
   DATA bOnInitPopUp                   INIT NIL
   DATA cFontID                        INIT NIL
   DATA cStatMsg                       INIT NIL
   DATA nTimeout                       INIT NIL
   DATA oMenuParams                    INIT NIL
   DATA lAdjust                        INIT .F.
   DATA lMain                          INIT .F.
   DATA Type                           INIT "MENU" READONLY
   METHOD Activate
   METHOD Border3D                     SETGET
   METHOD Colors                       SETGET
   METHOD CursorType                   SETGET
   METHOD Define
   METHOD DisableVisualStyle
   METHOD EndMenu
   METHOD Events_InitMenuPopUp( nPos ) BLOCK { |Self, nPos| _OOHG_EVAL( ::bOnInitPopUp, Self, nPos ) }
   METHOD Gradient                     SETGET
   METHOD ItemCount                    BLOCK { |Self| GetMenuItemCount( ::hWnd ) }
   METHOD ItemPosition( nItemId )      BLOCK { |Self, nItemId| FindItemPosition( ::hWnd, nItemId ) }
   METHOD OwnerDraw                    SETGET
   METHOD Params                       SETGET
   METHOD PopUpPosition( hWndPopUp )   BLOCK { |Self, hWndPopUp| FindPopUpPosition( ::hWnd, hWndPopUp ) }
   METHOD Refresh
   METHOD Release                      BLOCK { |Self| DestroyMenu( ::hWnd ), ::Super:Release() }
   METHOD Separator                    BLOCK { |Self| TMenuItem():DefineSeparator( NIL, Self ) }
   METHOD SeparatorType                SETGET
   METHOD SetMenuBarColor
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TMenuMain FROM TMenu
   DATA lMain                          INIT .T.
   METHOD Activate                     BLOCK { || NIL }
   METHOD Define
   METHOD Release                      BLOCK { |Self| ::Parent:oMenu := NIL, ::Super:Release() }
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TMenuContext FROM TMenu
   METHOD Define
   METHOD Release                      BLOCK { |Self| ::Parent:ContextMenu := NIL, ::Super:Release() }
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TMenuNotify FROM TMenu
   METHOD Define
   METHOD Release                      BLOCK { |Self| ::Parent:NotifyMenu := NIL, ::Super:Release() }
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TMenuDropDown FROM TMenu
   METHOD Define
   METHOD Release
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TMenuItem FROM TControl
   DATA aPicture                       INIT { "", "" }
   DATA bOnInitPopUp                   INIT NIL
   DATA cCaption                       INIT NIL
   DATA cFontID                        INIT NIL
   DATA cStatMsg                       INIT NIL
   DATA hBitMaps                       INIT { NIL, NIL }
   DATA hExternFont                    INIT NIL
   DATA lAdjust                        INIT .F.
   DATA lIsAtBar                       INIT .F.
   DATA lIsMenuBreak                   INIT .F.
   DATA lIsPopUp                       INIT .F.
   DATA lIsSeparator                   INIT .F.
   DATA lMain                          INIT .F.
   DATA lOwnerDraw                     INIT .F.
   DATA lStretch                       INIT .F.
   DATA nTimeout                       INIT NIL
   DATA oMenuParams                    INIT NIL
   DATA Type                           INIT "MENUITEM" READONLY
   DATA xData                          INIT NIL
   METHOD Border3D                     SETGET
   METHOD Caption                      SETGET
   METHOD Checked                      SETGET
   METHOD Colors                       SETGET
   METHOD CursorType                   SETGET
   METHOD DefaultItem( nItem )         BLOCK { |Self, nItem| SetMenuDefaultItem( ::Container:hWnd, nItem ) }   // one-based position or 0 for no default
   METHOD DefaultItemById              BLOCK { |Self| SetMenuDefaultItemById( ::Container:hWnd, ::Id ) }
   METHOD DefineItem
   METHOD DefinePopUp
   METHOD DefineSeparator
   METHOD DoEvent
   METHOD Enabled                      SETGET
   METHOD EndPopUp
   METHOD Events_DrawItem
   METHOD Events_InitMenuPopUp
   METHOD Events_MeasureItem
   METHOD Events_MenuHilited
   METHOD Gradient                     SETGET
   METHOD Hilited                      SETGET
   METHOD InsertItem
   METHOD InsertPopUp
   METHOD InsertSeparator
   METHOD OwnerDraw                    SETGET
   METHOD Picture                      SETGET
   METHOD Position
   METHOD Release
   METHOD Separator                    BLOCK { |Self| TMenuItem():DefineSeparator( NIL, Self ) }
   METHOD SeparatorType                SETGET
   METHOD SetItemsColor
   METHOD Stretch                      SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TMenuItemMRU FROM TControl
   DATA aItems                         INIT {}            // { { oCtrl, cName }, ... }
   DATA cFontId                        INIT NIL
   DATA cIniFile                       INIT "mru.ini"
   DATA cIniSection                    INIT "MRU"
   DATA cMsgItems                      INIT NIL
   DATA lIsAtBar                       INIT .F.
   DATA lOwnerDraw                     INIT .F.
   DATA nMaxItems                      INIT 7
   DATA nMaxLen                        INIT 40
   DATA nTimeout                       INIT NIL
   DATA oMenuParams                    INIT NIL
   DATA oTopItem                       INIT NIL
   DATA Type                           INIT "MENUMRUITEM" READONLY
   DATA uAction                        INIT NIL
   METHOD AddItem
   METHOD Border3D                     SETGET
   METHOD Clear
   METHOD Colors                       SETGET
   METHOD CursorType                   SETGET
   METHOD Define
   METHOD Gradient                     SETGET
   METHOD IniFile                      SETGET
   METHOD MaxItems                     SETGET
   METHOD Release
   METHOD Save
   METHOD SeparatorType                SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TMonthCal FROM TControl
   DATA Type                      INIT "MONTHCAL" READONLY
   DATA OnViewChange              INIT Nil
   DATA aBoldDays                 INIT {}
   METHOD Define
   METHOD Value                   SETGET
   METHOD SetFont
   METHOD Events_Notify
   METHOD FontColor               SETGET
   METHOD BackColor               SETGET
   METHOD TitleFontColor          SETGET
   METHOD TitleBackColor          SETGET
   METHOD TrailingFontColor       SETGET
   METHOD BackgroundColor         SETGET
   METHOD SetRange
   METHOD Define2
   METHOD CurrentView             SETGET
   METHOD Events
   METHOD Width                   SETGET
   METHOD Height                  SETGET
   METHOD AddBoldDay
   METHOD DelBoldDay
   METHOD IsBoldDay               BLOCK { |Self, dDay| aScan( ::aBoldDays, dDay ) > 0 }
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TMonthCalMulti FROM TMonthCal
   DATA Type                      INIT "MONTHCALMULTI" READONLY
   METHOD Define
   METHOD DoChange
   METHOD MaxSelCount             SETGET
   METHOD Value                   SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TNotifyIcon FROM TControl
   DATA Type               INIT "NOTIFYICON" READONLY
   DATA cPicture           INIT ""
   DATA hImage             INIT nil
   DATA lCreated           INIT .F.
   DATA nTrayId            INIT 0
   METHOD Define
   METHOD Release
   METHOD Picture          SETGET
   METHOD Buffer           SETGET
   METHOD HIcon            SETGET
   METHOD HBitMap          SETGET
   METHOD ToolTip          SETGET
   METHOD Events_TaskBar
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CREATE CLASS TPDF
   DATA afo1 INIT ;
   DATA afo2 INIT ;
   DATA afo3 INIT ;
   DATA cExecuteApp    INIT ""
   DATA cExecuteParams INIT ""
   DATA cPrintApp      INIT ""
   DATA cPrintParams   INIT ""
   DATA cFileName      INIT "file.pdf"
   DATA lIsPageActive  INIT .F.
   DATA aReport
   DATA nFontName                         //  1   font name
   DATA nFontSize                         //  2   font size
   DATA nFontNamePrev                     // 11   prev font name
   DATA nFontSizePrev                     // 12   prev font size
   DATA nHandle                           // 15   document length
   DATA nNextObj                          // 19   next obj
   DATA nPdfTop                           // 20   top row
   DATA nPdfLeft                          // 21   left & right margin in mm
   DATA nPdfBottom                        // 22   bottom row
   DATA nDocLen                           // 23   handle
   DATA aPages                            // 24   array of pages
   DATA aRefs                             // 25   array of references
   DATA aBookMarks                        // 26   array of bookmarks
   DATA aHeader                           // 27   array of headers
   DATA aFonts                            // 28   array of report fonts
   DATA aImages                           // 29   array of report images
   DATA aPageImages                       // 30   array of current page images
   DATA aPageFonts                        // 31   array of current page fonts
   DATA aFontWidth                        // 32   array of fonts width's
   DATA lOptimize                         // 33   optimized ?
   METHOD Init CONSTRUCTOR
   METHOD AtSay
   METHOD BMPInfo
   METHOD Bold
   METHOD BoldItalic
   METHOD BookAdd
   METHOD BookClose
   METHOD BookCount
   METHOD BookFirst
   METHOD BookLast
   METHOD BookNext
   METHOD BookOpen
   METHOD BookParent
   METHOD BookPrev
   METHOD Box
   METHOD Box1
   METHOD Center
   METHOD CheckLine
   METHOD Close
   METHOD CloseHeader
   METHOD ClosePage
   METHOD CreateHeader
   METHOD DeleteHeader
   METHOD DisableHeader
   METHOD DrawHeader
   METHOD EditOffHeader
   METHOD EditOnHeader
   METHOD EnableHeader
   METHOD Execute
   METHOD FilePrint
   METHOD GetFontInfo
   METHOD Header
   METHOD Image
   METHOD ImageInfo
   METHOD Italic
   METHOD JPEGInfo
   METHOD Length
   METHOD M2R
   METHOD M2X
   METHOD M2Y
   METHOD Margins
   METHOD NewLine
   METHOD NewPage
   METHOD Normal
   METHOD OpenHeader
   METHOD PageNumber
   METHOD PageOrient
   METHOD PageSize
   METHOD R2D
   METHOD R2M
   METHOD Reverse
   METHOD RJust
   METHOD SaveHeader
   METHOD SetFont
   METHOD SetLPI
   METHOD StringB
   METHOD Text
   METHOD TextCount
   METHOD TextNextPara
   METHOD TextPrint
   METHOD TIFFInfo
   METHOD UnderLine
   METHOD WriteToFile
   METHOD X2M
   METHOD Y2M
   METHOD _OOHG_Box
   METHOD _OOHG_Line
   METHOD Top
   METHOD Left
   METHOD Bottom
   METHOD Right
   METHOD Height
   METHOD Width
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TPicture FROM TControl
   DATA Type               INIT "PICTURE" READONLY
   DATA nWidth             INIT 100
   DATA nHeight            INIT 100
   DATA cPicture           INIT ""
   DATA Stretch            INIT .F.
   DATA AutoFit            INIT .F.
   DATA hImage             INIT nil
   DATA ImageSize          INIT .F.
   DATA nZoom              INIT 1
   DATA bOnClick           INIT nil
   DATA lNoDIBSection      INIT .F.
   DATA lNo3DColors        INIT .F.
   DATA lNoTransparent     INIT .F.
   DATA aExcludeArea       INIT {}
   DATA aCopies            INIT {}
   METHOD Define
   METHOD RePaint
   METHOD Release
   METHOD SizePos
   METHOD Picture          SETGET
   METHOD Buffer           SETGET
   METHOD HBitMap          SETGET
   METHOD Zoom             SETGET
   METHOD Rotate           SETGET
   METHOD OnClick          SETGET
   METHOD HorizontalScroll SETGET
   METHOD VerticalScroll   SETGET
   METHOD Events
   METHOD nDegree          SETGET
   METHOD Redraw
   METHOD ToolTip          SETGET
   METHOD OriginalSize
   METHOD CurrentSize
   METHOD Blend
   METHOD Copy
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TPRINTBASE
   DATA aBarColor                 INIT {1, 1, 1}             READONLY    // brush color for barcodes
   DATA aColor                    INIT {0, 0, 0}             READONLY    // brush color
   DATA aFontColor                INIT {0, 0, 0}             READONLY    // font color
   DATA aLinCelda                 INIT {}                    READONLY
   DATA aPageNames                INIT {}                    READONLY
   DATA aPorts                    INIT {}                    READONLY
   DATA aPrinters                 INIT {}                    READONLY
   DATA Cargo                     INIT "list"                READONLY    // document's name without extension
   DATA cDocument                 INIT ""                    READONLY    // document's name with extension
   DATA cFontName                 INIT "Courier New"         READONLY
   DATA cPageName                 INIT ""                    READONLY    // current page name
   DATA cPort                     INIT "PRN"                 READONLY
   DATA cPrinter                  INIT ""                    READONLY
   DATA cPrintLibrary             INIT ""                    READONLY
   DATA cTempFile                 INIT TEMP_FILE_NAME        READONLY
   DATA cUnits                    INIT "ROWCOL"              READONLY
   DATA cVersion                  INIT "(oohg-tprint)V 4.20" READONLY
   DATA ImPreview                 INIT .T.                   READONLY
   DATA lDocIsOpen                INIT .F.                   READONLY
   DATA lFontBold                 INIT .F.                   READONLY
   DATA lFontItalic               INIT .F.                   READONLY
   DATA lFontStrikeout            INIT .F.                   READONLY
   DATA lFontUnderline            INIT .F.                   READONLY
   DATA lIgnorePropertyError      INIT .T.                   READONLY
   DATA lIndentAll                INIT .F.                   READONLY    // Indent RicheEdit lines
   DATA lLandscape                INIT .F.                   READONLY    // Page orientation
   DATA lNoErrMsg                 INIT .T.                   READONLY
   DATA lPrError                  INIT .F.                   READONLY
   DATA lProp                     INIT .F.                   READONLY
   DATA lSaveTemp                 INIT .F.                   READONLY
   DATA lSeparateSheets           INIT .F.                   READONLY
   DATA lShowErrors               INIT .T.                   READONLY
   DATA lWinHide                  INIT .F.                   READONLY
   DATA nFontAngle                INIT 0                     READONLY
   DATA nFontSize                 INIT 12                    READONLY
   DATA nFontType                 INIT 1                     READONLY // font type (normal=0 or bold=1)
   DATA nFontWidth                INIT 0                     READONLY
   DATA nhFij                     INIT ( 12 / 3.70 )         READONLY
   DATA nLinPag                   INIT 0                     READONLY
   DATA nLMargin                  INIT 0                     READONLY
   DATA nMaxCol                   INIT 0                     READONLY
   DATA nMaxRow                   INIT 0                     READONLY
   DATA nmHor                     INIT ( 10 / 4.75 )         READONLY
   DATA nmVer                     INIT ( 10 / 2.35 )         READONLY
   DATA nPreviewSize              INIT 2                     READONLY
   DATA nStage                    INIT 0                     READONLY
   DATA nTMargin                  INIT 0                     READONLY
   DATA nUnitsLin                 INIT 1                     READONLY
   DATA nvFij                     INIT ( 12 / 1.65 )         READONLY
   DATA nwPen                     INIT 0.1                   READONLY    // pen width in MM, do not exceed 1
   DATA oWinReport                INIT NIL                   READONLY
   DATA uParent                   INIT NIL                   READONLY
   METHOD BeginDoc
   METHOD BeginDocX               BLOCK { || NIL }
   METHOD BeginPage
   METHOD BeginPageX              BLOCK { || NIL }
   METHOD Codabar
   METHOD Code128
   METHOD Code3_9
   METHOD CondenDos               BLOCK { || NIL }
   METHOD CondenDosX              BLOCK { || NIL }
   METHOD Ean13
   METHOD Ean8
   METHOD EndDoc
   METHOD EndDocX                 BLOCK { || NIL }
   METHOD EndPage
   METHOD EndPageX                BLOCK { || NIL }
   METHOD GetDefPrinter
   METHOD GetDefPrinterX          BLOCK { || NIL }
   METHOD Go_Code
   METHOD Ind25
   METHOD Init
   METHOD InitX                   BLOCK { || NIL }
   METHOD Int25
   METHOD IsDocOpen
   METHOD IsDocOpenX              INLINE ::lDocIsOpen
   METHOD Mat25
   METHOD MaxCol                  INLINE ::nMaxCol
   METHOD MaxRow                  INLINE ::nMaxRow
   METHOD NormalDos               BLOCK { || NIL }
   METHOD NormalDosX              BLOCK { || NIL }
   METHOD PrintBarcode
   METHOD PrintBarcodeX           BLOCK { || NIL }
   METHOD PrintData
   METHOD PrintDataX              BLOCK { || NIL }
   METHOD PrintImage
   METHOD PrintImageX             BLOCK { || NIL }
   METHOD PrintLine
   METHOD PrintLineX              BLOCK { || NIL }
   METHOD PrintMode
   METHOD PrintModeX              BLOCK { || NIL }
   METHOD PrintRectangle
   METHOD PrintRectangleX         BLOCK { || NIL }
   METHOD PrintRoundRectangle
   METHOD PrintRoundRectangleX    BLOCK { || NIL }
   METHOD Release
   METHOD ReleaseX                BLOCK { || NIL }
   METHOD SelPrinter
   METHOD SelPrinterX             BLOCK { || NIL }
   METHOD SetBarColor
   METHOD SetColor
   METHOD SetColorX               BLOCK { || NIL }
   METHOD SetCpl                  
   METHOD SetDosPort              
   METHOD SetFont
   METHOD SetFontType             
   METHOD SetFontX                BLOCK { || NIL }
   METHOD SetIndentation          
   METHOD SetLMargin              
   METHOD SetPreviewSize          
   METHOD SetPreviewSizeX         BLOCK { |Self| ::nPreviewSize }
   METHOD SetProp                 
   METHOD SetRawPrinter
   METHOD SetSeparateSheets       
   METHOD SetShowErrors           
   METHOD SetTMargin              
   METHOD SetUnits
   METHOD Sup5
   METHOD Upca
   METHOD Version                 INLINE ::cVersion
   MESSAGE PrintDos               METHOD PrintMode
   MESSAGE PrintRaw               METHOD PrintMode
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TMINIPRINT FROM TPRINTBASE
   METHOD BeginDocX
   METHOD BeginPageX
   METHOD EndDocX
   METHOD EndPageX
   METHOD GetDefPrinterX
   METHOD InitX
   METHOD IsDocOpenX
   METHOD MaxCol
   METHOD MaxRow
   METHOD PrintBarcodeX
   METHOD PrintDataX
   METHOD PrintImageX
   METHOD PrintLineX
   METHOD PrintRectangleX
   METHOD PrintRoundRectangleX
   METHOD ReleaseX
   METHOD SelPrinterX
   METHOD SetPreviewSizeX
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS THBPRINTER FROM TPRINTBASE
   DATA oHBPrn                    INIT NIL                   READONLY
   METHOD BeginDocX
   METHOD BeginPageX
   METHOD EndDocX
   METHOD EndPageX
   METHOD GetDefPrinterX
   METHOD InitX
   METHOD IsDocOpenX
   METHOD MaxCol
   METHOD MaxRow
   METHOD PrintBarcodeX
   METHOD PrintDataX
   METHOD PrintImageX
   METHOD PrintLineX
   METHOD PrintRectangleX
   METHOD PrintRoundRectangleX
   METHOD ReleaseX
   METHOD SelPrinterX
   METHOD SetColorX
   METHOD SetPreviewSizeX
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TDOSPRINT FROM TPRINTBASE
   DATA cBusca                    INIT ""                    READONLY
   DATA cString                   INIT ""                    READONLY
   DATA nOccur                    INIT 0                     READONLY
   DATA oWinPreview               INIT NIL                   READONLY
   METHOD BeginDocX
   METHOD BeginPageX
   METHOD CondenDosX
   METHOD EndDocX
   METHOD EndPageX
   METHOD InitX
   METHOD NextSearch
   METHOD NormalDosX
   METHOD PrintDataX
   METHOD PrintImage              BLOCK { || NIL }
   METHOD PrintLineX
   METHOD PrintModeX
   METHOD SearchString
   METHOD SelPrinterX
   METHOD Zoom
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TTXTPRINT FROM TDOSPRINT
   DATA cBusca                    INIT ""                    READONLY
   DATA cString                   INIT ""                    READONLY
   DATA nOccur                    INIT 0                     READONLY
   METHOD BeginDocX
   METHOD EndDocX
   METHOD InitX
   METHOD PrintImage              BLOCK { || NIL }
   METHOD PrintModeX
   METHOD SelPrinterX
   METHOD SetDosPort              BLOCK { || NIL }
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TRAWPRINT FROM TDOSPRINT
   METHOD BeginDocX
   METHOD InitX
   METHOD PrintModeX
   METHOD SelPrinterX
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TEXCELPRINT FROM TPRINTBASE
   DATA oExcel                    INIT NIL                   READONLY
   DATA oBook                     INIT NIL                   READONLY
   DATA oHoja                     INIT NIL                   READONLY
   METHOD BeginDocX
   METHOD BeginPageX
   METHOD EndDocX
   METHOD EndPageX
   METHOD InitX
   METHOD MaxCol                  INLINE iif( HB_ISOBJECT( ::oHoja ), ::oHoja:Columns:Count, 0 )
   METHOD MaxRow                  INLINE iif( HB_ISOBJECT( ::oHoja ), ::oHoja:Rows:Count, 0 )
   METHOD PrintDataX
   METHOD PrintImageX
   METHOD ReleaseX
   METHOD SelPrinterX             BLOCK { |Self| ::cPrinter := "EXCEL" }
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TSPREADSHEETPRINT FROM TPRINTBASE
   DATA aDoc                      INIT {}                    READONLY
   DATA nLinRel                   INIT 0                     READONLY
   DATA nLpp                      INIT 60                    READONLY    // lines per page
   DATA nXls                      INIT 0                     READONLY
   METHOD AddPage
   METHOD BeginDocX
   METHOD EndDocX
   METHOD EndPageX
   METHOD InitX
   METHOD PrintDataX
   METHOD PrintImage              BLOCK { || NIL }
   METHOD ReleaseX
   METHOD SelPrinterX             BLOCK { |Self| ::cPrinter := "BIFF" }
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS THTMLPRINTFROMEXCEL FROM TEXCELPRINT
   METHOD BeginDocX
   METHOD EndDocX
   METHOD InitX
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS THTMLPRINTFROMCALC FROM TCALCPRINT
   METHOD BeginDocX
   METHOD EndDocX
   METHOD InitX
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TRTFPRINT FROM TPRINTBASE
   DATA aPrintRtf                 INIT {}                    READONLY    // Document lines
   DATA nPrintRtf                 INIT 0                     READONLY    // Last font size used
   DATA nFontSize                 INIT 10                    READONLY    // In TPRINTBASE is 12
   DATA nMarginLef                INIT 10                    READONLY    // in mm
   DATA nMarginSup                INIT 15                    READONLY    // in mm
   DATA nMarginRig                INIT 10                    READONLY    // in mm
   DATA nMarginInf                INIT 15                    READONLY    // in mm
   METHOD BeginDocX
   METHOD EndDocX
   METHOD EndPageX
   METHOD InitX
   METHOD PrintDataX
   METHOD PrintImage              BLOCK { || NIL }
   METHOD PrintLineX
   METHOD SelPrinterX
   METHOD SetPageMargins
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TCSVPRINT FROM TPRINTBASE
   DATA aPrintCsv                 INIT {}                    READONLY
   METHOD BeginDocX
   METHOD EndDocX
   METHOD EndPageX
   METHOD InitX
   METHOD PrintDataX
   METHOD PrintImage              BLOCK { || NIL }
   METHOD SelPrinterX             BLOCK { |Self| ::cPrinter := "CSV" }
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TPDFPRINT FROM TPRINTBASE
   DATA aPaper                    INIT {}                    READONLY // paper types supported by pdf class
   DATA cPageOrient               INIT "P"                   READONLY // P = portrait, L = Landscape
   DATA cPageSize                 INIT ""                    READONLY // page size
   DATA oPDF                      INIT NIL                   READONLY // reference to the TPDF object
   METHOD BeginDocX
   METHOD BeginPageX
   METHOD EndDocX
   METHOD InitX
   METHOD MaxCol         
   METHOD MaxRow
   METHOD PrintBarcodeX
   METHOD PrintDataX
   METHOD PrintImageX
   METHOD PrintLineX
   METHOD PrintRectangleX
   METHOD PrintRoundRectangleX
   METHOD ReleaseX
   METHOD SelPrinterX
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TCALCPRINT FROM TPRINTBASE
   DATA oCell                     INIT NIL                   READONLY
   DATA oDesktop                  INIT NIL                   READONLY
   DATA oDocument                 INIT NIL                   READONLY
   DATA oSchedule                 INIT NIL                   READONLY
   DATA oServiceManager           INIT NIL                   READONLY
   DATA oSheet                    INIT NIL                   READONLY
   DATA nHorzResol                INIT PixelsPerInchX()      READONLY
   DATA nVertResol                INIT PixelsPerInchY()      READONLY
   METHOD BeginDocX
   METHOD BeginPageX
   METHOD EndDocX
   METHOD EndPageX
   METHOD InitX
   METHOD MaxCol                  INLINE iif( HB_ISOBJECT( ::oSheet ), ::oSheet:Columns:Count, 0 )
   METHOD MaxRow                  INLINE iif( HB_ISOBJECT( ::oSheet ), ::oSheet:Rows:Count, 0 )
   METHOD PrintDataX
   METHOD PrintImageX
   METHOD ReleaseX
   METHOD SelPrinterX             BLOCK { |Self| ::cPrinter := "CALC" }
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TProgressBar FROM TControl
   DATA Type                      INIT "PROGRESSBAR" READONLY
   DATA lRunning                  INIT .F.
   DATA nRangeMax                 INIT 100
   DATA nRangeMin                 INIT 0
   DATA nVelocity                 INIT 30
   METHOD BackColor               SETGET
   METHOD Define
   METHOD FontColor               SETGET
   METHOD IsMarqueeRunning
   METHOD IsStyleMarquee
   METHOD IsStyleNormal
   METHOD RangeMax                SETGET
   METHOD RangeMin                SETGET
   METHOD SetStyleMarquee
   METHOD SetStyleNormal
   METHOD StartMarquee
   METHOD StopMarquee
   METHOD Value                   SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TProgressMeter FROM TLabel
   DATA Type        INIT "PROGRESSMETER" READONLY
   DATA nRangeMin   INIT 0
   DATA nRangeMax   INIT 100
   DATA nPercent    INIT 0
   DATA nValue      INIT 0
   DATA nWidth      INIT 100
   DATA nHeight     INIT 18
   METHOD Define
   METHOD Value               SETGET
   METHOD ReCalc
   METHOD RangeMin            SETGET
   METHOD RangeMax            SETGET
   METHOD Events
   METHOD SetPercent          SETGET
   METHOD Align               SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TRadioGroup FROM TLabel
   DATA aOptions                   INIT {}
   DATA IconWidth                  INIT 19
   DATA LeftAlign                  INIT .F.
   DATA lHorizontal                INIT .F.
   DATA lLibDraw                   INIT .F.
   DATA lNoFocusRect               INIT .F.
   DATA lTabStop                   INIT .T.
   DATA nHeight                    INIT 25
   DATA nSpacing                   INIT 25
   DATA nWidth                     INIT 120
   DATA Type                       INIT "RADIOGROUP" READONLY
   METHOD AddItem
   METHOD AdjustResize
   METHOD Background               SETGET
   METHOD Caption
   METHOD ColMargin                BLOCK { |Self| - ::Col }
   METHOD Define
   METHOD DeleteItem
   METHOD DoChange
   METHOD Enabled                  SETGET
   METHOD GroupHeight
   METHOD GroupWidth
   METHOD InsertItem
   METHOD ItemCount                BLOCK { |Self| Len( ::aOptions ) }
   METHOD ItemEnabled
   METHOD ItemReadOnly
   METHOD ItemToolTip
   METHOD ReadOnly                 SETGET
   METHOD RowMargin                BLOCK { |Self| - ::Row }
   METHOD SetFocus
   METHOD SetFont
   METHOD SizePos
   METHOD Spacing                  SETGET
   METHOD TabStop                  SETGET
   METHOD ToolTip                  SETGET
   METHOD Value                    SETGET
   METHOD Visible                  SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TRadioItem FROM TLabel
   DATA IconWidth                  INIT 19
   DATA LeftAlign                  INIT .F.
   DATA lLibDraw                   INIT .F.
   DATA lNoFocusRect               INIT .F.
   DATA nHeight                    INIT 25
   DATA nWidth                     INIT 120
   DATA Type                       INIT "RADIOITEM" READONLY
   METHOD Background               SETGET
   METHOD Define
   METHOD Events
   METHOD Events_Color
   METHOD Events_Command
   METHOD Events_Notify
   METHOD Value                    SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TReg32
   DATA cRegKey
   DATA nKey
   DATA nHandle
   DATA nError
   DATA lError
   METHOD New
   METHOD Create
   METHOD Get
   METHOD Set
   METHOD Delete
   METHOD KeyDelete
   METHOD Close      BLOCK { |Self| iif( ::lError, NIL, ( ::nError := RegCloseKey( ::nHandle ) ) ) }
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TReport FROM TPRINTBASE
   DATA Type                      INIT "REPORT"
   DATA aLine                     INIT {}
   DATA aNGrpBy                   INIT {}
   DATA lExcel                    INIT .F.
   DATA nFSize                    INIT 0
   DATA nLMargin                  INIT 0
   DATA nLinesLeft                INIT 0
   DATA nPageNumber               INIT 0
   DATA oPrint                    INIT NIL
   METHOD Clean
   METHOD EasyReport1
   METHOD ExtReport1
   METHOD Headers
   METHOD LeaColI
   METHOD LeaDato
   METHOD LeaDatoH
   METHOD LeaDatoLogic
   METHOD LeaImage
   METHOD LeaRowI
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TReportFormWin FROM TPRINTBASE
   DATA aGroupTotals              INIT NIL
   DATA aReportData               INIT NIL
   DATA aReportTotals             INIT NIL
   DATA cExprBuff                 INIT NIL
   DATA cLengthsBuff              INIT NIL
   DATA cOffsetsBuff              INIT NIL
   DATA lFirstPass                INIT .T.
   DATA lNoSeps                   INIT .F.
   DATA nLinesLeft                INIT 0
   DATA nMaxLinesAvail            INIT 0
   DATA nPageNumber               INIT 0
   DATA nPoscol                   INIT 0
   DATA nPosrow                   INIT 0
   DATA oPrint                    INIT NIL
   DATA Type                      INIT "REPORTFORMWIN"
   METHOD DoEvents
   METHOD DoReport
   METHOD EjectPage
   METHOD GetExpr
   METHOD LoadFRM
   METHOD PrintHeader
   METHOD PrintLine
   METHOD PrintRecord
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TEditRich FROM TEdit
   DATA Type                      INIT "RICHEDIT" READONLY
   DATA nWidth                    INIT 120
   DATA nHeight                   INIT 240
   DATA OnSelChange               INIT Nil
   DATA lSelChanging              INIT .F.
   DATA lDefault                  INIT .T.
   METHOD Define
   METHOD FontColor               SETGET
   METHOD BackColor               SETGET
   METHOD RichValue               SETGET
   METHOD Events
   METHOD Events_Notify
   METHOD SetSelectionTextColor
   METHOD SetSelectionBackColor
   METHOD HideSelection
   METHOD GetSelText
   METHOD MaxLength               SETGET
   METHOD LoadFile
   METHOD SaveFile
   METHOD GetLastVisibleLine
   METHOD GetCharFromPos
   METHOD GetSelFont
   METHOD SetSelFont
   MESSAGE SetSelTextColor        METHOD SetSelectionTextColor
   MESSAGE SetSelBackColor        METHOD SetSelectionBackColor
   MESSAGE GetSelectionFont       METHOD GetSelFont
   MESSAGE SetSelectionFont       METHOD SetSelFont
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TScrollBar FROM TControl
   DATA FromhWnd                  INIT 0
   DATA lAdjust                   INIT .F.
   DATA lAutoMove                 INIT .F.
   DATA nFactor                   INIT 1
   DATA nLineSkip                 INIT 0
   DATA nOrient                   INIT SB_VERT
   DATA nPageSkip                 INIT 0
   DATA nRangeMax                 INIT 100
   DATA nRangeMin                 INIT 1
   DATA OnBottom                  INIT NIL
   DATA OnEndTrack                INIT NIL
   DATA OnLineDown                INIT NIL
   DATA OnLineUp                  INIT NIL
   DATA OnPageDown                INIT NIL
   DATA OnPageUp                  INIT NIL
   DATA OnThumb                   INIT NIL
   DATA OnTop                     INIT NIL
   DATA OnTrack                   INIT NIL
   DATA ScrollType                INIT SB_CTL
   DATA Type                      INIT "SCROLLBAR" READONLY
   METHOD Bottom
   METHOD Define
   METHOD Events_VScroll
   METHOD LineDown
   METHOD LineUp
   METHOD OnLeft                  SETGET
   METHOD OnLineLeft              SETGET
   METHOD OnLineRight             SETGET
   METHOD OnPageLeft              SETGET
   METHOD OnPageRight             SETGET
   METHOD OnRight                 SETGET
   METHOD Page                    SETGET
   METHOD PageDown
   METHOD PageUp
   METHOD RangeMax                SETGET
   METHOD RangeMin                SETGET
   METHOD SetRange
   METHOD Thumb
   METHOD Top
   METHOD Track
   METHOD Value                   SETGET
   MESSAGE Events_HScroll         METHOD Events_VScroll
   MESSAGE Left                   METHOD Top
   MESSAGE LineLeft               METHOD LineUp
   MESSAGE LineRight              METHOD LineDown
   MESSAGE PageLeft               METHOD PageUp
   MESSAGE PageRight              METHOD PageDown
   MESSAGE Right                  METHOD Bottom
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TScrollButton FROM TControl
   DATA lAdjust                                   INIT .F.
   DATA Type                                      INIT "SCROLLBUTTON" READONLY
   METHOD Define
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TSlider FROM TControl
   DATA Type        INIT "SLIDER" READONLY
   DATA nRangeMin   INIT 0
   DATA nRangeMax   INIT 10
   METHOD Define
   METHOD Value               SETGET
   METHOD RangeMin            SETGET
   METHOD RangeMax            SETGET
   METHOD BackColor           SETGET
   METHOD Events_Hscroll
   METHOD Events_Vscroll
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TSpinner FROM TControl
   DATA Type      INIT "SPINNER" READONLY
   DATA nRangeMin   INIT 1
   DATA nRangeMax   INIT 100
   DATA nWidth      INIT 120
   DATA nHeight     INIT 24
   DATA nIncrement  INIT 1
   DATA lBoundText  INIT .F.
   METHOD Define
   METHOD SizePos
   METHOD Visible             SETGET
   METHOD Value               SETGET
   METHOD Enabled             SETGET
   METHOD ForceHide           BLOCK { |Self| HideWindow( ::AuxHandle ) , ::Super:ForceHide() }
   METHOD Release
   METHOD RangeMin            SETGET
   METHOD RangeMax            SETGET
   METHOD Increment           SETGET
   METHOD Events_Command
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TSplitBox FROM TControl
   DATA Type                   INIT "SPLITBOX" READONLY
   DATA lForceBreak            INIT .T.
   DATA cGripperText           INIT ""
   DATA lInverted              INIT .F.
   DATA nMinWidth              INIT nil
   DATA nMinHeight             INIT nil
   METHOD Define
   METHOD SizePos              BLOCK { |Self| SizeRebar( ::hWnd ) , RedrawWindow( ::hWnd ) }
   METHOD Refresh              BLOCK { |Self| SizeRebar( ::hWnd ) , RedrawWindow( ::hWnd ) }
   METHOD Events_Size          BLOCK { |Self| SizeRebar( ::hWnd ) , RedrawWindow( ::hWnd ) }
   METHOD RefreshData          BLOCK { |Self| SizeRebar( ::hWnd ) , RedrawWindow( ::hWnd ) , ::Super:RefreshData() }
   METHOD AddControl
   METHOD SetSplitBox
   METHOD ClientHeightUsed     BLOCK { |Self| GetWindowHeight( ::hWnd )  }
   METHOD BandGripperOFF
   METHOD BandGripperON
   METHOD BandHasGripper
   METHOD HideBand
   METHOD ShowBand
   METHOD IsBandVisible
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TMessageBar FROM TControl
   DATA Type        INIT "MESSAGEBAR" READONLY
   DATA aClicks     INIT Nil
   DATA aRClicks    INIT Nil
   DATA aDblClicks  INIT Nil
   DATA aRDblClicks INIT Nil
   DATA aWidths     INIT Nil
   DATA lAutoAdjust INIT .T.
   DATA lTop        INIT .F.
   DATA ladjust     INIT .F.
   DATA cLedOn      INIT "zzz_led_on"
   DATA cLedOff     INIT "zzz_led_off"
   DATA aAligns     INIT {}
   DATA oTimer      INIT NIL
   METHOD Define
   METHOD EndStatus                      BLOCK { || _EndMessageBar() }
   METHOD AddItem
   METHOD Item
   METHOD Caption(nItem, cCaption, cAlign) BLOCK { |Self, nItem, cCaption, cAlign| ::Item( nItem, cCaption, cAlign ) }
   METHOD ItemWidth
   METHOD ItemCount                      BLOCK { |Self| GetItemCount( ::hWnd ) }
   METHOD ItemToolTip
   METHOD ItemIcon
   METHOD ItemClick
   METHOD ItemRClick
   METHOD ItemDblClick
   METHOD ItemRDblClick
   METHOD ClientHeightUsed               BLOCK { |Self| GetWindowHeight( ::hWnd ) * IF( ::lTop, 1, -1 ) }
   METHOD MinHeight                      SETGET
   METHOD BackColor                      SETGET
   METHOD ItemAlign
   METHOD SetClock
   METHOD SetKeybrd
   METHOD SetDate
   METHOD InitTimeout
   METHOD Release
   METHOD Events_Notify
   METHOD Events_Size
   METHOD RefreshData
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TTab FROM TTabMulti
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TTabDirect FROM TTabRaw
   DATA aPages                    INIT {}
   DATA lInternals                INIT .F.
   DATA nFirstValue               INIT NIL
   METHOD AddControl
   METHOD AddPage
   METHOD AdjustResize
   METHOD Caption
   METHOD Define
   METHOD DeleteControl
   METHOD DeletePage
   METHOD Enabled                 SETGET
   METHOD EndPage                 BLOCK { || _OOHG_DeleteFrame( "TABPAGE" ) }
   METHOD EndTab
   METHOD ForceHide
   METHOD HidePage
   METHOD ItemCount               BLOCK { |Self| Len( ::aPages ) }
   METHOD Picture
   METHOD RealPosition
   METHOD Refresh
   METHOD RefreshData
   METHOD Release
   METHOD SaveData
   METHOD ShowPage
   METHOD SizePos
   METHOD Value                   SETGET
   METHOD Visible                 SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TTabCombo FROM TMultiPage
   DATA lInternals                INIT .F.
   DATA Type                      INIT "TAB" READONLY
   METHOD Define
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TTabRadio FROM TMultiPage
   DATA lInternals                INIT .F.
   DATA Type                      INIT "TAB" READONLY
   METHOD Define
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TTabMulti FROM TMultiPage
   DATA lInternals                INIT .F.
   DATA Type                      INIT "TAB" READONLY
   METHOD AddPage
   METHOD Define
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TMultiPage FROM TControlGroup
   DATA aPages                    INIT {}
   DATA nFirstValue               INIT NIL
   DATA oContainerBase            INIT NIL
   DATA oPageClass                INIT TTabPage()
   DATA Type                      INIT "MULTIPAGE" READONLY
   METHOD AddControl
   METHOD AddPage
   METHOD AdjustResize
   METHOD BackColor               SETGET
   METHOD Caption
   METHOD CreatePages
   METHOD Define
   METHOD DeleteControl
   METHOD DeletePage
   METHOD Enabled                 SETGET
   METHOD EndPage                 BLOCK { |Self| _OOHG_DeleteFrame( ::oPageClass:Type ) }
   METHOD EndTab
   METHOD ForceHide
   METHOD HidePage
   METHOD ItemCount               BLOCK { |Self| Len( ::aPages ) }
   METHOD Picture
   METHOD RealPosition
   METHOD Refresh
   METHOD RefreshData
   METHOD Release
   METHOD SaveData
   METHOD SetFocus                BLOCK { |Self| ::oContainerBase:SetFocus() }
   METHOD ShowPage
   METHOD SizePos
   METHOD Value                   SETGET
   METHOD Visible                 SETGET
   METHOD bBeforeChange           SETGET
   METHOD ContainerCaption(x,y)   BLOCK { |Self,x,y| ::oContainerBase:Caption(x,y) }
   METHOD ContainerItemCount      BLOCK { |Self| ::oContainerBase:ItemCount() }
   METHOD ContainerValue          SETGET
   METHOD DeleteItem
   METHOD hWnd                    BLOCK { |Self| iif( ::oContainerBase == NIL, 0, ::oContainerBase:hWnd ) }
   METHOD InsertItem(w,x,y,z)     BLOCK { |Self,w,x,y,z| ::oContainerBase:InsertItem(w,x,y,z) }
   METHOD ItemAtPos( x, y )       BLOCK { |Self, x, y| ::oContainerBase:ItemAtPos( x, y ) }
   METHOD OnClick                 SETGET
   METHOD OnRClick                SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TTabRaw FROM TControl
   DATA aToolTips                 INIT {}
   DATA bBeforeChange             INIT NIL
   DATA DefaultToolTip            INIT ""
   DATA ImageListColor            INIT CLR_DEFAULT
   DATA ImageListFlags            INIT LR_LOADTRANSPARENT + LR_DEFAULTCOLOR + LR_LOADMAP3DCOLORS
   DATA SetImageListCommand       INIT TCM_SETIMAGELIST
   DATA Type                      INIT "TAB" READONLY
   METHOD Caption
   METHOD Define
   METHOD DeleteItem
   METHOD Events
   METHOD Events_Notify
   METHOD InsertItem
   METHOD ItemAtPos( y, x )       BLOCK { |Self, y, x| TabCtrl_HitTest( ::hWnd, y, x ) }
   METHOD ItemCount               BLOCK { |Self| TabCtrl_GetItemCount( ::hWnd ) }
   METHOD ItemSize                SETGET
   METHOD MinTabWidth             SETGET
   METHOD Picture
   METHOD SetPadding( w, h )      BLOCK { |Self, w, h| TabCtrl_SetPadding( ::hWnd, w, h ) }    // defaults is {6,3}
   METHOD TabsAreaHeight
   METHOD TabToolTip
   METHOD Value                   SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TTabPage FROM TControlGroup
   DATA Caption                   INIT ""
   DATA nImage                    INIT -1
   DATA Picture                   INIT ""
   DATA Position                  INIT 0
   DATA Type                      INIT "TABPAGE" READONLY
   METHOD AdjustResize
   METHOD ContainerVisible
   METHOD EndPage                 BLOCK { |Self| _OOHG_DeleteFrame( ::Type ) }
   METHOD Events_Size
   METHOD SaveData
   METHOD SetFocus                BLOCK { |Self| ::Container:SetFocus(), ::Container:Value := ::Position, Self }
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TTabPageInternal FROM TFormInternal
   DATA Caption                   INIT ""
   DATA cToolTip                  INIT ""
   DATA lHidden                   INIT .F.
   DATA nImage                    INIT -1
   DATA Picture                   INIT ""
   DATA Position                  INIT 0
   DATA Type                      INIT "TABPAGE" READONLY
   METHOD AdjustResize
   METHOD Define
   METHOD EndPage                 BLOCK { |Self| _OOHG_DeleteFrame( ::Type ) }
   METHOD Events_Size
   METHOD SetFocus                BLOCK { |Self| ::Container:SetFocus(), ::Container:Value := ::Position, ::Super:SetFocus(), Self }
   METHOD ToolTip                 SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TTextArray FROM TControl
   DATA Type                       INIT "TEXTARRAY" READONLY
   METHOD AssumeFixed              SETGET
   METHOD Clear
   METHOD Cls                      BLOCK { |Self| ::Clear(), ::DevPos( 0, 0 ) }
   METHOD ColCount                 SETGET
   METHOD CursorType               SETGET
   METHOD Define
   METHOD DevPos
   METHOD Events
   METHOD QOut( t )                BLOCK { |Self, t| ::Write( CRLF ), ::Write( t ) }
   METHOD QQOut( t )               BLOCK { |Self, t| ::Write( t ) }
   METHOD RowCount                 SETGET
   METHOD Scroll
   METHOD SetFont
   METHOD TextCol                  SETGET
   METHOD TextRow                  SETGET
   METHOD Write
   METHOD WriteLn( t, c, r, f, b ) BLOCK { |Self, t, c, r, f, b| ::Write( t, c, r, f, b), ::Write( CRLF ) }
   METHOD WriteRaw
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TText FROM TLabel
   DATA Type                      INIT "TEXT" READONLY
   DATA lSetting                  INIT .F.
   DATA nMaxLength                INIT 0
   DATA lAutoSkip                 INIT .F.
   DATA nOnFocusPos               INIT -2
   DATA nWidth                    INIT 120
   DATA nHeight                   INIT 24
   DATA OnTextFilled              INIT Nil
   DATA nDefAnchor                INIT 13   // TopBottomRight
   DATA bWhen                     INIT Nil
   DATA When_Processed            INIT .F.
   DATA When_Procesing            INIT .F.
   DATA lInsert                   INIT .T.
   DATA lFocused                  INIT .F.
   DATA xUndo                     INIT Nil
   DATA lPrevUndo                 INIT .F.
   DATA xPrevUndo                 INIT Nil
   DATA nInsertType               INIT 0
   DATA oButton1                  INIT Nil
   DATA oButton2                  INIT Nil
   METHOD Define
   METHOD Define2
   METHOD RefreshData
   METHOD Refresh                      BLOCK { |Self| ::RefreshData() }
   METHOD SizePos
   METHOD Enabled                      SETGET
   METHOD Visible                      SETGET
   METHOD AddControl
   METHOD DeleteControl
   METHOD AdjustResize( nDivh, nDivw ) BLOCK { |Self,nDivh,nDivw| ::Super:AdjustResize( nDivh, nDivw, .T. ) }
   METHOD Value                        SETGET
   METHOD SetFocus
   METHOD CaretPos                     SETGET
   METHOD ReadOnly                     SETGET
   METHOD MaxLength                    SETGET
   METHOD DoAutoSkip
   METHOD Events_Command
   METHOD Events
   METHOD ControlArea                  SETGET
   METHOD ControlPosition              SETGET
   METHOD ScrollCaret                  BLOCK { |Self| SendMessage( ::hWnd, EM_SCROLLCARET, 0, 0 ) }
   METHOD GetSelection
   METHOD SetSelection
   METHOD GetSelText
   METHOD InsertStatus                 SETGET
   METHOD GetLine
   METHOD GetLineIndex( nLine )        BLOCK { |Self,nLine| SendMessage( ::hWnd, EM_LINEINDEX, nLine, 0 ) }
   METHOD GetFirstVisibleLine          BLOCK { |Self| SendMessage( ::hWnd, EM_GETFIRSTVISIBLELINE, 0, 0 ) }
   METHOD GetLineCount                 BLOCK { |Self| SendMessage( ::hWnd, EM_GETLINECOUNT, 0, 0 ) }
   METHOD GetLineFromChar( nChar )
   METHOD GetCurrentLine               BLOCK { |Self| ::GetLineFromChar( -1 ) }
   METHOD GetLineLength( nLine )       BLOCK { |Self,nLine| SendMessage( ::hWnd, EM_LINELENGTH, ::GetLineIndex( nLine ), 0 ) }
   METHOD GetLastVisibleLine
   METHOD GetCharFromPos
   METHOD GetRect
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TTextPicture FROM TText
   DATA Type           INIT "TEXTPICTURE" READONLY
   DATA lBritish       INIT .F.
   DATA cPicture       INIT ""
   DATA PictureFun     INIT ""
   DATA PictureFunShow INIT ""
   DATA PictureMask    INIT ""
   DATA PictureShow    INIT ""
   DATA ValidMask      INIT {}
   DATA ValidMaskShow  INIT {}
   DATA nDecimal       INIT 0
   DATA nDecimalShow   INIT 0
   DATA DataType       INIT "."
   DATA cDateFormat    INIT Nil
   DATA lToUpper       INIT .F.
   DATA lNumericScroll INIT .F.
   DATA nYear          INIT Nil
   METHOD Define
   METHOD Value       SETGET
   METHOD Picture     SETGET
   METHOD Events
   METHOD KeyPressed
   METHOD Events_Command
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TTextNum FROM TText
   DATA Type          INIT "NUMTEXT" READONLY
   METHOD Define
   METHOD Value       SETGET
   METHOD Events_Command
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TTimer FROM TControl
   DATA Type      INIT "TIMER" READONLY
   DATA Interval  INIT 0
   METHOD Define
   METHOD Value        SETGET
   METHOD Enabled      SETGET
   METHOD Release
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TToolBar FROM TControl
   DATA Type                      INIT "TOOLBAR" READONLY
   DATA lAdjust                   INIT .T.
   DATA lfixfont                  INIT .T.
   DATA lTop                      INIT .T.
   DATA nButtonHeight             INIT 0
   DATA nButtonWidth              INIT 0
   DATA lVertical                 INIT .F.
   METHOD Define
   METHOD Events_Size
   METHOD Events_Notify
   METHOD Events
   METHOD Events_Command
   METHOD LookForKey
   METHOD ClientHeightUsed        BLOCK { |Self| GetWindowHeight( ::hWnd ) }
   METHOD Height                  SETGET
   METHOD Width                   SETGET
   METHOD AddButton
   METHOD DeleteButton
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TToolButton FROM TControl
   DATA Type      INIT "TOOLBUTTON" READONLY
   DATA Position  INIT 0
   DATA hImage    INIT 0
   DATA cPicture  INIT ""
   DATA oHotKey   INIT Nil
   DATA lAdjust   INIT .F.
   METHOD Define
   METHOD Value         SETGET
   METHOD Enabled       SETGET
   METHOD Picture       SETGET
   METHOD HBitMap       SETGET
   METHOD Buffer        SETGET
   METHOD Release
   METHOD Caption       SETGET
   METHOD RePaint
   METHOD Events_Notify
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TToolTip FROM TControl
   DATA cIcon                     INIT ''
   DATA cTitle                    INIT ''
   DATA lMultiLine                INIT .F.
   DATA nIcon                     INIT TTI_NONE
   DATA nWindowWidth              INIT -1
   DATA Type                      INIT "TOOLTIP" READONLY
   METHOD AutoPopTime             SETGET
   METHOD Define
   METHOD Events_Notify
   METHOD Icon                    SETGET
   METHOD InitialTime             SETGET
   METHOD Item
   METHOD MultiLine               SETGET
   METHOD ResetDelays
   METHOD ReshowTime              SETGET
   METHOD Title                   SETGET
   METHOD WindowWidth             SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TTree FROM TControl
   DATA Type                 INIT "TREE" READONLY
   DATA nWidth               INIT 120
   DATA nHeight              INIT 120
   DATA ItemIds              INIT .F.
   DATA aTreeMap             INIT {}
   DATA aTreeIdMap           INIT {}
   DATA aTreeNode            INIT {}
   DATA InitValue            INIT Nil
   DATA SetImageListCommand  INIT TVM_SETIMAGELIST
   DATA bOnEnter             INIT Nil
   DATA aSelColor            INIT BLUE             // background color of the select node
   DATA OnLabelEdit          INIT Nil
   DATA Valid                INIT Nil
   DATA aTreeRO              INIT {}
   DATA ReadOnly             INIT .T.
   DATA OnCheckChange        INIT Nil
   DATA hWndEditCtrl         INIT Nil
   DATA lSelBold             INIT .F.
   DATA aTreeEnabled         INIT {}
   DATA AutoScrollTimer      INIT Nil
   DATA AutoExpandTimer      INIT Nil
   DATA aTreeNoDrag          INIT {}
   DATA DragImageList        INIT 0                // contains drag image
   DATA DragActive           INIT .F.              // .T. if a drag and drop operation is going on
   DATA DragEnding           INIT .F.              // .T. if a drag and drop operation is ending
   DATA ItemOnDrag           INIT 0                // handle of the item being dragged
   DATA aTarget              INIT {}               // posible targets for the drop
   DATA LastTarget           INIT Nil              // last target hovered
   DATA CtrlLastDrop         INIT Nil              // reference to the control target of last drop operation
   DATA ItemLastDrop         INIT Nil              // reference to item added o moved in last drop operation
   DATA nLastIDNumber        INIT 0                // last number used by AutoID function
   DATA aItemIDs             INIT {}
   DATA OnMouseDrop          INIT Nil
   DATA OnDrop              INIT nil               // executed after drop is finished
   METHOD Define
   METHOD AddItem
   METHOD DeleteItem
   METHOD DeleteAllItems
   METHOD Item
   METHOD ItemCount          BLOCK { | Self | TreeView_GetCount( ::hWnd ) }
   METHOD Collapse
   METHOD Expand
   METHOD EndTree
   METHOD Value              SETGET
   METHOD OnEnter            SETGET
   METHOD Indent             SETGET
   METHOD Events
   METHOD Events_Notify
   METHOD EditLabel
   METHOD ItemReadonly
   METHOD SelColor           SETGET
   METHOD CheckItem
   METHOD GetParent
   METHOD GetChildren
   METHOD LookForKey
   METHOD Release
   METHOD BoldItem
   METHOD ItemEnabled
   METHOD CopyItem
   METHOD MoveItem
   METHOD ItemImages
   METHOD ItemDraggable
   METHOD IsItemCollapsed
   METHOD HandleToItem
   METHOD ItemToHandle
   METHOD ItemVisible
   METHOD IsItemExpanded
   METHOD IsItemVisible
   METHOD FirstVisible
   METHOD PrevVisible
   METHOD NextVisible
   METHOD LastVisible
   METHOD VisibleCount
   METHOD ItemHeight         SETGET
   METHOD SelectionID        SETGET
   METHOD IsItemValid
   METHOD BackColor          SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TWindow
   DATA aAcceleratorKeys          INIT {}                                     // Accelerator hotkeys: { Id, Mod, Key, Action }
   DATA aBEColors                 INIT {{0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}}   // outside color: up, right, bottom, left
   DATA aBIColors                 INIT {{0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}}   // inside color: up, right, bottom, left
   DATA aControlInfo              INIT { Chr( 0 ) }
   DATA aControls                 INIT {}
   DATA aControlsNames            INIT {}
   DATA Active                    INIT .F.
   DATA aCtrlsTabIndxs            INIT {}
   DATA aHotKeys                  INIT {}                                     // OS controlled hotkeys: { Id, Mod, Key, Action }
   DATA aKeys                     INIT {}                                     // App-controlled hotkeys: { Id, Mod, Key, Action }
   DATA aProperties               INIT {}                                     // Pseudo-properties: { cProperty, xValue }
   DATA bKeyDown                  INIT NIL                                    // WM_KEYDOWN handler
   DATA Block                     INIT NIL
   DATA Bold                      INIT .F.
   DATA Cargo                     INIT NIL
   DATA cFocusFontName            INIT ""
   DATA cFontName                 INIT ""
   DATA ClientAdjust              INIT 0                                      // 0=none, 1=top, 2=bottom, 3=left, 4=right, 5=client
   DATA ClientHeightUsed          INIT 0
   DATA ColMargin                 INIT 0
   DATA Container                 INIT NIL
   DATA ContainerhWndValue        INIT NIL
   DATA ContextMenu               INIT NIL
   DATA cStatMsg                  INIT NIL
   DATA DefBkColorEdit            INIT NIL
   DATA DropEnabled               INIT .F.                                    // .T. if control accepts drops
   DATA FntAdvancedGM             INIT .F.
   DATA FntAngle                  INIT 0
   DATA FntCharset                INIT DEFAULT_CHARSET
   DATA FntOrientation            INIT 0
   DATA FntWidth                  INIT 0
   DATA FocusBackColor
   DATA FocusBold                 INIT .F.
   DATA FocusColor
   DATA FocusItalic               INIT .F.
   DATA FocusStrikeout            INIT .F.
   DATA FocusUnderline            INIT .F.
   DATA HasDragFocus              INIT .F.                                    // .T. when drag image is over a drop-enabled control
   DATA hDC                                                                   
   DATA hDynamicValues            INIT NIL
   DATA HScrollBar                INIT NIL
   DATA hWnd                      INIT 0
   DATA IsAdjust                  INIT .F.
   DATA Italic                    INIT .F.
   DATA lAdjust                   INIT .T.
   DATA lControlsAsProperties     INIT .F.
   DATA lDestroyed                INIT .F.
   DATA lDisableDoEvent           INIT .F.
   DATA lEnabled                  INIT .T.
   DATA lFixFont                  INIT .F.
   DATA lfixwidth                 INIT .F.
   DATA lForm                     INIT .F.
   DATA lInternal                 INIT .T.
   DATA lProcMsgsOnVisible        INIT .T.
   DATA lRedraw                   INIT .T.
   DATA lReleasing                INIT .F.
   DATA lRtl                      INIT .F.
   DATA lVisible                  INIT .T.
   DATA lVisualStyled             INIT NIL PROTECTED
   DATA Name                      INIT ""
   DATA nAnchor                   INIT NIL
   DATA nBorders                  INIT {0,0,0}                                // size of outside border, size of gap, size of inside border.
   DATA nCol                      INIT 0
   DATA nDefAnchor                INIT 3
   DATA NestedClick               INIT .F.
   DATA nFixedHeightUsed          INIT 0
   DATA nFocusFontSize            INIT 0
   DATA nFontSize                 INIT 0
   DATA nHeight                   INIT 0
   DATA nOLdh                     INIT NIL
   DATA nOldw                     INIT NIL
   DATA nPaintCount                                                           // counter for GetDC and ReleaseDC methods
   DATA nRow                      INIT 0
   DATA nWidth                    INIT 0
   DATA nWindowState              INIT 0                                      // 0=normal 1=minimized 2=maximized
   DATA OnClick                   INIT NIL
   DATA OnDblClick                INIT NIL
   DATA OnDropFiles               INIT NIL
   DATA OnGotFocus                INIT NIL
   DATA OnLostFocus               INIT NIL
   DATA OnMClick                  INIT NIL
   DATA OnMDblClick               INIT NIL
   DATA OnMouseDrag               INIT NIL
   DATA OnMouseMove               INIT NIL
   DATA OnRClick                  INIT NIL
   DATA OnRDblClick               INIT NIL
   DATA OverWndProc               INIT NIL
   DATA Parent                    INIT NIL
   DATA RowMargin                 INIT 0
   DATA Strikeout                 INIT .F.
   DATA TabHandle                 INIT 0
   DATA Type                      INIT ""
   DATA Underline                 INIT .F.
   DATA VarName                   INIT ""
   DATA VScrollBar                INIT NIL
   DATA WndProc                   INIT NIL
   ERROR HANDLER Error
   METHOD AcceleratorKey                                                      // Accelerator hotkeys
   METHOD AcceptFiles             SETGET
   METHOD Action                  SETGET
   METHOD AddControl
   METHOD Adjust                  SETGET
   METHOD AdjustAnchor
   METHOD AdjustResize
   METHOD Anchor                  SETGET
   METHOD Arc
   METHOD ArcTo
   METHOD BackBitMap              SETGET
   METHOD BackColor               SETGET
   METHOD BackColorCode           SETGET
   METHOD BackColorSelected       SETGET
   METHOD Box
   METHOD BringToTop              BLOCK { |Self| BringWindowToTop( ::hWnd ) }
   METHOD BrushHandle             SETGET
   METHOD Caption                 SETGET
   METHOD CheckClientsPos
   METHOD Click                   BLOCK { |Self| ::DoEvent( ::OnClick, "CLICK" ) }
   METHOD Chord
   METHOD ClientHeight            SETGET
   METHOD ClientsPos
   METHOD ClientsPos2
   METHOD ClientWidth             SETGET
   METHOD ContainerEnabled        BLOCK { |Self| ::lEnabled .AND. iif( ::Container != NIL, ::Container:ContainerEnabled, .T. ) }
   METHOD ContainerReleasing      BLOCK { |Self| ::lReleasing .OR. iif( ::Container != NIL, ::Container:ContainerReleasing, iif( ::Parent != NIL, ::Parent:ContainerReleasing, .F. ) ) }
   METHOD ContainerVisible        BLOCK { |Self| ::lVisible .AND. iif( ::Container != NIL, ::Container:ContainerVisible, .T. ) }
   METHOD Control
   METHOD DebugMessageName
   METHOD DebugMessageNameCommand
   METHOD DebugMessageNameNotify
   METHOD DebugMessageQuery
   METHOD DebugMessageQueryNotify
   METHOD DefWindowProc( nMsg, wParam, lParam ) BLOCK { |Self, nMsg, wParam, lParam| DefWindowProc( ::hWnd, nMsg, wParam, lParam ) }
   METHOD DeleteControl
   METHOD Disable                 BLOCK { |Self| ::Enabled := .F. }
   METHOD DisableVisualStyle
   METHOD DynamicValues           BLOCK { |Self| iif( ::hDynamicValues == NIL, ::hDynamicValues := TDynamicValues():New( Self ), ::hDynamicValues ) }
   METHOD Ellipse
   METHOD Enable                  BLOCK { |Self| ::Enabled := .T. }
   METHOD Enabled                 SETGET
   METHOD Events
   METHOD Events_Color            BLOCK { || NIL }
   METHOD Events_Enter            BLOCK { || NIL }
   METHOD Events_HScroll          BLOCK { || NIL }
   METHOD Events_Size             BLOCK { || NIL }
   METHOD Events_VScroll          BLOCK { || NIL }
   METHOD ExStyle                 SETGET
   METHOD Fill
   METHOD FontColor               SETGET
   METHOD FontColorCode           SETGET
   METHOD FontColorSelected       SETGET
   METHOD FontHandle              SETGET
   METHOD ForceHide               BLOCK { |Self| HideWindow( ::hWnd ), ::CheckClientsPos(), ProcessMessages() }
   METHOD GetBitMap( l )          BLOCK { |Self, l| _GetBitMap( ::hWnd, l ) }
   METHOD GetDC                   INLINE iif( ::hDC == NIL, ::hDC := GetDC( ::hWnd ), ), iif( ::nPaintCount == NIL, ::nPaintCount := 1, ::nPaintCount ++ ), ::hDC
   METHOD GetMaxCharsInWidth
   METHOD GetTextHeight
   METHOD GetTextWidth
   METHOD Hide                    BLOCK { |Self| ::Visible := .F. }
   METHOD HotKey                                                              // OS-controlled hotkeys
   METHOD ImageList               SETGET
   METHOD IsVisualStyled
   METHOD Line
   METHOD LookForKey
   METHOD Object                  BLOCK { |Self| Self }
   METHOD ParentDefaults
   METHOD Pie
   METHOD PolyBezier
   METHOD PolyBezierTo
   METHOD Polygon
   METHOD PreRelease
   METHOD Print
   METHOD Property                                                            // Pseudo-properties
   METHOD ReDraw                  BLOCK { |Self| RedrawWindow( ::hWnd ) }
   METHOD RefreshData
   METHOD Release
   METHOD ReleaseAttached
   METHOD ReleaseDC               INLINE iif( -- ::nPaintCount == 0, iif( ReleaseDC( ::hWnd, ::hDC ), ::hDC := NIL, NIL ), NIL )
   METHOD RoundBox
   METHOD RTL                     SETGET
   METHOD SaveAs
   METHOD SaveData
   METHOD SearchParent
   METHOD SetFocus
   METHOD SethWnd
   METHOD SetKey                                                              // Application-controlled hotkeys
   METHOD SetRedraw
   METHOD SetSplitBox             BLOCK { || .F. }                            // Specific hack
   METHOD SetSplitBoxInfo         BLOCK { |Self, a, b, c, d| iif( ::Container != NIL, ::Container:SetSplitBox( a, b, c, d ), .F. ) }   // Specific hack
   METHOD Show                    BLOCK { |Self| ::Visible := .T. }
   METHOD StartInfo
   METHOD Style                   SETGET
   METHOD TabStop                 SETGET
   METHOD Value                   BLOCK { || NIL }
   METHOD Visible                 SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TDynamicValues
   DATA oWnd
   METHOD New
   ERROR HANDLER Error
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TXBrowse FROM TGrid
   DATA aColumnBlocks             INIT Nil
   DATA aDefaultValues            INIT Nil
   DATA aFields                   INIT Nil
   DATA aReplaceField             INIT Nil
   DATA Bof                       INIT .F.
   DATA Eof                       INIT .F.
   DATA goBottomBlock             INIT Nil
   DATA goTopBlock                INIT Nil
   DATA lDescending               INIT .F.
   DATA lForceInPlace             INIT .T.
   DATA lFixedBlocks              INIT .F.
   DATA lLocked                   INIT .F.
   DATA lNoShowEmptyRow           INIT .F.
   DATA Lock                      INIT .F.
   DATA lRecCount                 INIT .F.
   DATA lRefreshAfterValue        INIT .F.
   DATA lScrollBarUsesClientArea  INIT .T.
   DATA lUpdCols                  INIT .F.
   DATA nHelpId                   INIT 0
   DATA OnRefreshRow              INIT Nil
   DATA oWorkArea                 INIT Nil
   DATA RefreshType               INIT REFRESH_DEFAULT
   DATA ScrollButton              INIT Nil
   DATA SearchWrap                INIT .F.
   DATA skipBlock                 INIT Nil
   DATA Type                      INIT "XBROWSE" READONLY
   DATA uWorkArea                 INIT Nil
   DATA VScroll                   INIT Nil
   DATA VScrollCopy               INIT Nil
   METHOD AddColumn
   METHOD AddItem                 BLOCK { || Nil }
   METHOD AdjustRightScroll
   METHOD AppendItem
   METHOD ColumnAutoFit
   METHOD ColumnAutoFitH
   METHOD ColumnBlock
   METHOD ColumnsAutoFit
   METHOD ColumnsAutoFitH
   METHOD ColumnWidth
   METHOD CurrentRow              SETGET
   METHOD DbSkip
   METHOD Define
   METHOD Define3
   METHOD Define4
   METHOD Delete
   METHOD DeleteAllItems          BLOCK { | Self | ::nRowPos := 0, ::Super:DeleteAllItems() }
   METHOD DeleteColumn
   METHOD DoChange                BLOCK { | Self | ::DoEvent( ::OnChange, "CHANGE" ) }
   METHOD Down
   METHOD EditAllCells
   METHOD EditCell
   METHOD EditGrid
   METHOD EditItem
   METHOD EditItem_B
   METHOD Enabled                 SETGET
   METHOD Events
   METHOD Events_Notify
   METHOD FixBlocks               SETGET
   METHOD FixControls             SETGET
   METHOD GetCellType
   METHOD GoBottom
   METHOD GoTop
   METHOD HelpId                  SETGET
   METHOD HScrollVisible          SETGET
   METHOD InsertItem              BLOCK { || Nil }
   METHOD Left                    BLOCK { || Nil }
   METHOD MoveTo
   METHOD PageDown
   METHOD PageUp
   METHOD Refresh
   METHOD RefreshData
   METHOD RefreshRow
   METHOD Right                   BLOCK { || Nil }
   METHOD SetColumn
   METHOD SetControlValue         SETGET
   METHOD SetScrollPos
   METHOD SizePos
   METHOD SortColumn              BLOCK { || Nil }
   METHOD SortItems               BLOCK { || Nil }
   METHOD ToExcel
   METHOD ToolTip                 SETGET
   METHOD ToOpenOffice
   METHOD TopBottom
   METHOD Up
   METHOD Value                   SETGET
   METHOD Visible                 SETGET
   METHOD VScrollUpdate
   METHOD VScrollVisible          SETGET
   METHOD WorkArea                SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS ooHGRecord
   DATA cAlias__
   METHOD New
   METHOD Use
   METHOD Skipper
   METHOD OrdScope
   METHOD Filter
   METHOD IsTableEmpty
   METHOD Field       BLOCK { | Self, nPos |                   ( ::cAlias__ )->( Field( nPos ) ) }
   METHOD FieldBlock  BLOCK { | Self, cField |                 ( ::cAlias__ )->( FieldBlock( cField ) ) }
   METHOD FieldGet    BLOCK { | Self, nPos |                   ( ::cAlias__ )->( FieldGet( nPos ) ) }
   METHOD FieldName   BLOCK { | Self, nPos |                   ( ::cAlias__ )->( FieldName( nPos ) ) }
   METHOD FieldPos    BLOCK { | Self, cField |                 ( ::cAlias__ )->( FieldPos( cField ) ) }
   METHOD FieldPut    BLOCK { | Self, nPos, uValue |           ( ::cAlias__ )->( FieldPut( nPos, uValue ) ) }
   METHOD Locate      BLOCK { | Self, bFor, bWhile, nNext, nRec, lRest | ( ::cAlias__ )->( __dbLocate( bFor, bWhile, nNext, nRec, lRest ) ) }
   METHOD Seek        BLOCK { | Self, uKey, lSoftSeek, lLast | ( ::cAlias__ )->( DbSeek( uKey, lSoftSeek, lLast ) ) }
   METHOD Skip        BLOCK { | Self, nCount |                 ( ::cAlias__ )->( DbSkip( nCount ) ) }
   METHOD GoTo        BLOCK { | Self, nRecord |                ( ::cAlias__ )->( DbGoTo( nRecord ) ) }
   METHOD GoTop       BLOCK { | Self |                         ( ::cAlias__ )->( DbGoTop() ) }
   METHOD GoBottom    BLOCK { | Self |                         ( ::cAlias__ )->( DbGoBottom() ) }
   METHOD Commit      BLOCK { | Self |                         ( ::cAlias__ )->( DbCommit() ) }
   METHOD Unlock      BLOCK { | Self |                         ( ::cAlias__ )->( DbUnlock() ) }
   METHOD Delete      BLOCK { | Self |                         ( ::cAlias__ )->( DbDelete() ) }
   METHOD Close       BLOCK { | Self |                         ( ::cAlias__ )->( DbCloseArea() ) }
   METHOD BOF         BLOCK { | Self |                         ( ::cAlias__ )->( BOF() ) }
   METHOD EOF         BLOCK { | Self |                         ( ::cAlias__ )->( EOF() ) }
   METHOD RecNo       BLOCK { | Self |                         ( ::cAlias__ )->( RecNo() ) }
   METHOD RecCount    BLOCK { | Self |                         ( ::cAlias__ )->( RecCount() ) }
   METHOD Found       BLOCK { | Self |                         ( ::cAlias__ )->( Found() ) }
   METHOD SetOrder    BLOCK { | Self, uOrder |                 ( ::cAlias__ )->( ORDSETFOCUS( uOrder ) ) }
   METHOD SetIndex    BLOCK { | Self, cFile, lAdditive |       If( EMPTY( lAdditive ), ( ::cAlias__ )->( ordListClear() ), ) , ( ::cAlias__ )->( ordListAdd( cFile ) ) }
   METHOD Append      BLOCK { | Self |                         ( ::cAlias__ )->( DbAppend() ) }
   METHOD Lock        BLOCK { | Self |                         ( ::cAlias__ )->( RLock() ) }
   METHOD DbStruct    BLOCK { | Self |                         ( ::cAlias__ )->( DbStruct() ) }
   METHOD OrdKeyNo    BLOCK { | Self |                         If( ( ::cAlias__ )->( OrdKeyCount() ) > 0, ( ::cAlias__ )->( OrdKeyNo() ), ( ::cAlias__ )->( RecNo() ) ) }
   METHOD OrdKeyCount BLOCK { | Self |                         If( ( ::cAlias__ )->( OrdKeyCount() ) > 0, ( ::cAlias__ )->( OrdKeyCount() ), ( ::cAlias__ )->( RecCount() ) ) }
   METHOD OrdKeyGoTo  BLOCK { | Self, nRecord |                ( ::cAlias__ )->( OrdKeyGoTo( nRecord ) ) }
   ERROR HANDLER FieldAssign
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TVirtualField
   DATA bRecordId                 INIT Nil
   DATA hValues                   INIT Nil
   DATA xArea                     INIT Nil
   DATA xDefault                  INIT Nil
   METHOD New
   METHOD RecordId
   METHOD Value                   SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS TXBrowseByCell FROM TXBrowse
   DATA lFocusRect                INIT .F.
   DATA Type                      INIT "XBROWSEBYCELL" READONLY
   METHOD AddColumn
   METHOD CurrentCol              SETGET
   METHOD Define2
   METHOD Define3
   METHOD DeleteAllItems          BLOCK { | Self | ::nColPos := 0, ::Super:DeleteAllItems() }
   METHOD DeleteColumn
   METHOD Down
   METHOD EditAllCells
   METHOD EditCell
   METHOD EditGrid
   METHOD End
   METHOD Events
   METHOD Events_Notify
   METHOD GoBottom
   METHOD GoTop
   METHOD Home
   METHOD Left
   METHOD MoveTo
   METHOD MoveToFirstCol
   METHOD MoveToFirstVisibleCol
   METHOD MoveToLastCol
   METHOD MoveToLastVisibleCol
   METHOD Refresh
   METHOD Right
   METHOD SetControlValue         SETGET
   METHOD SetSelectedColors
   METHOD Up
   METHOD Value                   SETGET
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
CLASS HBPrinter
   DATA hDC                     INIT 0
   DATA hDCRef                  INIT 0
   DATA PrinterName             INIT ""
   DATA nFromPage               INIT 1
   DATA nToPage                 INIT 0
   DATA CurPage                 INIT 1
   DATA nCopies                 INIT 1
   DATA nWhatToPrint            INIT 0
   DATA PrintOpt                INIT 1
   DATA PrinterDefault          INIT ""
   DATA Error                   INIT 0
   DATA PaperNames              INIT {}
   DATA BinNames                INIT {}
   DATA DocName                 INIT "HBPRINTER"
   DATA TextColor               INIT 0
   DATA BkColor                 INIT 0xFFFFFF
   DATA BkMode                  INIT BKMODE_TRANSPARENT
   DATA PolyFillMode            INIT 1
   DATA Cargo                   INIT { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
   DATA Fonts                   INIT { {}, {}, 0, {} }
   DATA Brushes                 INIT { {}, {} }
   DATA Pens                    INIT { {}, {} }
   DATA Regions                 INIT { {}, {} }
   DATA Imagelists              INIT { {}, {} }
   DATA Units                   INIT 0
   DATA DevCaps                 INIT { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0 }
   DATA MAxRow                  INIT 0
   DATA MaxCol                  INIT 0
   DATA MetaFiles               INIT {}
   DATA PreviewMode             INIT .F.
   DATA Thumbnails              INIT .F.
   DATA Viewportorg             INIT { 0, 0 }
   DATA PreviewRect             INIT { 0, 0, 0, 0 }
   DATA PrintingEMF             INIT .F.
   DATA Printing                INIT .F.
   DATA PreviewScale            INIT 1
   DATA Printers                INIT {}
   DATA Ports                   INIT {}
   DATA iLoscstron              INIT 0
   DATA nGroup                  INIT -1
   DATA Page                    INIT 1
   DATA AtH                     INIT {}
   DATA dx                      INIT 0
   DATA dy                      INIT 0
   DATA AHs                     INIT {}
   DATA aZoom                   INIT { 0, 0, 0, 0 }
   DATA Scale                   INIT 1
   DATA npages                  INIT {}
   DATA aOpisy                  INIT {}
   DATA oWinPreview             INIT NIL
   DATA oWinPrOpt               INIT NIL
   DATA oWinPagePreview         INIT NIL
   DATA oWinThumbs              INIT NIL
   DATA NoButtonSave            INIT .F.
   DATA NoButtonOptions         INIT .F.
   DATA BeforePrint             INIT {|| .T. }
   DATA AfterPrint              INIT {|| NIL }
   DATA BeforePrintCopy         INIT {|| .T. }
   DATA InMemory                INIT .F.
   DATA TimeStamp               INIT ""
   DATA BaseDoc                 INIT ""
   DATA lGlobalChanges          INIT .T.
   DATA lAbsoluteCoords         INIT .F.
   DATA hData                   INIT 0
   METHOD New
   METHOD SelectPrinter
   METHOD SetDevMode
   METHOD StartDoc
   METHOD SetPage
   METHOD StartPage
   METHOD EndPage
   METHOD EndDoc
   METHOD SetTextColor
   METHOD GetTextColor          INLINE ::TextColor
   METHOD SetBkColor
   METHOD GetBkColor            INLINE ::BkColor
   METHOD SetBkMode
   METHOD GetBkMode             INLINE ::BkMode
   METHOD DefineImageList
   METHOD DrawImageList
   METHOD DefineBrush
   METHOD ModifyBrush
   METHOD SelectBrush
   METHOD DefinePen
   METHOD ModifyPen
   METHOD SelectPen
   METHOD DefineFont
   METHOD ModifyFont
   METHOD SelectFont
   METHOD GetObjByName
   METHOD DrawText
   METHOD TextOut
   METHOD Say
   METHOD SetCharset( charset ) INLINE RR_SETCHARSET( charset, ::hData, Self )
   METHOD Rectangle
   METHOD RoundRect
   METHOD FillRect
   METHOD FrameRect
   METHOD InvertRect
   METHOD Ellipse
   METHOD Arc
   METHOD ArcTo
   METHOD Chord
   METHOD Pie
   METHOD Polygon
   METHOD PolyBezier
   METHOD PolyBezierTo
   METHOD SetUnits
   METHOD Convert
   METHOD DefineRectRgn
   METHOD DefinePolygonRgn
   METHOD DefineEllipticRgn
   METHOD DefineRoundRectRgn
   METHOD CombineRgn
   METHOD SelectClipRgn
   METHOD DeleteClipRgn
   METHOD SetPolyFillMode
   METHOD GetPolyFillMode       INLINE ::PolyFillMode
   METHOD SetViewPortOrg
   METHOD GetViewPortOrg
   METHOD DxColors
   METHOD SetRGB
   METHOD SetTextCharExtra
   METHOD GetTextCharExtra
   METHOD SetTextJustification
   METHOD GetTextJustification
   METHOD SetTextAlign
   METHOD GetTextAlign
   METHOD Picture
   METHOD Line
   METHOD LineTo
   METHOD End
   METHOD SaveMetaFiles
   METHOD GetTextExtent
   METHOD ReportData
   METHOD Preview
   METHOD PrevAdjust
   METHOD PrevClose
   METHOD PrevPrint
   METHOD PrevShow
   METHOD PrevThumb
   METHOD PrintOption
ENDCLASS

/*--------------------------------------------------------------------------------------------------------------------------------*/
```
