//keybindings 

ru = decodeURIComponent(escape('ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ'));
en = '`qwertyuiop[]asdfghjkl;\'zxcvbnm,.~QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>';

function e2r (ch) {
    let (idx = en.indexOf(ch)) {
        return (idx == -1)? ch : ru[idx];
    }
}

function tr (seq) {
    var nseq = [];
    seq.forEach(
        function (tmp) {
            if (typeof tmp == "string") {
                var m = tmp.match(/^(M-|)(.)$/);
                if (m)
                    nseq.push(m[1] + e2r(m[2]));
                else
                    nseq.push(tmp);
            }
        }
    );
    return nseq;
}

// hacked version
define_keywords("$fallthrough", "$repeat", "$browser_object");
function define_key (kmap, seq, cmd) {
    keywords(arguments);
    var orig_seq = seq;
    try {
        var ref = get_caller_source_code_reference();

        if (typeof seq == "string" && seq.length > 1)
            seq = seq.split(" ");

        if (!(typeof seq == "object") || !(seq instanceof Array))
            seq = [seq];

        // normalize the order of modifiers in key combos
        seq = seq.map(
            function (k) {
                if (typeof(k) == "string")
                    return format_key_combo(unformat_key_combo(k));
                else
                    return k;
            });

        var new_command = null;
        var new_keymap = null;
        if (typeof cmd == "string" || typeof cmd == "function")
            new_command = cmd;
        else if (cmd instanceof keymap)
            new_keymap = cmd;
        else if (cmd != null)
            throw new Error("Invalid `cmd' argument: " + cmd);

        define_key_internal(ref, kmap, seq, new_command, new_keymap,
                            forward_keywords(arguments));
        // repeat for translated version
        define_key_internal(ref, kmap, tr(seq), new_command, new_keymap,
                          forward_keywords(arguments));

    } catch (e if (typeof e == "string")) {
        dumpln("Warning: Error occurred while binding sequence: " + orig_seq);
        dumpln(e);
    }
}
// do not load default bindings before rc (will work from the second time)
user_pref("conkeror.load.bindings/default/bindings", 0);
// but load after
require("bindings/default/bindings");


define_key(default_global_keymap, "C-x C-f", "find-url-new-window");
