// ==UserScript==
// @name         Selfservice Switch Language ToEnglish
// @namespace    Athlon/InHollandSelfservice
// @version      1.0
// @description  Automatically switch language to English in Selfservice
// @author       Athlon
// @include      *studentportal.inholland.nl/*
// @run-at       document-end
// ==/UserScript==

const btnSwitchLanguage = document.getElementById('IH_FLUID_WRK_LANGUAGECD$20$');
const imgLang = btnSwitchLanguage.children[1].src;
const srcLangEng = "/cs/CS92PRD/cache/IH_UK_FLAG_24_DUT_1.PNG";

if (imgLang === srcLangEng) {
    btnSwitchLanguage.click();
}