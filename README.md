# scratchpad
Simple pure shell script to launch a scratchpad in neovim, based on the current date, with simple reminders built in.

## Instructions
Put this script in your $HOME/bin and make sure you have your path set to that directory.
Just simply type ```scratchpad``` in a terminal to pull up the current day's scratchpad.

To add a reminder, simply end the line you want with ```[+]```.
The next day, you will see those saved reminders at the top of the scratchpad. You'll notice that the ```[+]``` became ```[?]```.
If you don't replace the ```?``` back to a ```+```, the reminder will not show up on the following day's scratchpad.

That's basically it, so far!

## Recommended dependencies:
- Goyo plugin for vim, to declutter the scratchpad environment.
