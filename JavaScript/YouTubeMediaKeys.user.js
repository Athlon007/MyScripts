// ==UserScript==
// @name        YouTubeMediaKeys
// @namespace   http://athlon.kkmr.pl/
// @match       *://*.youtube.com/watch?v=*
// @grant       none
// @version     1.0
// @author      Konrad Figura
// @description Adds an ability to fast-forward and rewind movies on the YouTube.
// @run-at       document-end
// ==/UserScript==

let videoPlayer = document.getElementsByClassName('html5-main-video')[0]
let skipTime = 10; // In seconds

function skipMovie(value) {
    videoPlayer.currentTime = videoPlayer.currentTime + value;
}

var setHandlerInterval = setInterval(function () {
    if ('mediaSession' in navigator) {
        navigator.mediaSession.setActionHandler('previoustrack', function () { skipMovie(skipTime * -1) });
        navigator.mediaSession.setActionHandler('nexttrack', function () { skipMovie(skipTime) });
    }
}, 1000)