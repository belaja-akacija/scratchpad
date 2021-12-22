Simple pure shell script to launch a scratchpad in neovim, based on the current date, with simple reminders built in.

## Instructions

### Scratchpad
Put this script in your $HOME/bin and make sure you have your path set to that directory.
Just simply type ```scratchpad``` in a terminal to pull up the current day's scratchpad. It's recommended to have a key binding set for this, or at the very least create an alias, for maximum convenience.
If you use dwm, you can insert these lines into ```config.def.h```:
```
/*commands*/
static const char *scratchpad[] = { "<YOUR TERMINAL EMULATOR>", "-e", "sh", "-c", "<ABSOLUTE PATH TO scratchpad FILE>; sh", NULL };

/*Keys*/
{ MODKEY,                       XK_p,      spawn,          {.v = scratchpad} },
```

To add a reminder, simply end the line you want with ```[+]```.
The next day, you will see those saved reminders at the top of the scratchpad. You'll notice that the ```[+]``` became ```[?]```.
If you don't replace the ```?``` back to a ```+```, the reminder will not show up on the following day's scratchpad.

That's basically it, so far!

### CLI Tool
You may also retrieve your scratchpads using the CLI, by simply tying `s -d day month year`.

You don't have to specify an exact date. If you just specify a month, you will be taken to the directory of the current year's month. e.g `s -d dec` --> equivalent to `cd /path/to/current/year/month`

Likewise, specifying a date and month, will take you to the current year's month and day. e.g. `s -d 10 dec` --> `vim /path/to/current/year/month/10-12-YYYY`

## Recommended dependencies:
- Goyo plugin for vim, to declutter the scratchpad environment.
