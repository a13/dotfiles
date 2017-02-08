//keybindings
function tr (seq) {
    let ru = decodeURIComponent(escape('ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ'));
    let en = '`qwertyuiop[]asdfghjkl;\'zxcvbnm,.~QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>';
    function e2r (ch) {
        let idx = en.indexOf(ch);
        return (idx == -1)? ch : ru[idx];
    }

    let nseq = [];
    seq.forEach(
        function (tmp) {
            if (typeof tmp == "string") {
                let m = tmp.match(/^(M-|)(.)$/);
                if (m)
                    nseq.push(m[1] + e2r(m[2]));
                else
                    nseq.push(tmp);
            }
        }
    );
    return nseq;
}

// defadvice emulation
define_key_internal = (function (fn) {
    return function () {
        fn.apply(fn, arguments);
        arguments[2] = tr(arguments[2]);
        fn.apply(fn, arguments);
    };
})(define_key_internal);


// do not load default bindings before rc (will work from the second time)
user_pref("conkeror.load.bindings/default/bindings", 0);
// but load after
require("bindings/default/bindings");

// more universal keys
define_key(default_global_keymap, "C-x C-f", "find-url-new-window");
define_key(text_keymap, 'C-w', 'cmd_deleteWordBackward');
define_key(text_keymap, 'C-h', 'cmd_deleteCharBackward');
require("global-overlay-keymap.js");
define_key_alias("C-m", "return");

define_key(text_keymap, "C-x C-e", "edit-current-field-in-external-editor");

// hinting
hints_auto_exit_delay=250;
hints_ambiguous_auto_exit_delay=750;

// middle click
require('clicks-in-new-buffer');
clicks_in_new_buffer_target=OPEN_NEW_WINDOW;
