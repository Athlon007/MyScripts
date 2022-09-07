// ==UserScript==
// @name         YouTube Full Screen
// @namespace    Athlon/YTFullScreen
// @version      1.0.1
// @description  Switches the YouTube video player into Cinematic mode automatically
// @author       Athlon
// @include      *youtube.com/watch?v=*
// @run-at       document-end
// ==/UserScript==

document.getElementsByClassName('ytp-size-button')[0].click();