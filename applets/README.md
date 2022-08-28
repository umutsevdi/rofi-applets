# applets/

This directory contains my <a href="https://github.com/davatorium/rofi">Rofi</a> applets.

```sh
applets/
    ├── global.rasi
    ├── emoji
    │   ├── config.rasi
    │   └── launch.sh
    ├── filebrowser
    │   ├── config.rasi
    │   └── launch.sh
    ├── launcher
    │   ├── config.rasi
    │   └── launch.sh
    ├── player
    │   ├── config.rasi
    │   └── launch.sh
    ├── powermenu
    │   ├── config.rasi
    │   └── launch.sh
    └── tab
        ├── config.rasi
        └── launch.sh
```

Each Rofi applet get's it's color values from `global.rasi` file. So any change
on colors affect rest of the applets. There is also an [Applet CLI](../applet).
