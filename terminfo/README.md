This adds escape sequences for italics.

To check that the terminal does the right thing:

```sh
echo `tput sitm`italics`tput ritm` `tput smso`standout`tput rmso`
```
