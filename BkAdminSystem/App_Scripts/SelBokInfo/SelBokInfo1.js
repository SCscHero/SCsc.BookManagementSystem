var i = 1;
var time;
$(document).ready(function () {

    $('.ig').eq(0).show().siblings().hide();
    timer();


});

//会动的定时器
function timer() {
    timer = setInterval(function () {
        Show();
        i++;
        if (i == 4) {
            i = 0;
        }
    }, 3000)
}
//会动的方法

function Show() {
    $('.ig').eq(i).fadeIn(500).siblings().fadeOut(500);
}




$('.banner_left').click(function () {
    clearInterval(time);
    if (i == 4) {
        i = 4;
    }
    i--;
    Show();
    timer()

})

$('.banner_right').click(function () {
    clearInterval(time);
    if (i == 3) {
        i = -1;
    }
    i++;
    Show();
    timer();
})