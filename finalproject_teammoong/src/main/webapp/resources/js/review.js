
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
    $(this).toggleClass("review-like-color");
});

//모달 관련 기능
$(function () {
    $('[data-modal]').click(function (event) {
        const modalId = $(this).data('modal');
        if ($(modalId).hasClass('modal-pri')) {
            $($(this).data('modal')).modal({
                fadeDuration: 100
            });
            return false;
        } else if ($(modalId).hasClass('modal-sec')) {
            $($(this).data('modal')).modal({
                escapeClose: false,
                showClose: false,
                fadeDuration: 100
            });
            return false;
        } else {
            return false;
        }
    });
    
});


$( function() {
    // $( "#review-color" ).selectmenu();
    // $( "#review-size" ).selectmenu();
    $( ".select-custom" ).selectmenu();
    $("#review-color-button").css("margin-bottom","30px");
});

$("#review-filter-btn").on("click", function(){
    console.log($("#review-color").val());
    console.log($("#review-size").val());
});




$(function(){
    $('.review-img').slick();
    // $('.modal-review-img').slick();
    // 리뷰 메인페이지 슬라이드
    $(".slick-slide").css("height","238px");
});





    // 신고 모달 직접 입력 선택시 textarea 작성 가능
    $("[name=report-reason]").on("change", function(){
        if($(this).val() == 8){
            $(".report-direct-input").attr("disabled", false);
        }else{
            $(".report-direct-input").attr("disabled", true);
            $(".report-direct-input").val("");
        }
    });

    // 라디오 초기화
    $(".report-modal-close").on("click", function(){
        $(".report-form [type=radio]").prop("checked", false);
    });