# Icons

Icons are obtained from Nerd Fonts converted to SVG format via FontForge.

```bash
fontforge -lang=ff -c 'Open($1); Select($2); Export($3);' <font_name> <glyph_code> <output_file>
```

```bash
alias svg_nf='fontforge -lang=ff -c "Open(\$1); Select(\$2); Export(\$3);" /usr/share/fonts/TTF/JetBrainsMonoNerdFont-Regular.ttf' 
```

```bash
svg_nf U+f0904 ~/.config/wlogout/icons/sleep.svg
svg_nf U+f0425 ~/.config/wlogout/icons/power.svg
svg_nf U+f0343 ~/.config/wlogout/icons/logout.svg
svg_nf U+f0709 ~/.config/wlogout/icons/reboot.svg
svg_nf U+f033e ~/.config/wlogout/icons/lock.svg
```
