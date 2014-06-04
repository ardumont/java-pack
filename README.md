java-pack
=========

# Overview

A pack to ease the java development.

This is licensed under [GPLv3](http://gplv3.fsf.org/).

# Install

This is compatible with [emacs-live-packs](https://github.com/ardumont/emacs-live-packs) and [prelude-packs](https://github.com/ardumont/prelude-packs).

## [emacs-live-packs](https://github.com/ardumont/emacs-live-packs)

Add this snippet in your `.emacs-live.el`:
```elisp
(emacs-live-packs/add-live-packs "~/.emacs-live-packs/" '("java-pack"))
```

## [prelude-packs](https://github.com/ardumont/prelude-packs)

Add this snippet in your `prelude-packs.el`:
```elisp
(prelude-packs/load-packs "~/.prelude-packs/" '("java-pack"))
```

# Setup

- Install Eclipse somewhere and set your ECLIPSE_HOME environment variable to point to it.
- Install [eclim](https://github.com/senny/emacs-eclim) adequately to use the same eclipse
- Load java-pack
<kbd>M-x java-pack/load-pack!</kbd>
