theme_load_paths.unshift("/home/dk/.conkerorrc/");
theme_load("tango");


// mode-line
remove_hook("mode_line_hook", mode_line_adder(clock_widget));

load_paths.unshift("chrome://conkeror-contrib/content/");
require("mode-line-buttons.js");
mine_mode_line_buttons = [
    ["find-url", "open"],
    ["find-url-new-window", "new"],
    ["back", "go-back"],
    ["forward", "go-forward"],
    ["reload", "refresh"],
/*    ["kill-current-buffer", "close"],*/
/*    ["buffer-previous", "go-up"],*
/*    ["buffer-next", "go-down"],*/
/*    ["help-page", "help"],*/
];

mode_line_add_buttons(mine_mode_line_buttons, false);

require("favicon");

add_hook("mode_line_hook", mode_line_adder(buffer_icon_widget), true);
