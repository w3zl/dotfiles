#Heavily inspired by config of DT(https://gitlab.com/dwt1/dotfiles/-/blob/master/.config/qtile/config.py)
#Heavily inspired by config of David S. (https://gitlab.com/dasprii457/dotfiles/-/blob/master/.config/qtile/config.py)

### IMPORTS ###
import os
import re
import socket
import subprocess
import logging
from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
from typing import List  # noqa: F401

### VARIABLES ###
mod = "mod4"                                            # Sets mod key to ALT
terminal = "alacritty"                                  # My terminal of choice

### MISC FUNCTIONS ###
# Brings all floating windows to the front
@lazy.function
def float_to_front(qtile):
    logging.info("bring floating windows to front")
    for group in qtile.groups:
        for window in group.windows:
            if window.floating:
                window.cmd_bring_to_front()

### KEYBINDS ###
keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(),
        desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    #Key([mod, "control"], "l", lazy.layout.grow_right(),
    #    desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key(["control", "mod1"], "t", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key(["control", "shift"], "w", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "Return", lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"),
    Key(["control", "mod1"], "w", lazy.to_screen(0),
        desc='Keyboard focus to monitor 1'),
    Key(["control", "mod1"], "q", lazy.to_screen(1),
        desc='Keyboard focus to monitor 2'),
    Key(["control", "mod1"], "e", lazy.to_screen(2),
        desc='Keyboard focus to monitor 3'),
    Key(["control", "shift"], "f", lazy.spawn("firefox")),
    Key([mod, "control"], "l", lazy.spawn(terminal+" -e dm-tool lock")),
]
### GROUPS ###
group_names = [("TERM", {"layout": "monadtall"}),
               ("WWW", {"layout": "max"}),
               ("FILE", {"layout": "monadtall"}),
               ("VBOX", {"layout": "monadtall"}),
               ("NOTES", {"layout": "max"}),
               ("MUSIC", {"layout": "max"}),
               ("MISC", {"layout": "max"})]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))        # Switch to another group
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name))) # Send current window to another group	

### DEFAULT THEME SETTINGS FOR LAYOUTS ###
layout_theme = {"border_width": 2,
                "margin": 4,
                "border_focus" : "#e1acff",
                "border_normal": "#1d2330"
                }

### LAYOUTS ###
layouts = [
    layout.Max(**layout_theme),
    layout.MonadTall(**layout_theme),
    layout.Floating(**layout_theme)
]

colors = [["#282c34", "#282c34"], # panel background                                [0] 
          ["#434758", "#434758"], # background for current screen tab               [1]
          ["#ffffff", "#ffffff"], # font color for group names                      [2]
          ["#ff5555", "#ff5555"], # border line color for current tab               [3]
          ["#8d62a9", "#8d62a9"], # border line color for other tab and odd widgets [4]
          ["#668bd7", "#668bd7"], # color for the even widgets                      [5]
          ["#e1acff", "#e1acff"]] # window name                                     [6]


### PROMPT ###
prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())

### DEFAULT WIDGET SETTINGS ###
widget_defaults = dict(
    font="Ubuntu Mono",
    fontsize = 14,
    padding = 2,
    background=colors[0]
)
extension_defaults = widget_defaults.copy()

### WIDGETS ###

def init_widgets_list():
    widgets_list = [
               widget.Sep(
                        linewidth = 0,
                        padding = 6,
                        foreground = colors[2],
                        background = colors[0]
                        ),
               widget.GroupBox(font="Ubuntu Bold",
                        fontsize = 9,
                        margin_y = 3,
                        margin_x = 0,
                        padding_y = 5,
                        padding_x = 5,
                        borderwidth = 3,
                        active = colors[2],
                        inactive = colors[2],
                        rounded = False,
                        highlight_color = colors[1],
                        highlight_method = "line",
                        this_current_screen_border = colors[3],
                        this_screen_border = colors [4],
                        other_current_screen_border = colors[0],
                        other_screen_border = colors[0],
                        foreground = colors[2],
                        background = colors[0]
                        ),
               widget.Prompt(
                        prompt = prompt,
                        font = "Ubuntu Mono",
                        padding = 10,
                        foreground = colors[3],
                        background = colors[1]
                        ),
               widget.Sep(
                        linewidth = 0,
                        padding = 40,
                        ),
               widget.WindowName(
                        foreground = colors[6],
                        background = colors[0],
                        padding = 0
                        ),
               widget.TextBox(
                        text='',
                        background = colors[0],
                        foreground = colors[4],
                        padding=0,
                        fontsize=37
                        ),
               widget.Memory(
                        foreground = colors[2],
                        background = colors[4],
                        padding = 5
                        ),
               widget.TextBox(
                        text='',
                        background = colors[4],
                        foreground = colors[5],
                        padding=0,
                        fontsize=37
                        ),
               widget.TextBox(
                       text=" Vol:",
                        foreground=colors[2],
                        background=colors[5],
                        padding = 0
                        ),
               widget.Volume(
                        foreground = colors[2],
                        background = colors[5],
                        padding = 5
                        ),
               widget.TextBox(
                        text='',
                        background = colors[5],
                        foreground = colors[4],
                        padding=0,
                        fontsize=37
                        ),
               widget.CurrentLayout(
                        foreground = colors[2],
                        background = colors[4],
                        padding = 5
                        ),
               widget.TextBox(
                        text='',
                        background = colors[4],
                        foreground = colors[5],
                        padding=0,
                        fontsize=37
                        ),
               widget.Clock(
                        foreground = colors[2],
                        background = colors[5],
                        format="%A, %B %d  [ %I:%M %p ]"
                        ),
               widget.Systray(
                        background = colors[5],
                        padding = 5
                        ),
              ]
    return widgets_list

### SCREENS ### (TRIPLE MONITOR SETUP)

def init_widgets_screen():
    widgets_screen1 = init_widgets_list()
    return widgets_screen1                       # Slicing removes unwanted widgets on Monitors 1,3

def init_screens():
    return [Screen(top=bar.Bar(widgets=init_widgets_screen(), opacity=0.80, size=18)),
            Screen(top=bar.Bar(widgets=init_widgets_screen(), opacity=0.80, size=18)),
            Screen(top=bar.Bar(widgets=init_widgets_screen(), opacity=0.80, size=18))]

if __name__ in ["config", "__main__"]:
    screens = init_screens()
    widgets_list = init_widgets_list()
    widgets_screen1 = init_widgets_screen()
    widgets_screen2 = init_widgets_screen()

### DRAG FLOATING WINDOWS ###
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = True
bring_front_click = True
cursor_warp = False

### FLOATING WINDOWS ###
floating_layout = layout.Floating(**layout_theme, float_rules=[
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    #{'wmclass': 'VirtualBox Manager'},
 ])

# Steam specific floating settings
@hook.subscribe.client_new
def float_steam(window):
    wm_class = window.window.get_wm_class()
    w_name = window.window.get_name()
    if (
        wm_class == ("Steam", "Steam")
        and (
            w_name != "Steam"
            # w_name == "Friends List"
            # or w_name == "Screenshot Uploader"
            # or w_name.startswith("Steam - News")
            or "PMaxSize" in window.window.get_wm_normal_hints().get("flags", ())
        )
    ):
        window.floating = True

auto_fullscreen = True
focus_on_window_activation = "smart"

### STARTUP APPLICATIONS ###
@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/autostart.sh'])

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
