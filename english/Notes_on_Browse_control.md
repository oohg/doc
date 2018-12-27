## Notes on Browse's clauses, properties and methods

Read this notes carefully, they will save you a lot of time and trouble.

* Value property selects a record by its number (RecNo()).
* Value property returns selected record number (RecNo()).
* Browse control does not change the active work area.
* Browse control does not change the record pointer in the work area when SET BROWSESYNC is OFF (the default).
* Browse control does not change the selected item when the record pointer of the work area is changed.
* You can programatically refresh it using REFRESH method.
* Variables called <MemVar>.<WorkAreaName>.<FieldName> are created for validation in browse editing window. You can use them in VALID array.
* Using APPEND clause you can add records to the table associated with WORKAREA clause. The hotkey to add records is Alt+A.
* Append clause can't be used with fields not belonging to browse work area.
* DELETE clause allows to mark selected record for deletion pressing Del key.
* Deletion only takes place if DELETEWHEN clause is omited or if the block evaluates to .T. for the record. If the block evaluates to .F., deletion does not take place and DELETEMSG message is displayed.
* ON DELETE block is executed after the record is deleted but before it's unlocked and before moving the record pointer when SET DELETED is ON.
* To include a Browse in a Splitbox you must define it using alternate syntax (DEFINE/END DEFINE).
* Browses included in a Splibox have no vertical scrollbars (you must use keyboard or mouse wheel to scroll).
