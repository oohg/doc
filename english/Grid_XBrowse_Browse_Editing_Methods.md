
Editing methods of TGrid control
--------------------------------

   METHOD EditCell( nRow, nCol, EditControl, uOldValue, uValue, cMemVar, nOnFocusPos )

      Edits one cell (using EditCell2).
      If the edition isn't aborted, the cell value is changed and the
      OnEditCell event procedure is evaluated (with nRow and nCol as
      parameters, and vars _OOHG_ThisItemRowIndex, _OOHG_ThisItemColIndex,
      _OOHG_ThisItemCellValue, _OOHG_ThisItemCellRow, _OOHG_ThisItemCellCol,
      _OOHG_ThisItemCellWidth and _OOHG_ThisItemCellHeight setted).
      If the edition is aborted, the OnAbortEdit event procedure is
      evaluated (with nRow and nCol as parameters).
      Returns .F. if edition is aborted, and .T. if not.

      Parameters:
         nRow        = row of the cell to edit.
                       Defaults to ::FirstSelectedItem.
         nCol        = column of the cell to edit. Defaults to 1.
         EditControl = a reference to a TGridControl object.
                       Defaults to a newly created object compatible
                       with uOldValue.
         uOldValue   = initial value of the editing control.
                       Defaults to cell value.
         cMemVar     = the name of a variable that will be setted to the
                       editing control's value before evaluating the Valid
                       event procedure. Defaults to "_OOHG_NULLVAR_".
         nOnFocusPos = sets the type of the initial focus of the editing
                       control. Defaults to -2. See TText:SetFocus().

   METHOD EditCell2( nRow, nCol, EditControl, uOldValue, uValue, cMemVar, nOnFocusPos )

      Edits one cell and returns the new value in uValue.
      It does not change the cell's value.
      Uses inline edition.
      Returns .F. if edition is aborted, and .T. if not.

      Parameters:
         nRow        = row of the cell to edit.
                       Defaults to ::FirstSelectedItem.
         nCol        = column of the cell to edit.
                       Defaults to 1.
         EditControl = a reference to a TGridControl object.
                       Defaults to a newly created object compatible
                       with uOldValue.
         uOldValue   = initial value of the editing control.
                       Defaults to cell value.
         uValue      = the new cell's value is returned in this variable.
                       Must be passed by reference (using @var).
         cMemVar     = the name of a variable that will be setted to the
                       editing control's value before evaluating the Valid
                       event procedure.
                       Defaults to "_OOHG_NULLVAR_".
         nOnFocusPos = sets the type of the initial focus of the editing
                       control. Defaults to -2. See TText:SetFocus().

   METHOD EditItem()

      Edits all the cells of the selected row (using EditItem2).
      If the edition isn't aborted, the cells' values are changed and
      the OnEditCell event procedure is evaluated (with nRow and 0
      as parameters, and variables _OOHG_ThisItemRowIndex,
      _OOHG_ThisItemCellRow, _OOHG_ThisItemCellCol, _OOHG_ThisItemCellWidth
      and _OOHG_ThisItemCellHeight setted).
      If the edition is aborted, the OnAbortEdit event procedure is
      evaluated (with nRow and 0 as parameters).
      Returns .F. if edition is aborted, and .T. if not.

   METHOD EditItem2( nItem, aItems, aEditControls, aMemVars, cTitle )

      Edits all the cells of a row and returns the new values in an array.
      It does not change the cells' values.
      Uses a separate window to do the edition.
      Returns a zero length array if edition is aborted, and an array of
      values (one for each cell) if not.

      Parameters:
         nItem       = row to edit.
                       Defaults to ::FirstSelectedItem.
         aItems      = an array of initial values for each cell of the row.
                       Defaults to the actual values.
         EditControl = a reference to a TGridControl object.
                       Defaults to a newly created object compatible
                       with uOldValue.
         aMemVars    = the names of the variables that will be setted to
                       the editing controls' values before evaluating the
                       Valid event procedures.
                       Defaults to "_OOHG_NULLVAR_".
         cTitle      = title of the editing window.
                       Defaults to Nil.

   METHOD EditAllCells( nRow, nCol )

      If FULLMOVE is enabled, this method calls EditGrid.
      If not, it uses EditCell to edit all the cells of a row, starting
      from nCol.

      Parameters:
         nRow        = row of the cell where the editing should begin.
                       Defaults to ::FirstSelectedItem.
         nCol        = column of the cell where the editing should begin.
                       Defaults to 1.

   METHOD EditGrid( nRow, nCol )

      Edits all the cells of a row (using EditCell), starting from nCol.
      If FULLMOVE is not enabled, the edition proceeds to the right until
      the last column of the row is edited (you can not change this and
      you can not add new rows) or until a cell edition is aborted.
      If FULLMOVE is enabled, the next cell to be edited is selected
      applying this rule: from the last edited cell move one cell to the
      right on the same row or move to the first cell of the next row.
      To set a new position for next edit you must change the last edited
      cell. This can be done using methods Up, Down, Left, Right and/or
      changeing DATAs nRowPos and/or nColPos inside the OnEditCell event
      procedure.
      Returns .F. if the last edition is aborted, and .T. if not.
      After editing the last cell of the last row, a new row is added and
      the edition continues on the first editable cell of the new row. If
      the user aborts the edition of this cell, the new row is discarded,
      the edition ends and the grid is placed at it's last row.
      Whenever a cell edition is aborted, the OnAbortEdit event procedure
      is evaluated (with 0 and 0 as parameters).
      The OnAppend event procedure is evaluated after the addition of a new
      row but only if the edition of the first editable cell isn't aborted.

      Parameters:
         nRow        = row of the cell where the editing should begin.
                       Defaults to ::FirstSelectedItem.
         nCol        = column of the cell where the editing should begin.
                       Defaults to 1.

   METHOD AppendItem

      Adds a new row at the bottom and starts editing it by calling
      EditGrid if FULLMOVE is .T., EditAllCells if FULLMOVE is .F. and
      INPLACE is .T., or EditItem if FULLMOVE is .F. and INPLACE is .F.



Editing methods of TXBrowse control
-----------------------------------

   METHOD EditCell( nRow, nCol, EditControl, uOldValue, uValue, cMemVar, lAppend, nOnFocusPos )

      Edits one cell (using TGrid:EditCell2).
      If the edition isn't aborted, the captured value is stored into
      the data provider, the OnAppend event procedure is evaluted if
      a new row was added, and the OnEditCell event procedure is evaluated
      (with nRow and nCol as parameters, and vars _OOHG_ThisItemRowIndex,
      _OOHG_ThisItemCellRow, _OOHG_ThisItemCellCol, _OOHG_ThisItemCellWidth
      and _OOHG_ThisItemCellHeight setted).
      If the edition is aborted, the OnAbortEdit event procedure is
      evaluated (with 0 and 0 as parameters if lAppend is .T. or nRow
      and nCol in other cases).
      Returns .F. if edition is aborted, and .T. if not.

      Parameters:
         nRow        = row of the cell to edit.
                       Defaults to ::CurrentRow.
         nCol        = column of the cell to edit.
                       Defaults to 1.
         EditControl = a reference to a TGridControl object.
                       Defaults to a newly created object compatible
                       with uOldValue.
         uOldValue   = initial value of the editing control.
                       Defaults to cell value.
         uValue      = the new cell's value is returned in this variable.
                       Must be passed by reference (using @var).
         cMemVar     = the name of a variable that will be setted to the
                       editing control's value before evaluating the Valid
                       event procedure.
                       Defaults to "_OOHG_NULLVAR_".
         lAppend     = When .T., a new row is added before editing starts.
                       Defaults to .F.
         nOnFocusPos = sets the type of the initial focus of the editing
                       control. Defaults to -2. See TText:SetFocus().

   METHOD EditItem( lAppend, lOneRow, nItem, lChange )

      Edits all the cells of the selected row (using EditItem_B).
      This method does not allow recursive calls.
      Returns .F. if edition is aborted, and .T. if not.

      Parameters:
         lAppend     = When .T., a new row is added before editing starts.
                       Defaults to .F.
         lOneRow     = When .F. and INPLACE is .T., it enables de addition
                       of more rows after editing/adding the first one.
                       In other cases, only on row is edited/added.
                       Defaults to .T.

   METHOD EditItem_B( lAppend, lOneRow )

      Edits all the cells of the selected row.
      If INPLACE is enabled, this method calls EditAllCells.
      If not, it uses TGrid:EditItem2 to capture the cell values and if
      the edition isn't aborted, they are stored into the data provider,
      the OnAppend event procedure is evaluated if a new row was added,
      and the OnEditCell event procedure is evaluated (with CurrentRow
      and 0 as parameters, and vars _OOHG_ThisItemRowIndex,
      _OOHG_ThisItemCellRow, _OOHG_ThisItemCellCol, _OOHG_ThisItemCellWidth
      and _OOHG_ThisItemCellHeight setted).
      If the edition is aborted, the OnAbortEdit event procedure is
      evaluated (with CurrentRow and 0 as parameters).
      Returns .F. if edition is aborted, and .T. if not.

      Parameters:
         lAppend     = When .T., a new row is added before editing starts.
                       Defaults to .F.
         lOneRow     = When .F. and INPLACE is .T., it enables de addition
                       of more rows after editing/adding the first one.
                       In other cases, only on row is edited/added.
                       Defaults to .T.

   METHOD EditAllCells( nRow, nCol, lAppend, lOneRow )

      It uses EditCell to edit all the cells of a row, starting from nCol.
      If FULLMOVE is not enabled, the edition proceeds to the right until
      the last column of the row is edited (you can not change this and
      you can not add new rows) or until a cell edition is aborted.
      If FULLMOVE is enabled, the next cell to be edited is selected
      applying this rule: from the last edited cell move one cell to the
      right on the same row or move to the first cell of the next row.
      You can not set a different position.
      After editing the last cell of the last row, a new row is added and
      the edition continues on the first editable cell of the new row. If
      the user aborts the edition of this cell, the new row is discarded,
      the edition ends and the xbrowse is placed at it's last row.
      Whenever a cell edition is aborted, the OnAbortEdit event procedure
      is evaluated (with 0 and 0 as parameters for new rows or nRow and
      nCol otherwise).
      The OnAppend event procedure is evaluated after the addition of a new
      row but only if the edition of the first editable cell isn't aborted.

      Parameters:
         nRow        = row of the cell where the editing should begin.
                       Defaults to ::CurrentRow.
         nCol        = column of the cell where the editing should begin.
                       Defaults to 1.
         lAppend     = When .T., a new row is added before editing starts.
                       Defaults to .F.
         lOneRow     = disables FULLMOVE for this method.
                       Defaults to .F.

   METHOD EditGrid( nRow, nCol, lAppend, lFromB, lOneRow )

      Calls EditAllCells.


Editing methods of TOBrowse control
-----------------------------------

   METHOD EditCell( nRow, nCol, EditControl, uOldValue, uValue, cMemVar, lAppend, nOnFocusPos, lRefresh, lChange )

      Edits one cell (using TXBrowse:EditCell).
      When lAppend is .T., the edition is done at row nRow and column nCol
      (without using its previous value). If edition isn't aborted, the
      previous content of the row is replaced, unless lRefresh is .T.
      If the edition isn't aborted, it stores the captured value into the
      data provider, evaluates OnAppend event procedure if a new row is added,
      evaluates OnEditCell event procedure (with nRow and nCol as parameters,
      and _OOHG_ThisItemRowIndex, _OOHG_ThisItemCellRow, _OOHG_ThisItemCellCol,
      _OOHG_ThisItemCellWidth and _OOHG_ThisItemCellHeight vars setted).
      If the edition is aborted, it evalues OnAbortEdit event procedure (with
      0 and 0 as parameters if lAppend is .T. or nRow and nCol otherwise).
      Returns .F. if edition is aborted, and .T. if not.

      Parameters:
         nRow        = row of the cell to edit.
                       Defaults to ::CurrentRow.
         nCol        = column of the cell to edit.
                       Defaults to 1.
         EditControl = a reference to a TGridControl object.
                       Defaults to a newly created object compatible
                       with uOldValue.
         uOldValue   = initial value of the editing control.
                       Defaults to cell value.
         uValue      = the new cell's value is returned in this variable.
                       Must be passed by reference (using @var).
         cMemVar     = the name of a variable that will be setted to the
                       editing control's value before evaluating the Valid
                       event procedure.
                       Defaults to "_OOHG_NULLVAR_".
         lAppend     = When .T., a new row is added before editing starts.
                       Defaults to .F.
         nOnFocusPos = sets the type of the initial focus of the editing
                       control. Defaults to -2. See TText:SetFocus().
         lRefresh    = When .T. and lAppend is .T and the edition isn't
                       aborted, a call to ::Refresh() is done.
         lChange     = When .T. and lAppend is .T and the edition isn't
                       aborted, the ::Value is set to the added record
                       (note that this refreshes the control).
                       Defaults to .F. (::Value is not changed).

   METHOD EditItem( lAppend )

      Edits all the cells of the last row (using EditItem_B).
      This method does not allow recursive calls.
      Returns .F. if edition is aborted, and .T. if not.

      Parameters:
         lAppend     = When .T., a new row is added before editing starts.
                       Defaults to .F.

   METHOD EditItem_B( lAppend )

   METHOD EditAllCells( nRow, nCol, lAppend, lFromB )

      It uses EditCell to edit all the cells of a row, starting from nCol.
      If FULLMOVE is not enabled, the edition proceeds to the right until
      the last column of the row is edited (you can not change this and
      you can not add new rows) or until a cell edition is aborted.
      If FULLMOVE is enabled, the next cell to be edited is selected
      applying this rule: from the last edited cell move one cell to the
      right on the same row or move to the first cell of the next row.
      You can not set a different position.
      After editing the last cell of the last row, a new row is added and
      the edition continues on the first editable cell of the new row. If
      the user aborts the edition of this cell, the new row is discarded,
      the edition ends and the xbrowse is placed at it's last row.
      Whenever a cell edition is aborted, the OnAbortEdit event procedure is
      evaluated (with 0 and 0 as parameters for new rows or nRow and nCol
      otherwise).
      The OnAppend event procedure is evaluated after the addition of a new
      row but only if the edition of the first editable cell isn't aborted.

      Parameters:
         nRow        = row of the cell where the editing should begin.
                       Defaults to ::CurrentRow.
         nCol        = column of the cell where the editing should begin.
                       Defaults to 1.
         lAppend     = When .T., a new row is added before editing starts.
                       Defaults to .F.
         lFromB      = xxx
         lOneRow     = disables FULLMOVE for this method.
                       Defaults to .F.

Other methods of TOBrowse control
---------------------------------

   METHOD Update()

      Reloads row's data from the dbf, starting from the current record
      and skipping forward until ::CountPerPage records are processed or
      end of file is reached.
      All grid's rows are deleted and new ones are added, the color
      arrays are updated, and if ::lUpdateAll if .T., headers text
      and images, columns widths and justifications are updated.
      The record map (::aRecMap) is rebuilded.
      No event procedures are evaluated.
      The grid ends up with no row selected (::Value == 0).
      The dbf's record pointer is not preserved.
      This method is not intended to be used alone but in combination
      with ::DbGoTo(), ::ScrollUpdate(), ListView_SetCursel() and
      ::BrowseOnChange().

   METHOD Refresh()

      ::Value may change.
      Repaints grid trying not to change the position of selected row.
      Calls method ::Update().
      The dbf's record pointer is preserved.


************************************************************************************

## Quick reference:

   *** TGRID:

   To capture a new value for a cell:\
       Using an inline window:\
           TGrid:EditCell2

   To capture new values for the cells of a row:
      Using a separate window:
         TGrid:EditItem2

   To edit one cell:
      Using an inline window:
         TGrid:EditCell (sets value) --> TGrid:EditCell2

   To edit one row:
      Using a separate window:
        TGrid:EditItem (sets values) --> TGrid:EditItem2
     Using an inline window:
        TGrid:EditAllCells + FULLMOVE .F. --> TGrid:EditCell

   To edit one or more rows, with appends:
      Using an inline window:
         TGrid:EditAllCells + FULLMOVE .T. --> TGrid:EditGrid
         TGrid:EditGrid --->  TGrid:EditCell

   *** TXBROWSE:

   To edit one cell:
      Using an inline window:
         TXBrowse:EditCell (sets value) --> TGrid:EditCell2

   To edit one row:
      Using a separate window:
         TXBrowse:EditItem + INPLACE .F. + lOneRow # .F. --> TXBrowse:EditItem_B
         TXBrowse:EditItem_B + INPLACE .F. (sets values) --> TGrid:EditItem2
      Using an inline window:
         TXBrowse:EditItem + INPLACE .T. + lOneRow # .F. --> TXBrowse:EditItem_B
         TXBrowse:EditItem_B + INPLACE .T. + lOneRow # .F. --> TXBrowse:EditAllCells + lOneRow == .T.
         TXBrowse:EditAllCells + lOneRow == .T. --> TXBrowse:EditCell
         TXBrowse:EditAllCells + FULLMOVE .F. --> TXBrowse:EditCell
         TXBrowse:EditGrid + lOneRow == .T. --> TXBrowse:EditAllCells + lOneRow == .T.
         TXBrowse:EditGrid + FULLMOVE .F. --> TXBrowse:EditAllCells + FULLMOVE .F.

   To edit one or more row, with appends:
      Using an inline window:
         TXBrowse:EditAllCells + FULLMOVE .T. + lOneRow # .T. --> TXBrowse:EditCell
         TXBrowse:EditGrid + FULLMOVE .T. + lOneRow # .T. --> TXBrowse:EditAllCells + FULLMOVE .T. + lOneRow # .T.

   *** TOBROWSE:

   To edit one cell:
      Using an inline window:
         TOBrowse:EditCell --> TXBrowse:EditCell

   To edit one row:
      TOBrowse:EditItem --> TOBrowse:EditItem_B
      TOBrowse:EditGrid --> TOBrowse:EditAllCells

      Using a separate window:
         TOBrowse:EditItem_B + INPLACE .F. -> TXBrowse:EditItem_B + INPLACE .F.
      Using an inline window:
         TOBrowse:EditItem_B + INPLACE .T. -> TOBrowse:EditAllCells + lOneRow == .T.
         TOBrowse:EditAllCells + lOneRow == .T. --> TOBrowse:EditCell
         TOBrowse:EditAllCells + FULLMOVE .F. --> TOBrowse:EditCell

   To edit one or more row, with appends:
      Using an inline window:
         TOBrowse:EditAllCells + FULLMOVE .T. + lOneRow # .T. --> TOBrowse:EditCell

