$("#noticeContent").summernote({
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
        url: "/uploadImage.do",
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
                  formData.append("noticeFile", files[i]);
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
function submitNoticeForm() {
      const form = $('#writeFrm')[0]; // form 엘리먼트를 가져옵니다.
      const formData = new FormData(form); // form 데이터를 FormData 객체로 생성합니다.
      const requiredFields = {
                "noticeTitle": "글제목"
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
        url: "/noticeWrite.do", // action 속성값으로 요청을 보낼 URL을 지정합니다.
        method: 'POST', // 요청 방식을 지정합니다.
        data: formData, // 전송할 데이터를 지정합니다.
        processData: false, // 데이터 전송 시 데이터 처리 방식을 지정합니다. 기본값은 true입니다.
        contentType: false, // 데이터 전송 시 컨텐트 타입을 지정합니다. 기본값은 'application/x-www-form-urlencoded; charset=UTF-8'입니다.
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
        jQueryAlert('success',"글쓰기 작성 완료");
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
                    location.href = '/noticeList.do?reqPage=1&searchType=0';
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