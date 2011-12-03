// webjumps
define_webjump("reddit", "http://www.reddit.com/search?q=%s");
//lastfm
lastfm_user = "lazyklimm";
define_webjump("lastfm", "http://www.last.fm/user/" + lastfm_user);
define_webjump("lastfm-music", "http://www.last.fm/search?m=all&q=%s");
define_webjump("lastfm-event", "http://www.last.fm/events/search?search=1&q=%s");
define_webjump("lastfm-tag", "http://www.last.fm/search?m=tag&q=%s");
define_webjump("lastfm-user", "http://www.last.fm/users?m=search&type=un&q=%s");
define_webjump("lastfm-group", "http://www.last.fm/users/groups?s_bio=%s");
define_webjump("lastfm-label", "http://www.last.fm/search?m=label&q=%s");
//
define_webjump("github", "http://github.com/search?q=%s&type=Everything");
