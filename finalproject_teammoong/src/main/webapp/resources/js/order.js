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
        $("#deli-addr").prop("readonly", false);

        // 라디오
        $("#member-address").prop("checked", false);
        $("#new-input-address").prop("checked", true);
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