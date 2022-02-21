// ==UserScript==
// @name        YoTubeFullScreen
// @namespace   http://athlon.kkmr.pl/
// @match       *://*.youtube.com/watch?v=*
// @grant       none
// @version     1.0
// @author      Konrad Figura
// @description Automatically sets the player to Theater mode
// @run-at       document-end
// ==/UserScript==

document.getElementsByClassName('ytp-size-button')[0].click();