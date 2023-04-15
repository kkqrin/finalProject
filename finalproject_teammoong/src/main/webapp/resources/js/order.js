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
    }
});