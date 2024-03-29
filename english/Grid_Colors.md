## Grid Colors

The colors for the different rows and columns in grid, xbrowse and browse controls are controlled, at define time, by the clauses SELECTEDCOLORS, FONTCOLOR, BACKCOLOR, DYNAMICFORECOLOR and DYNAMICBACKCOLOR.
At run time you can use SetSelectedColors, FontColor, BackColor, SetItemColor and SetRangeColor methods.

**SELECTEDCOLOR clause:**

For grids with navigation by cell, the colors for the selected row and cell are specified using an array with eight items.
The first four items specified the colors for painting the selected cell and the last four the colors for painting the remaining cells of the selected row:

* item 1: text's color when grid has focus, defaults to COLOR\_HIGHLIGHTTEXT.
* item 2: text's background color when grid has focus, defaults to COLOR\_HIGHLIGHT.
* item 3: text's color when grid doesn't has focus, defaults to COLOR\_WINDOWTEXT.
* item 4: text's background color when grid doesn't has focus, defaults to COLOR\_3DFACE.
* item 5: text's color when grid has focus, defaults to DYNAMICFORECOLOR, or FONTCOLOR or COLOR\_WINDOWTEXT.
* item 6: text's background color when grid has focus, defaults to DYNAMICBACKCOLOR, or BACKCOLOR or COLOR\_WINDOW.
* item 7: text's color when grid doesn't has focus, defaults to DYNAMICFORECOLOR, or FONTCOLOR or COLOR\_WINDOWTEXT .
* item 8: text's background color when grid doesn't has focus, defaults to DYNAMICBACKCOLOR, or BACKCOLOR or COLOR\_WINDOW .

For other controls, this colors are specified using an array with four items:

* item 1: text's color when control has focus, defaults to COLOR\_HIGHLIGHTTEXT.
* item 2: text's background color when control has focus, defaults to COLOR\_HIGHLIGHT.
* item 3: text's color when control doesn't has focus, defaults to COLOR\_WINDOWTEXT.
* item 4: text's background when control doesn't has focus, defaults to COLOR\_3DFACE.

**SetSelectedColors method:**

Changes the colors for the selected row and cell.
Receives two parameters: an array of colors (see above) and a logical value (.T. forces the control to redraw using the new colors, .F. defers redrawing until next change in control's Value).
If the array is omitted the method returns the colors actually in use.

**FONTCOLOR clause:**

Specifies the text's color for unselected rows. Defaults to COLOR\_WINDOWTEXT.

**FontColor method:**

Changes the text's color for unselected rows.
Receives the new color as parameter.
If the color is omitted the method returns the color actually in use.

**BACKCOLOR clause:**

Specifies the text's background color for unselected rows.
Defaults to COLOR\_WINDOW.

**BackColor method:**

Changes the text's background color for unselected rows.
Receives the new color as parameter.
If the color is omitted the method returns the color actually in use.

**DYNAMICFORECOLOR clause:**

Specifies the text's color for each column in unselected rows, using an array.
NIL items default to FONTCOLOR.

**DYNAMICBACKCOLOR clause:**

Specifies the text's background color for each column in unselected rows, using an array.
NIL items default to BACKCOLOR.

**SetItemColor method:**

Changes the text's color and text's background color for a specific row when it's unselected.
Receives four parameters: row, foreground color (array, optional, defaults to DYNAMICFORECOLOR), background color (array, optional, defaults to DYNAMICBACKCOLOR) and cells values (optional).

**SetRangeColor method:**

Changes the text's color and text's background color for a region of cells when they're unselected.
Receives six parameters: foreground color (optional, if omitted no change is made), background color (optional, if omitted no change is made), top row, left column, bottom row (optional, defaults to top) and right column (optional, defaults to left).

**Notes:**

1. Colors for SELECTEDCOLOR clause an SetSeletectedColors method may be specified using a color number, a color array (see i_color.ch) or a codeblock that returns a valid color number or color array when evaluated.
   Codeblocks are evaluated only one time at control's definition or when the method is executed.
   Codeblocks do not receive parameters.
2. Colors for FONTCOLOR and BACKCOLOR clauses and methods may be specified using a color number or a color array (see i_color.ch).
   Codeblocks are not supported.
3. Colors for DYNAMICFORECOLOR and DYNAMICBACKCOLOR clauses may be specified using a color number, a color array (see i_color.ch) or a codeblock that returns a valid color number or color array when evaluated.
   Codeblocks are evaluated when the AddColumn, AddItem, InsertItem and Item (when is used to change it's value o it's colors) methods are executed.
   Note that because AddColumn adds the new column _after_ evaluating the block colors, you can´t use the new column's content inside the block.
   Codeblocks receive the column number as first parameter, the row number as second parameter and the item value (array of column's values) as third parameter.
   To set colors on control's properties you must use _OOHG_ThisControl to access the object.
4. Colors for SetItemColor and SetRangeColor methods may be specified using a color number, a codeblock that returns a valid color number or color array when evaluated, or an array of colors specified by color numbers, codeblocks o color arrays (see i_color.ch).
   Codeblocks are evaluated when the AddColumn, AddItem, InsertItem, Item (when is used to change it's value o it's colors), SetItemColor or SetRangeColor methods are executed.
   Color blocks receive the column number as first parameter, the row number as second parameter and the item value (array of column's values) as third parameter.
   If an array is used to change the color of column 3, the array must have at least 3 items and the third must be a valid color.
5. Controls, by default, determine colors at define time.
   Use UPDATECOLORS clause to force color reevaluation each time the control's value is changed.

**Samples:**

For a Grid sample, see [https://github.com/oohg/samples/tree/main/grid](https://github.com/oohg/samples/tree/main/grid "Grid Samples").

For a Browse sample, see [https://github.com/oohg/samples/tree/main/browse](https://github.com/oohg/samples/tree/main/browse "Browse Samples").
