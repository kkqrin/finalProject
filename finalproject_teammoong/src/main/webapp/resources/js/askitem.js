$("#addrCheck").on("click",function(){
    new daum.Postcode({
        oncomplete: function(data) {
            $("[name='corpAddr1']").val(data.address);
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
        }
    }).open();
    if($("[name='corpAddr1']").val()==!""){
        alert("gd");
    }
});
$("#askContent").summernote({
    height : 550,
    lang : "ko-KR",
    callbacks : {
        onImageUpload : function(files) {
            uploadImage(files[0], this)
        }
        
    }
});
function uploadImage(file, editor) {
    const form = new FormData();
    form.append("imageFile", file);
    console.log(file);
    $.ajax({
        url: "/uploadAskItemImage.do",
        type: "post",
        data: form,
        processData: false,
        contentType: false,
        success: function(data) {
            console.log(data);
            $(editor).summernote("insertImage", data);
        }
    });
}
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
    $("#regInsertBtn").hide();
});
$(function(){
    $("#checkRegNo").keypress(function(e){
        if(e.keyCode == 13){
            $("#checkRegBtn").click();
        }
    });
});
function resetInput() {
    $('#checkRegNo').val('');
    $("#regInsertBtn").hide();
    $("#resultMsg").text("");
    $("#checkRegNo").attr("readonly",false);
}

$("#checkRegBtn").on("click",function(){
    const checkRegNo = $("#checkRegNo").val();
    var data = {
            "b_no": [checkRegNo]
        };

    $.ajax({
          url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=gEalERG7TYUJsrURLYKBhpx2leSDiLwJcRmQ3biM8pkh%2F3xO5uUxndYGXTyexgkwtd4ZgnAaM4vw81EpriD29A%3D%3D",
          type: "POST",
          data: JSON.stringify(data),
          dataType: "JSON",
          contentType: "application/json",
          accept: "application/json",
          success: function(result) {
              console.log(result.data[0].tax_type);
              const resultText = result.data[0].tax_type
                if(resultText == "국세청에 등록되지 않은 사업자등록번호입니다."){
                    $("#resultMsg").text("유효하지 않은 사업자입니다.");
                    $("#resultMsg").css("color","red");
                    $("#regInsertBtn").hide();
                 }else{
                      $("#resultMsg").text("유효한 사업자입니다.");
                      $("#resultMsg").css("color","green");
                      $("#regInsertBtn").show();
                      $("#checkRegNo").attr("readonly",true);
                 }
          },
              error: function(result) {
              console.log(result.responseText);
          }
        }); 
});
$("#regInsertBtn").on("click",function(){
    const regNo = $("#checkRegNo").val();
    $('[name=regNo]').val(regNo);
    resetInput();
    $("#close").click();
});


$(document).ready(function() {
      $('#fileUpload').change(function() {
        const files = $('#fileUpload')[0].files;
        if (files.length > 0) {
          let fileNamesWrapper = $('<div></div>');
          for (let i = 0; i < files.length; i++) {
            let fileDiv = $('<div></div>');
            let fileNameSpan = $('<span></span>');
            fileNameSpan.text(files[i].name);
            let delBtn = $('<button type="button">삭제</button>');
            delBtn.attr("class", "delete-file-btn");
            fileDiv.append(fileNameSpan);
            fileDiv.append(delBtn);
            fileNamesWrapper.append(fileDiv);
          }
          $('#file-names').html(fileNamesWrapper);
          
        }
      });

      $(document).ready(function() {
          let dropZone = $('#drop-zone');

          dropZone.on('dragover', function(e) {
            e.preventDefault();
            dropZone.addClass('drag-over');
          });

          dropZone.on('dragleave', function(e) {
            e.preventDefault();
            dropZone.removeClass('drag-over');
          });

          dropZone.on('drop', function(e) {
            e.preventDefault();
            dropZone.removeClass('drag-over');
            const files = e.originalEvent.dataTransfer.files;
            
            if (files.length > 0) {
              let fileNamesWrapper = $('<div></div>');
              let formData = new FormData();
              for (let i = 0; i < files.length; i++) {
                  formData.append("askItemFile", files[i]);
                let fileDiv = $('<div></div>');
                let fileNameSpan = $('<span></span>');
                fileNameSpan.text(files[i].name);
                let delBtn = $('<button type="button">삭제</button>');
                delBtn.attr("class", "delete-file-btn");
                fileDiv.append(fileNameSpan);
                fileDiv.append(delBtn);
                fileNamesWrapper.append(fileDiv);
                // 삭제 버튼 클릭 시 해당 파일 삭제
                delBtn.on('click', function() {
                  fileDiv.remove();
                });
              $('#fileUpload')[0].files = files;
                
              }
              $('#file-names').html(fileNamesWrapper);
              console.log(files); 
            }
          });
        });

      $(document).on("click", ".delete-file-btn", function() {
        $(this).parent().remove();
      });
    });
    function submitAskItemForm() {
        const form = $("#askItemFrm")[0]; // form 엘리먼트를 가져옵니다.
        const formData = new FormData(form); // form 데이터를 FormData 객체로 생성합니다.
        
        // 필수 입력 필드 리스트
        const requiredFields = {
            "corpName": "회사명",
            "regNo": "사업자등록번호",
            "repName": "대표자명",
            "corpAddr1": "주소",
            "contName": "담당자명",
            "contPhone": "연락처",
            "askTitle": "글제목"
          };
      
        // 필수 입력 필드 검사
        const emptyFields = Object.entries(requiredFields)
        .filter(([fieldName]) => !formData.get(fieldName))
        .map(([, fieldDisplayName]) => fieldDisplayName);
        if (emptyFields.length > 0) {
            alert(`다음 필수 입력 필드가 비어있습니다: ${emptyFields.join(", ")}`);
            return;
        }
       
        $.ajax({
          url: "/askItem.do", // action 속성값으로 요청을 보낼 URL을 지정합니다.
          method: 'POST', // 요청 방식을 지정합니다.
          data: formData, // 전송할 데이터를 지정합니다.
          processData: false, // 데이터 전송 시 데이터 처리 방식을 지정합니다. 기본값은 true입니다.
          contentType: false, // 데이터 전송 시 컨텐트 타입을 지정합니다. 기본값은 'application/x-www-form-urlencoded; charset=UTF-8'입니다.
          traditional : true,
          success: function(data) {
            console.log(data);
            if(data == "success"){
              $("#alert01").click();
            }else{
              $("#alert02").click();
            }
          },
          error: function() {
            console.error("에러"); // 에러 발생 시 실행할 코드를 작성합니다.
          }
        });
      }
      
$(function () {
  $("#alert01").on("click", function () {
      jQueryAlert('success',"입점문의 작성 완료");
  });
  $("#alert02").on("click", function () {
      jQueryAlert('error',"관리자에게 문의하세요.");
  });
  $("#alert03").on("click", function () {
      jQueryAlert('warning',"경고내용경고내용경고내용경고내용");
  });
  $("#alert04").on("click", function () {
      jQueryAlert('info',"정보내용정보내용정보내용정보내용");
  });

  function jQueryAlert(type, msg) {
      let $type = type;
      let messageBox = msg;
      switch ($type) {
          case 'success':
          messageBox = $.parseHTML('<div class="alert__success"></div>');
          break;
          case 'error':
          messageBox = $.parseHTML('<div class="alert__error"></div>');
          break;
          case 'warning':
          messageBox = $.parseHTML('<div class="alert__warning"></div>');
          break;
          case 'info':
          messageBox = $.parseHTML('<div class="alert__info"></div>');
          break;
      }
      $("body").append(messageBox);
      $(messageBox).dialog({
          dialogClass :$type,
          open: $(messageBox).append(msg),
          draggable: false,
          modal: true,
          buttons: {
              "OK": function () {
                  $(this).dialog("close");
                  location.href = '/main.do';
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

});