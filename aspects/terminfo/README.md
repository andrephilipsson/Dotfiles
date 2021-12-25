# Terminfo

This adds escape sequences for italics.

To install run:
```sh
tic -x PATH/TO/FILE
```

To check that the terminal does the right thing:

```sh
echo `tput sitm`italics`tput ritm` `tput smso`standout`tput rmso`
```
