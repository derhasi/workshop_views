$Id: README.txt,v 1.2.2.1 2008/12/15 16:31:59 pukku Exp $

collapse_text.module is an input filter to allow text to be
made into collapsible sections (like on editing forms).

Surround text with `[collapse]` and `[/collapse]` to make that
text be a collapsible section. You may open with `[collapse collapsed]`
instead to make it default closed.

The "legend" for the created fieldset may be set by putting a
title into the [collapse] tag as [collapse title=my title]. If you
wish to combine the options, you should do [collapse collapsed title=...].
If no title is specified, the title will be taken from the first
HTML header tag (<h1>, <h2>, <h3>, ...) found. If there is no such
tag found, the title will default to an explanatory text title.
