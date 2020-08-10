## Maintenance tasks

This document states the tasks to fulfill whenever:

A PROPERTY or EVENT is added to forms in i_window.ch:

   * Add support for it to the IDE.
   * Update the corresponding HTML file at doc\manual folder.

A PROPERTY or EVENT is deleted from forms in i_window.ch:

   * Delete the support for it from the IDE.
   * Update the corresponding HTML file at doc\manual folder.

A PROPERTY or EVENT is added to a control in it's i_xxxxxxxx.ch:

   * Add support for it to the IDE.
   * Update the corresponding HTML file at doc\manual folder.
   * Add support for alternative syntax to i_altsyntax.ch, if necessary.
   
A PROPERTY or EVENT is deleted from a control's i_xxxxxxxx.ch:

   * Delete the support for it from the IDE.
   * Update the corresponding HTML file at doc\manual folder.
   * Remove support for alternative syntax from i_altsyntax.ch, if it's
     no longer necessary.

A METHOD or DATA is added to or deleted from a class.

   * Update doc\english\Classes.md and doc\manual\CLASSES.HTM

A modification is made to any ChangeLog.txt (core, distros, doc, fmt, ide, or samples):

   * Copy the modifications to doc\manual\Changelog_xxxxxxx.htm

A new distro is builded:

   * Change the date in doc\manual\OOHG.HTM
   * Change the version number and date in file core\include\oohgversion.h
   * Updated doc\manual\Changelog_XXXXXXX.htm
   * Create new oide.chm (see doc\manual\HowToBuild.txt)

A new year starts:

   * Update the year in the copyright note of all files.
