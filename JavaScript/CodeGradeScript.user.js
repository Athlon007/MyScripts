// ==UserScript==
// @name        InHolland CodeGrade Resize
// @namespace   http://athlon.kkmr.pl/
// @match       *://moodle.inholland.nl/mod/lti/view.php?id=*
// @grant       none
// @version     1.0
// @author      Konrad Figura
// @description Makes the CodeGrade window on InHolland's moodle larger.
// ==/UserScript==

let contentFrame = document.getElementById("contentframe");
let resourceObject = document.getElementById("resourceobject");

contentFrame.style.minHeight = '750px';
resourceObject.style.minHeight = '600px';