#!/bin/sh
python3 -c "import openrazer.client; a = openrazer.client.DeviceManager(); a.devices[0].fx.ripple(0, 255, 0)"
pgrep redshift | xargs kill
redshift -l 36.2048:138.2529 -t 6500:3600 & 
flameshot &
