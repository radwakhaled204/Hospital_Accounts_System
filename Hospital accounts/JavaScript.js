$(document).ready(function () {
    adjustSidebarHeight();
});

$(window).resize(function () {
    adjustSidebarHeight();
});

function adjustSidebarHeight() {
    var contentHeight = $("#content").outerHeight();
    var sidebarHeight = $("#sidebar").outerHeight();

    if (contentHeight > sidebarHeight) {
        $("#sidebar").css("height", contentHeight);
    } else {
        $("#sidebar").css("height", "");
    }
}

// تطبيق الوظيفة عند تحميل الصفحة وعند تغيير حجم النافذة
$(document).ready(function () {
    adjustGridViewHeight();
});

$(window).resize(function () {
    adjustGridViewHeight();
});

// تحديد وظيفة لتعديل ارتفاع GridView
function adjustGridViewHeight() {
    var contentHeight = $("#content").outerHeight();
    var gridHeight = $("#grid").outerHeight();

    if (contentHeight > gridHeight) {
        $("#grid").css("height", contentHeight);
    } else {
        $("#grid").css("height", "");
    }
}



function updateTime() {
    var currentDate = new Date();
    var time = currentDate.toLocaleTimeString();
    var date = currentDate.toLocaleDateString();
    document.getElementById('timeDateDisplay').innerHTML = 'Time: ' + time + '           ' + 'Date: ' + date;
}

updateTime();

setInterval(updateTime, 1000);

import { Ripple, initMDB } from "mdb-ui-kit";
initMDB({ Ripple });