// ==UserScript==
// @name         Selfservice Switch Language To English
// @namespace    Athlon/InHollandSelfservice
// @version      1.0
// @description  Automatically switch language to English in Selfservice
// @author       Athlon
// @include      *studentportal.inholland.nl/*
// @run-at       document-end
// ==/UserScript==

window.addEventListener('load', function () {
    const btnSwitchLanguage = document.getElementById('IH_FLUID_WRK_LANGUAGECD$20$');
    const imgLang = btnSwitchLanguage.children[1].src;
    const srcLangEng = "/cs/CS92PRD/cache/IH_UK_FLAG_24_DUT_1.PNG";

    // Check if flag is UK. If so, click tbe button.
    if (imgLang.includes(srcLangEng)) {
        btnSwitchLanguage.click();
    }
});