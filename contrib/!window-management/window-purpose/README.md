# window-purpose contribution layer for Spacemacs

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc/generate-toc again -->
**Table of Contents**

- [window-purpose contribution layer for Spacemacs](#window-purpose-contribution-layer-for-spacemacs)
    - [Description](#description)
        - [Purposes](#purposes)
        - [switch-to-buffer and display-buffer](#switch-to-buffer-and-display-buffer)
    - [Features](#features)
    - [Install](#install)
    - [Usage](#usage)
    - [Key bindings](#key-bindings)
    - [Caveats](#caveats)
        - [Popwin and guide-key](#popwin-and-guide-key)
        - [gdb-many-windows](#gdb-many-windows)

<!-- markdown-toc end -->

## Description

This layer enables [window-purpose](https://github.com/bmag/emacs-purpose),
which provides an alternative, purpose-based window manager for Emacs. With this
layer, your window layout should be robust and shouldn't change too much when
opening all sorts of buffers.

Regular [popwin](https://github.com/m2ym/popwin-el) is not triggered when
window-purpose is enabled. However, the window-purpose layer provides a
purpose-popwin extension, which brings popwin's behavior to window-purpose and
solves that problem.

### Purposes

window-purpose contains a configuration which assigns a purpose for each buffer.
Later, when Emacs needs to display a buffer in a window, its purpose helps make
a better decision of which window to use.

For example, consider the following case: Emacs frame shows three windows - one for
code, one for a terminal and one general-purpose window. The general window is
selected and you want to open a code file. How do you ensure that the code file
will be displayed in the code window? With window-purpose you don't need to worry
about it - you open the file and window-purpose places it in the correct window.

Additionally, you can dedicate a window to a purpose - so that window is reserved
only for buffers that share that purpose.

### switch-to-buffer and display-buffer

In regular Emacs, `switch-to-buffer` follows different rules than the other switching
and popping commands, because it doesn't use `display-buffer` (which the other commands
do). With window-purpose, this behavior is fixed. The result is a better control
over how buffers are displayed, since `switch-to-buffer` doesn't ignore the user's
customizations anymore.

## Features

**window-purpose (purpose-mode):**
- window layout is more robust and less likely to change unintentionally
- dedicate window to a purpose
- user-defined purposes
- extensible window display behavior

**purpose-popwin.el (pupo-mode):**
- replicate popwin behavior for purpose-mode - almost no regression in popup behavior
  from using window-purpose.
- reuses popwin's settings: `popwin:special-display-config`, `popwin:popup-window-height`
  and `popwin:popup-window-width`.
- difference from popwin: when several windows are open, popup window is sometimes bigger
  than with regular popwin in the same situation.

## Install

To use this contribution add it to your `~/.spacemacs`

```elisp
(setq-default dotspacemacs-configuration-layers '(window-purpose))
```

## Usage

With window-purpose layer installed, `purpose-mode` and `pupo-mode` are enabled.
You can toggle `purpose-mode` (<kbd>SPC : purpose-mode</kbd>) at any time to return to
purpose-less behavior.  
You can toggle `pupo-mode` (<kbd>SPC : pupo-mode</kbd>) to turn off
only the purpose-popwin integration.

If you change `popwin:special-display-config` in your `dotspacemacs/config`, you
should call `pupo/update-purpose-config` to update purpose-popwin with those changes.

See [window-purpose wiki](https://github.com/bmag/emacs-purpose/wiki) to learn more
about window-purpose.

## Key bindings

Key Binding        | Description
-------------------+------------------------------------------------------------------------------------
<kbd>SPC r b</kbd> | Open a buffer. Only buffers with the same purpose as the current buffer are listed.
<kbd>SPC r B</kbd> | Open any buffer and ignore window-purpose when displaying the buffer.
<kbd>SPC r d</kbd> | Toggle dedication of selected window to its current purpose.
<kbd>SPC r D</kbd> | Delete all non-dedicated windows.
<kbd>SPC r p</kbd> | Choose a purpose and open a buffer with that purpose.
<kbd>SPC r P</kbd> | Change the purpose of the selected window. Changes the window's buffer accordingly.

## Caveats

### Popwin and guide-key

When Popwin creates a popup window, it removes the purpose-dedication state of
all windows except the selected one. Unfortunately, guide-key works by through
Popwin, so whenever guide-key pops up, any purpose-dedicated windows except for
the selected one lose the purpose-dedication state. This issue will be addressed
in the future.

### gdb-many-windows

window-purpose might interfere with the window layout of `gdb-many-windows`. If
you face such a problem, please report an issue.
