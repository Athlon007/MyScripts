// ==UserScript==
// @name         Leomard Link Pattern
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  Transform href in "a" tags from "/c/<any text>" into "leomard://<any text>"
// @author       Athlon
// @match        *://*/*
// @grant        none
// ==/UserScript==

(function () {
    'use strict';

    // Function to transform the href attribute
    function transformCommunity(elem) {
        const hrefValue = elem.getAttribute("href");
        if (hrefValue && hrefValue.startsWith("/c/")) {
            const newText = hrefValue.replace("/c/", "leomard://!");
            elem.setAttribute("href", newText);
        }
    }

    function transformPerson(elem) {
        const hrefValue = elem.getAttribute("href");
        if (hrefValue && hrefValue.startsWith("/u/")) {
            const newText = hrefValue.replace("/c/", "leomard://@");
            elem.setAttribute("href", newText);
        }
    }

    // Get all the anchor elements on the page
    const anchorElements = document.getElementsByTagName("a");

    // Loop through the anchor elements and apply the transformation
    for (let i = 0; i < anchorElements.length; i++) {
        transformCommunity(anchorElements[i]);
        transformPerson(anchorElements[i]);
    }
})();
