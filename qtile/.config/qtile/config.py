from typing import List  # noqa: F401

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

from pathlib import Path
import subprocess

# Solarized colours
colours = {
    "bg_normal": "#002b36",  # base03
    "bg_highlight": "#073642",  # base02
    "fg_normal": "#839496",  # base0
    "fg_dim": "#586e75",  # base01
    "fg_highlight": "#93a1a1",  # base1
    "yellow": "#b58900",
    "orange": "#cb4b16",
    "red": "#dc322f",
    "magenta": "#d33682",
    "violet": "#6c71c4",
    "blue": "#268bd2",
    "cyan": "#2aa198",
    "green": "#859900",
}

mod = "mod4"
terminal = guess_terminal()
launcher = "rofi -show drun -modi drun -show-icons"
screen_lock = (
    "i3lock --blur 7 --clock --pass-media-keys --pass-screen-keys"
    f" --insidevercolor={colours['blue']}ff"
    f" --insidewrongcolor={colours['red']}ff"
    f" --insidecolor={colours['bg_normal']}ff"
    f" --ringvercolor={colours['violet']}ff"
    f" --ringwrongcolor={colours['orange']}ff"
    f" --ringcolor={colours['bg_highlight']}ff"
    f" --keyhlcolor={colours['green']}ff"
    f" --bshlcolor={colours['red']}ff"
    f" --verifcolor={colours['fg_normal']}ff"
    f" --wrongcolor={colours['fg_normal']}ff"
    f" --timecolor={colours['fg_normal']}ff"
    f" --datecolor={colours['fg_normal']}ff"
)

keys = [
    # Switch between windows in current stack pane
    Key([mod], "j", lazy.layout.down(),
        desc="Move focus down in stack pane"),
    Key([mod], "k", lazy.layout.up(),
        desc="Move focus up in stack pane"),

    # Move windows up or down in current stack
    Key([mod, "control"], "j", lazy.layout.shuffle_down(),
        desc="Move window down in current stack "),
    Key([mod, "control"], "k", lazy.layout.shuffle_up(),
        desc="Move window up in current stack "),

    # Expand or contract current window
    Key([mod], "h", lazy.layout.shrink(),
        desc="Shrink window"),
    Key([mod], "l", lazy.layout.grow(),
        desc="Expand window"),
    Key([mod], "n", lazy.layout.normalize(),
        desc='Normalize window size ratios'),

    # Toggle full screen
    Key([mod], "f", lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen"),
    # Toggle floating
    Key([mod, "control"], "space", lazy.window.toggle_floating(),
        desc="Toggle floating"),

    # Switch to the next layout
    Key([mod], "space", lazy.next_layout(),
        desc="Switch to the next layout"),

    # Open a terminal
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Run rofi in dmenu mode
    Key([mod], "r", lazy.spawn(launcher), desc="Run rofi"),

    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),

    # Audio controls
    Key([], "XF86AudioMute",
        lazy.spawn("amixer -D pulse set Master 1+ toggle"),
        desc="Toggle mute"),
    Key([], "XF86AudioLowerVolume",
        lazy.spawn("amixer -q -D pulse sset Master 5%-"),
        desc="Lower volume 5%"),
    Key([], "XF86AudioRaiseVolume",
        lazy.spawn("amixer -q -D pulse sset Master 5%+"),
        desc="Raise volume 5%"),

    Key([mod, "control"], "r", lazy.restart(), desc="Restart qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown qtile"),
    Key([mod, "control"], "l", lazy.spawn(screen_lock),
        desc="Lock the screen"),
]

groups = [Group(str(i)) for i in range(1, 10)]

for i in groups:
    keys.extend([
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            desc="move focused window to group {}".format(i.name)),
    ])

layout_theme = {
    "border_width": 6,
    "margin": 32,
    "border_focus": colours["green"],
    "border_normal": colours["fg_normal"]
}

layouts = [
    layout.MonadTall(**layout_theme),
    layout.Zoomy(**layout_theme, columnwidth=900),
    layout.Max(**layout_theme),
]

widget_defaults = dict(
    font='sans',
    fontsize=24,
    padding=3,
    background=colours["bg_normal"],
    foreground=colours["fg_normal"],
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    disable_drag=True,
                    active=colours["green"],
                    inactive=colours["fg_normal"],
                    this_current_screen_border=colours["blue"],
                    this_screen_border=colours["blue"],
                    other_current_screen_border=colours["yellow"],
                    other_screen_border=colours["yellow"],
                    urgent_border=colours["red"]
                ),
                widget.TaskList(
                    icon_size=0,
                    border=colours["green"],
                    urgent_border=colours["red"]
                ),
                widget.Spacer(),
                widget.Cmus(
                    play_color=colours["green"],
                    noplay_color=colours["fg_dim"]
                ),
                widget.Sep(),
                widget.TextBox(
                    text="",
                    fontsize="32",
                    foreground=colours["yellow"]
                ),
                widget.ThermalSensor(
                    foreground=colours["fg_normal"],
                    forground_alert=colours["red"],
                    tag_sensor="Tdie"
                ),
                widget.Sep(),
                widget.TextBox(
                    text="",
                    fontsize="32",
                    foreground=colours["yellow"]
                ),
                widget.CPU(
                    foreground=colours["fg_normal"],
                    format="{load_percent}% {freq_current}GHz",
                    update_interval=3.0
                ),
                widget.Sep(),
                widget.TextBox(
                    text="",
                    fontsize="32",
                    foreground=colours["yellow"]
                ),
                widget.Memory(
                    foreground=colours["fg_normal"],
                    format="{MemUsed}/{MemTotal}MiB",
                    update_interval=3.0
                ),
                widget.Sep(),
                widget.TextBox(
                    text="",
                    fontsize="32",
                    foreground=colours["yellow"]
                ),
                widget.Net(
                    foreground=colours["fg_normal"],
                    update_interval=3.0,
                    format="{down}↓ {up}↑",
                    interface="enp8s0"
                ),
                widget.Sep(),
                widget.TextBox(
                    text="",
                    fontsize="32",
                    foreground=colours["yellow"]
                ),
                widget.Volume(
                    device="pulse"
                ),
                widget.Sep(),
                widget.TextBox(
                    text="",
                    fontsize="32",
                    foreground=colours["yellow"]
                ),
                widget.CheckUpdates(
                    colour_have_updates=colours["fg_highlight"],
                    colour_no_updates=colours["fg_dim"],
                    distro="Arch_checkupdates",
                    display_format="{updates}",
                    no_update_string="0",
                    update_interval=1800
                ),
                widget.Sep(),
                widget.Systray(icon_size=32),
                widget.Sep(),
                widget.Clock(format='%Y-%m-%d %a %I:%M %p'),
                widget.Sep(),
                widget.CurrentLayoutIcon(
                    foreground=colours["yellow"],
                    scale=0.75
                ),
            ],
            48,
            background=colours["bg_normal"]
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "smart"


@hook.subscribe.startup
def set_wallpaper():
    home_dir = Path.home()
    subprocess.run(["nitrogen", "--set-zoom-fill", "--random",
                    str(home_dir / ".wallpapers")])


@hook.subscribe.startup_once
def start_once():
    home_dir = Path.home()
    subprocess.run([str(home_dir / ".config/qtile/autostart.sh")])


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
