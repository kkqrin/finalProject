// 약관 전체 동의
$(document).ready(function() {
    $("#all-agree").click(function() {
        if($("#all-agree").is(":checked")){
            $("input[name=chk]").prop("checked", true);
        }else{
            $("input[name=chk]").prop("checked", false);
        } 
    });

    $("input[name=chk]").click(function() {
        var total = $("input[name=chk]").length;
        var checked = $("input[name=chk]:checked").length;

        if(total != checked){
            $("#all-agree").prop("checked", false);
        }else{
            $("#all-agree").prop("checked", true); 
        }
    });
});



// 배송정보 > 주문자 정보와 동일
$("#delivery-member").on("change", function(){
    if($(this).is(":checked")){
        // 체크박스 선택시 회원가입시 입력한 정보 들어감 + readonly
        $("#deli-member").val($("#session-member-name").val());
        $("#deli-member").prop("readonly", true);
        $("#deli-phone").val($("#session-member-phone").val());
        $("#deli-phone").prop("readonly", true);
        $("#deli-post-number").val($("#session-member-zonecode").val());
        $("#deli-post-number").prop("readonly", true);
        $("#deli-addr").val($("#session-member-addr").val());
        $("#deli-addr").prop("readonly", true);
        // 기본 배송지 라디오
        $("#member-address").prop("checked", true);
        // 상세주소 : 직접 입력 (주소검색) 일때만 보여짐
        $("#deli-addr2").slideUp(200);
    }else{
        // 해제시 초기화
        $("#deli-member").val("");
        $("#deli-member").prop("readonly", false);
        $("#deli-phone").val("");
        $("#deli-phone").prop("readonly", false);
        $("#deli-post-number").val("");
        $("#deli-post-number").prop("readonly", false);
        $("#deli-addr").val("");
        $("#deli-addr2").val("");
        $("#deli-addr").prop("readonly", false);

        // 라디오
        $("#member-address").prop("checked", false);
        $("#new-input-address").prop("checked", true);

        // 주소검색을 위한 상세주소 input 활성화
        $("#deli-addr2").slideDown(200);
    }
});

// 배송정보 직접 입력
$("#new-input-address").on("change", function(){
    if($(this).is(":checked")){
        $("#deli-post-number").val("");
        $("#deli-post-number").prop("readonly", false);
        $("#deli-addr").val("");
        $("#deli-addr").prop("readonly", false);

        // 주소검색을 위한 상세주소 input 활성화
        $("#deli-addr2").slideDown(200);
        $("#deli-addr2").val("");
    }
});

// 배송정보 기본 배송지
$("#member-address").on("change", function(){
    if($(this).is(":checked")){
        $("#deli-post-number").val($("#session-member-zonecode").val());
        $("#deli-post-number").prop("readonly", true);
        $("#deli-addr").val($("#session-member-addr").val());
        $("#deli-addr").prop("readonly", true);
        // 상세주소 : 직접 입력 (주소검색) 일때만 보여짐
        $("#deli-addr2").slideUp(200);
    }
})




$("#addr").on("click",function(){
    new daum.Postcode({
        oncomplete: function(data) {
            $("#deli-post-number").val(data.zonecode);
            const addr = String(data.address);
            $("#deli-addr").val(addr);
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
        }
    }).open();
});//다음 지도 API




// 휴대폰 유효성 검사
const phoneNumber = '01012345678';
let result = [false];


$("#deli-phone").on("change", function(){
    const phoneRegex = /^010\d{8}$/;

    if (phoneRegex.test($(this).val())) {
        $(".deli-phone-valid").text("");
    } else {
        $(".deli-phone-valid").text("'-'제외 '010'으로 시작하는 11자리 숫자를 입력해주세요");
        result[0] = true;
    }
    

})

// // 유효성 검사
// $(".order-sheet-wrap>form").submit(function (e) {

//     const deliMember = $("#deli-member").val();
//     const deliPhone = $("#deli-phone").val();
//     const deliAddr = $("#deli-addr").val();

//     if(deliMember === '' || deliPhone === '' || deliAddr === ''){
//         orderjQueryAlert('info', '배송 정보를 모두 입력해주세요.');
//     }

//     else if(result[0]){
//         orderjQueryAlert('info', '배송정보를 올바르게 입력했는지 확인해주세요.');
//     }

//     else if(!$("#all-agree").is(":checked")){
//         orderjQueryAlert('info', '약관 동의 후 결제하실 수 있습니다.');
//     }

//         e.preventDefault();
//         return false;
// });


    // 	jqueryAlert
    function orderjQueryAlert(type, msg) {
        let $type = type;
        let messageBox = msg;
        switch ($type) {
            case 'info':
            messageBox = $.parseHTML('<div class="alert__info" style="line-height:100px;text-align:center;"><div class="title" style="margin-bottom:10px;color:var(--info);padding:0;">뭉쳐야산다</div><br>'+msg+'</div>');
            break;
        }
        $("body").append(messageBox);
        $(messageBox).dialog({
            dialogClass :$type,
            // open: $(messageBox).append(msg),
            draggable: false,
            modal: true,
            width: 500,
            buttons: {
                "닫기": function () {
                    $(this).dialog("close");
                }
            },
            show: {
                effect: 'fade',
                duration: 200 //at your convenience
            },
            hide: {
                effect: 'fade',
                duration: 200 //at your convenience
            }
        });
    };