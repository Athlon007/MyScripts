// ==UserScript==
// @name         YouTube Media Keys
// @namespace    Athlon/YTMediaKeys
// @version      1.0.1
// @description  Enables media keys navigation on Safari.
// @author       Athlon
// @include      *youtube.com/watch?v=*
// @run-at       document-end
// @compatible   safari
// ==/UserScript==


let videoPlayer = document.getElementsByClassName('html5-main-video')[0]

function skipMovie(value) {
    videoPlayer.currentTime = videoPlayer.currentTime + value;
}

var setHandlerInterval = setInterval(function () {
    if ('mediaSession' in navigator) {
        // next-track mediakey handler
        navigator.mediaSession.setActionHandler('previoustrack', function () { skipMovie(-10) });
        navigator.mediaSession.setActionHandler('nexttrack', function () { skipMovie(10) });
    }
}, 1000)