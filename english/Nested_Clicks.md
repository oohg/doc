
# Nested clicks

After calling a function by clicking on a menu or a toolbar button succesive calls are ignored until the function ends.
This behaviour is an OOHG default one, setted to avoid problems at slow systems or when the execution takes a large amount of time.
To revert this behaviour to the "normal" behaviour of Oficial and Extended MINIGUI versions, there are two options:

1. For a specific call, add to the ACTION clause or inside the called function **oControl:NestedClick := .T.** where oControl is a reference to the menu or button.
   
2. For all calls, add **\_OOHG\_NestedSameEvent( .T. )** before defining the app's main window.

In either case is strongly recommended that you check for the existence of any window or control before creating it to avoid an RTE.
For that purpouse you can use functions **IsWindowDefined** and **IsControlDefined**.
