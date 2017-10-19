
var second;
var minute;
var hour;

var x1;
var x2;
var x3;

var mycookie1;
var mycookie2;
var mycookie3;

var checkTag;

function TimeLeft() {

    second = 59;
    minute = 59;
    hour = 2;
    
    document.getElementById("sec").innerHTML = 59;
    x1 = 59;

    document.getElementById("min").innerHTML = 59;
    x2 = 59;

    document.getElementById("hrs").innerHTML = 2;
    x3 = 2;
}


function time() {

    if (second == undefined && minute == undefined && hour == undefined) {

        document.getElementById("sec").innerHTML = "0";
        document.getElementById("min").innerHTML = "0";
        document.getElementById("hrs").innerHTML = "0";

    }

    else {
        
        x1 = second;
        x2 = minute;
        x3 = hour;
        
        checkTag = document.getElementById("VoteEnd");
        checkTag.href = "selection.aspx";
        

        second--;
        
        document.getElementById("sec").innerHTML = second;

        x1 = second;

        if (second == 0 ) {

            second = 59;

            minute--;

            document.getElementById("min").innerHTML = minute;

            x2 = minute;

            if (minute == 0) {

                minute = 59;

                hour--;

                document.getElementById("hrs").innerHTML = hour;

                x3 = hour;

                if (hour == 0) {

                    clearInterval(time_ends);
                    var ve = document.getElementById("VoteEnd");
                    ve.removeAttribute("href");

                }

            }

        }
    }
}

var time_ends = setInterval(time, 1);

function unloadck() {

    if (x1 != undefined && x2 != undefined && x3 != undefined) {

    document.cookie = "sec="+x1;  
    document.cookie = "min="+x2;  
    document.cookie = "hrs="+x3;
    
}
}


function loadck() {

    mycookie1 = document.cookie.replace(/(?:(?:^|.*;\s*)sec\s*\=\s*([^;]*).*$)|^.*$/, "$1");
    mycookie2 = document.cookie.replace(/(?:(?:^|.*;\s*)min\s*\=\s*([^;]*).*$)|^.*$/, "$1");
    mycookie3 = document.cookie.replace(/(?:(?:^|.*;\s*)hrs\s*\=\s*([^;]*).*$)|^.*$/, "$1");

    if (mycookie1 != "" && mycookie2 != "" && mycookie3 != "") {

        second = mycookie1;
        document.getElementById("sec").innerHTML = second;

        minute = mycookie2;
        document.getElementById("min").innerHTML = minute;

        hour = mycookie3;
        document.getElementById("hrs").innerHTML = hour;

        if (second == 0 && minute == 0 && hour == 0) {

            clearInterval(time_ends);
            var ve = document.getElementById("VoteEnd");
            ve.removeAttribute("href");
            x1 = 0;
            x2 = 0;
            x3 = 0;

        }
    }

}










