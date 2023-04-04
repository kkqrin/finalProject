
$(".review-range-view").hide();

$(".review-range").on("click", function(event){
    $(".review-range-view").toggle();
    event.stopPropagation();
});

$(".review-like").on("click", function(){
    // 누르면 ajax로 카운트 변경 ! 나중에 수정..
    $(this).children().first().toggleClass("review-like-on");
    $(this).children().last().toggleClass("review-like-on");
});

$(document).on("click", function(){
    $(".review-range-view").hide();
});