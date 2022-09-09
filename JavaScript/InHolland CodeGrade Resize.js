// ==UserScript==
// @name         InHolland CodeGrade Resize
// @namespace    Athlon/InHolland
// @version      1.0.1
// @description  Resizes InHolland CodeGrade window to be larger
// @author       Athlon
// @include      *moodle.inholland.nl/mod/lti/view.php?id=*
// @run-at       document-end
// ==/UserScript==

let contentFrame = document.getElementById("contentframe");
let resourceObject = document.getElementById("resourceobject");

contentFrame.style.minHeight = '750px';
resourceObject.style.minHeight = '600px';