homepage = "about:blank";

url_completion_use_history = true;

editor_shell_command = "emacsclient -c";
view_source_use_external_editor = true;

xkcd_add_title = true;

add_hook("before_quit_hook",
         function () {
             var w = get_recent_conkeror_window();
             var result = (w == null) ||
                 "y" == (yield w.minibuffer.read_single_character_option(
                             $prompt = "Quit Conkeror? (y/n)",
                             $options = ["y", "n"]));
             yield co_return(result);
         });

cwd = make_file("/tmp/downloads");
set_user_agent('Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:20.0) Gecko/20100101 Firefox/20.0');
