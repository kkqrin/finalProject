
// 정렬 
$(".review-range-view").hide();

$(".review-range").on("click", function(event){
    $(".review-range-view").toggle();
    event.stopPropagation();
});

// 다른 곳 누르면 정렬 창 사라짐
$(document).on("click", function(){
    $(".review-range-view").hide();
});

$(".review-like>div").on("click", function(){
    // 누르면 ajax로 카운트 변경 ! 나중에 수정..
    $(this).children().first().toggleClass("review-like-on");
    $(this).children().eq(1).toggleClass("review-like-on");
    $(this).children().eq(2).toggle();
    $(this).children().eq(3).toggle();
    $(this).toggleClass("review-like-color");
});

