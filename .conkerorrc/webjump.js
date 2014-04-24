// LOR
// range: ALL, TOPIC, COMMENTS
// interval: MONTH, THREE_MONTH, YEAR, THREE_YEAR, ALL
define_webjump("lor-search" , "http://www.linux.org.ru/search.jsp?q=%s&oldQ=&range=ALL&interval=ALL&user=&_usertopic=on");
define_webjump("lor-user", "http://www.linux.org.ru/people/%s/profile");
define_webjump("lor-wiki", "http://www.linux.org.ru/wiki/en/%s");

// chinese web shops
define_webjump("ali", "http://www.aliexpress.com/wholesale?SearchText=%s");
define_webjump("dx", "http://dx.com/s/%s");

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
// github
define_webjump("github", "http://github.com/search?q=%s&type=Everything");

// yandex
define_webjump("mapy", "http://maps.yandex.ru/?text=%s");
define_webjump("market", "http://market.yandex.ru/search.xml?text=%s");




//// taken from http://retroj.net/git/conkerorrc

opensearch_load_paths.unshift(make_file("~/.conkerorrc/search-engines"));

/* debian */

define_webjump("debpkg", "http://packages.debian.org/%s");
define_webjump("debfile", "http://packages.debian.org/?searchon=contents&keywords=%s&mode=path&suite=unstable&arch=any");
define_webjump("debbugs", "http://bugs.debian.org/%s");
define_webjump("debpts", "http://packages.qa.debian.org/%s");
define_webjump("debpopcon", "http://qa.debian.org/popcon.php?package=%s");
define_webjump("buildd", "https://buildd.debian.org/%s");
define_webjump("buildd-ports", "http://buildd.debian-ports.org/build.php?pkg=%s");
define_webjump("debqa", "http://qa.debian.org/developer.php?login=%s");

define_webjump("debianwiki",
    "http://wiki.debian.org/Suspend?action=fullsearch&context=180&value=%s&fullsearch=Text");

/* search engines */

define_opensearch_webjump("blekko", "blekko.xml");
define_opensearch_webjump("image", "googleimages.xml");
define_webjump("sogou", "http://www.sogou.com/web?query=%s");
define_webjump("ixquick", "http://ixquick.com/do/metasearch.pl?query=%s");
define_webjump("lmgtfy", "http://lmgtfy.com/?q=%s");
define_webjump("scroogle", "http://www.scroogle.org/cgi-bin/nbbw.cgi?Gw=%s");

/* network tools */

// add_delicious_webjumps("jjfoerch");

define_webjump("down?",
    function (url) {
        if (url)
            return "http://downforeveryoneorjustme.com/" + url;
        else
            return "javascript:window.location.href='http://downforeveryoneorjustme.com/'+window.location.href;";
    },
    $argument = "optional");

define_webjump("wayback",
    function (url) {
        if (url)
            return "http://web.archive.org/web/*/" + url;
        else
            return "javascript:window.location.href='http://web.archive.org/web/*/'+window.location.href;";
    },
    $argument = "optional");

define_webjump("validate",
    "http://validator.w3.org/check?uri=%s&charset=%28detect+automatically%29&doctype=Inline&group=0");

define_webjump("validate-css",
    "http://jigsaw.w3.org/css-validator/validator?uri=%s&profile=css21&usermedium=all&warning=1&lang=en");

define_webjump("friday?", "http://docgno.me/is-it-friday-yet.php");

define_webjump("julian-day->calendar-date",
               "http://aa.usno.navy.mil/cgi-bin/aa_jdconv.pl",
               $post_data = [["jd", "%s"]]);

define_webjump("gmane", "http://gmane.org/find.php?list=%s");

/* gitweb */

/*
 *  Call gitweb-webjump-get-opml to init completions info.
 */
/*
require("gitweb-webjump");
gitweb_webjumps_opml_directory = get_home_directory();
gitweb_webjumps_opml_directory.appendRelativePath(".conkerorrc/gitweb-webjumps-opml");

define_gitweb_summary_webjump("repo.or.cz", "http://repo.or.cz/w",
                              $alternative = "http://repo.or.cz/");
*/

/* entertainment */

define_webjump("reads", "http://www.goodreads.com/search?query=%s");
define_webjump("imdb", "http://imdb.com/find?q=%s");
define_webjump("memory-alpha", "http://memory-alpha.org/wiki/Special:Search/?search=%s");
define_webjump("youtube", "http://www.youtube.com/results?search_query=%s&search=Search");
define_webjump("youtube-user", "http://youtube.com/profile_videos?user=%s");
define_webjump("lurkersguide",
    "http://www.google.com/search?q=site%3Ahttp%3A%2F%2Fwww.midwinter.com%2Flurk%2F+%s",
    $alternative = "http://www.midwinter.com/lurk/");
define_webjump("knowyourmeme", "http://knowyourmeme.com/search?q=%s");

/* sports */

define_webjump("geocaching-waypoint", "http://www.geocaching.com/seek/cache_details.aspx?wp=%s");


/* shopping */

define_webjump("amazon", "http://www.amazon.com/exec/obidos/external-search/?field-keywords=%s&mode=blended");
define_webjump("emusic", "http://www.emusic.com/search.html?mode=x&QT=%s");
