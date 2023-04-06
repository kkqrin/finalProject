
let timeId;
$(document).ready(function(){

    $(".end-hotdeal").hide();

    timeId = window.setInterval(function () {
        var now = new Date();
        var end = new Date(now.getFullYear(),now.getMonth(),now.getDate(),11,27,20);
    
        var nt = now.getTime();
        var et = end.getTime();
    
        if(nt<et){
            sec =parseInt(et - nt) / 1000;
            day  = parseInt(sec/60/60/24);
            sec = (sec - (day * 60 * 60 * 24));
            hour = parseInt(sec/60/60);
            sec = (sec - (hour*60*60));
            min = parseInt(sec/60);
            sec = parseInt(sec-(min*60));
            if(hour<10){hour="0"+hour;}
            if(min<10){min="0"+min;}
            if(sec<10){sec="0"+sec;}

            $(".hours").html(hour);
            $(".minutes").html(min);
            $(".seconds").html(sec);
        }else{
            // $(".hours").html("00");
            // $(".minutes").html("00");
            // $(".seconds").html("00");
            $(".hotdeal-time").children().hide();
            $(".hotdeal-time").append($("<span>").text("TIME OUT"));
            $(".end-hotdeal").show();
        }

    }, 1000);
});

$('.popular-product-wrap').slick({
    dots: true,
    infinite: false,
    speed: 800,
    slidesToShow: 4,
    slidesToScroll: 4,
    responsive: [
        {
        breakpoint: 1024,
        settings: {
            slidesToShow: 3,
            slidesToScroll: 3,
            infinite: true,
            dots: true
        }
        },
        {
        breakpoint: 600,
        settings: {
            slidesToShow: 2,
            slidesToScroll: 2
        }
        },
        {
        breakpoint: 480,
        settings: {
            slidesToShow: 1,
            slidesToScroll: 1
        }
        }
    ]
});