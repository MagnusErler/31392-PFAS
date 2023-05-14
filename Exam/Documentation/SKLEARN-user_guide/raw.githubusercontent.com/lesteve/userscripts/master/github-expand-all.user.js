// ==UserScript==
// @name        github expand all
// @namespace   lesteve.github.io
// @include     /https://github.com/.*/(issues|pull)/.*/
// @version     1
// @grant       none
// ==/UserScript==

// Register a shortcut to expands all outdated comments. This is useful to
// search text inside old comments thas have been folded because the code has
// been modified after the comment. At the moment the following content is expanded:
// * outdated diffs
// * folded conversations
//   (e.g. https://github.com/scikit-learn/scikit-learn/pull/9012#pullrequestreview-42934289
//   215 items not shown)
// * large diffs, which are hidden by default, e.g. the doc/glossary.rst diff
//   in https://github.com/scikit-learn/scikit-learn/pull/9517/files
// * some mix of outdated but not resolved, resolved but not outdated (probably
//   batched suggestions), both resolved and outdated
//   https://github.com/scikit-learn/scikit-learn/pull/22567


(function(){
    'use strict';
    // console.log('github-expand-all.user.js loaded');
    var opened = false;


    function open_outdated_diff_comments() {
        // console.log('Begin open_outdated_diffs');
        var outdated_children_elements = document.querySelectorAll(
            '.js-comment-container [title~="Outdated"], .js-toggle-outdated-comments');
        // when looking at the closest js-comment-container there may be
        // duplicated elements (some comments are both outdated and resolved)
        // so using a Set, there may be a better way to do it ...
        var outdated_diff_elements = new Set();
        outdated_children_elements.forEach(each => outdated_diff_elements.add(each.closest('.js-comment-container')));
        console.log('outdated_diff_elements.length: ' + outdated_diff_elements.size);

        outdated_diff_elements.forEach( each => {
            if (!opened) {
                each.setAttribute('open', '');
            }
            else {
                each.removeAttribute('open');
            }
        });
        opened = !opened;
        // console.log('Opened: ' + opened);
    }

    function load_hidden_items() {
        var buttons = document.getElementsByClassName('ajax-pagination-btn');
        if (buttons.length != 0){
            for (var i = 0; i < buttons.length; i++) {
                buttons[i].click();
            }
            setTimeout(load_hidden_items, 100);
        } else {
            console.log('Loaded all hidden items');
        }
    }


    function load_large_diffs() {
        var buttons = document.getElementsByClassName('load-diff-button');
        for (var i = 0; i < buttons.length; i++) {
            buttons[i].click();
        }
        console.log('Loaded ' + buttons.length + ' large diffs');
    }
    document.addEventListener('keydown', function(e) {
        // console.log('Pressed: ' + e.keyCode);
        // console.log('shift: ' + e.shiftKey);
        // console.log('ctrl: ' + e.ctrlKey);
        // console.log('alt: ', e.altKey);
        // console.log('meta: ' + e.metaKey);
        if (e.keyCode == 80 && !e.shiftKey && e.ctrlKey && e.altKey && !e.metaKey) {
            // console.log('Pressed alt-ctrl-p');
            open_outdated_diff_comments();
            load_hidden_items();
            load_large_diffs();
        }
    }, false);
})();
