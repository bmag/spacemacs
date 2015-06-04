# window-purpose contribution layer for Spacemacs

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc/generate-toc again -->
**Table of Contents**

- [window-purpose contribution layer for Spacemacs](#window-purpose-contribution-layer-for-spacemacs)
    - [Description](#description)
        - [Purposes](#purposes)
        - [switch-to-buffer and display-buffer](#switch-to-buffer-and-display-buffer)
    - [Caveats](#caveats)
        - [Popwin and guide-key](#popwin-and-guide-key)
        - [gdb-many-windows](#gdb-many-windows)
    - [Install](#install)
    - [Key bindings](#key-bindings)

<!-- markdown-toc end -->


## Description

This layer enables window-purpose, which provides an alternative, purpose-based
window manager for Emacs. With this layer, your window layout should be robust
and shouldn't change too much by opening all sorts of buffers.

### Purposes

window-purpose contains a configuration which assigns a purpose for each buffer.
Later, when Emacs needs to display a buffer in a window, its purpose helps make
a better decision of which window to use.

For example, consider the following case: Emacs frame shows two windows - one is
a terminal and the other is a code file. Now you want to open another code file,
in which window will it be displayed? With window-purpose layer enabled, the window
that already shows a file will be chosen for the new file.

Additionally, you can dedicate a window to a purpose - so that window is reserved
only for buffers that share that purpose.

### switch-to-buffer and display-buffer

In regular Emacs, `switch-to-buffer` follows different rules than the other switching
and popping commands, because it doesn't use `display-buffer` (which the other commands
do). With window-purpose, this behavior is fixed. The result is a better control
over how buffers are displayed, since `switch-to-buffer` doesn't ignore the user's
customizations anymore.


## Caveats

### Popwin and guide-key

When Popwin creates a popup window, it removes that purpose-dedication state of
all windows except the selected one. Unfortunately, guide-key works by through
Popwin, so whenever guide-key pops up, any purpose-dedicated windows except for
the selected one lose the purpose-dedication state. This issue will be addressed
in the future.

window-purpose works by setting the `display-buffer-overriding-action`. As such,
it usually prevents Popwin from displaying popup buffers. Instead, the buffers
are treated as regular buffers. This issue will also be addressed in the future.

### gdb-many-windows

window-purpose might interfere with the window layout of `gdb-many-windows`. If
you face such a problem, please report an issue.


## Install

To use this contribution add it to your `~/.spacemacs`

```elisp
(setq-default dotspacemacs-configuration-layers '(window-purpose))
```


## Key bindings

Key Binding        | Description
-------------------+------------------------------------------------------------------------------------
<kbd>SPC r b</kbd> | Open a buffer. Only buffers with the same purpose as the current buffer are listed.
<kbd>SPC r B</kbd> | Open any buffer and ignore window-purpose when displaying the buffer.
<kbd>SPC r d</kbd> | Toggle dedication of selected window to its current purpose.
<kbd>SPC r D</kbd> | Delete all non-dedicated windows.
<kbd>SPC r p</kbd> | Choose a purpose and open a buffer with that purpose.
<kbd>SPC r P</kbd> | Change the purpose of the selected window. Changes the window's buffer accordingly.
