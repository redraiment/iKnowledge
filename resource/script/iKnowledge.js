var doSearch = function(e) {
    e = window.event? event: e;
    if (e.keyCode == 13) {
        var google = 'http://www.google.com/cse/publicurl?cx=016566116830714177436:pewf8jtunkm&q=';
        var word = document.getElementById('search').value;
        var url = google + encodeURIComponent(word);
        open(url, 'redraiment-search');
    }
};

var doFocus = function() {
    var me = document.getElementById('search');
    if (me.value == '站内搜索') {
        me.value = '';
        me.style.color = '#000000';
    }
};

var doBlur = function() {
    var me = document.getElementById('search');
    if (me.value == '') {
        me.value = '站内搜索';
        me.style.color = '#808080';
    }
};
