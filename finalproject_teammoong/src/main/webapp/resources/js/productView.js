$(document).ready(function() {

    var joinCount = $(".joinCount");
    for(var i=0; i<joinCount.length; i++){
        var joinCountVal = Number(joinCount.eq(i).val());
        if(joinCountVal == 0){
            joinCount.eq(i).parent().parent().hide();
        }
        
    }
    var totalCount = $(".totalCount");
    for(var i=0; i<totalCount.length; i++){
        var totalCountVal = Number(totalCount.eq(i).val())
        var joinCountVal = Number(joinCount.eq(i).val());
        if(joinCountVal == totalCountVal){
            joinCount.eq(i).parent().parent().hide();
        }
    }


    // td 요소를 클릭할 때
    $("td").on("click", function() {
      // 클릭된 td 요소의 자식 요소인 input[type=radio] 요소의 체크를 토글합니다.
      var radio = $(this).find("input[type=radio]");
      radio.prop("checked", !radio.prop("checked"));
      // 다른 td 요소의 input[type=radio] 요소의 체크를 해제하고 배경색을 초기화합니다.
      $("td")
        .not(this)
        .find("input[type=radio]")
        .prop("checked", false)
        .closest("td")
        .css("background-color", "");
      // 현재 클릭된 td 요소의 배경색을 검은색으로 변경하거나 원래대로 되돌립니다.
      $(this).css("background-color", radio.prop("checked") ? "#f88000" : "");
    });
  });
        ///////////////////////////////////////////////////////////////////////////////////////////
        $("#orderBtn").on("click",function(){
      // 현재 시간 가져오기
      var currentTime = new Date();
      // 12시간 후 시간 계산
      var endTime = new Date(currentTime.getTime() + 12 * 60 * 60 * 1000);
      
      // 타이머 업데이트 함수
      function updateTimer() {
        var now = new Date();
        var diff = endTime - now; // 남은 시간 계산
        var hours = Math.floor(diff / (60 * 60 * 1000)); // 시간
        var minutes = Math.floor((diff % (60 * 60 * 1000)) / (60 * 1000)); // 분
        var seconds = Math.floor((diff % (60 * 1000)) / 1000); // 초
        
        // 타이머 텍스트 업데이트
        $('#timer').text((hours < 10 ? '0' : '') + hours + ':' +
                        (minutes < 10 ? '0' : '') + minutes + ':' +
                        (seconds < 10 ? '0' : '') + seconds);
                        
        // 타이머가 종료되면 타이머 정지
        if (diff <= 0) {
          clearInterval(timerInterval);
          $('#timer').text('00:00:00');
        }
      }
      
      // 1초마다 타이머 업데이트
      var timerInterval = setInterval(updateTimer, 1000);
    });
    



        ///////////////////////////////////////////////////////////////////////////////////////////
        $(".gonggu-window").hide();
        $(".gonggu-buy-btn").on("click",function(){
            if($(".gonggu-window").css("display") == "none"){
                $(".gonggu-window").show();
            } else {
                $(".gonggu-window").hide();
            }
            // $.ajax({
            //     url : "/selectOptionGroup.do",
            //     type : "POST",
            //     dataType : "JSON",
            //     data : {productNo : $("#productNo").val()},
            //     success : function(data){
            //         console.log(data);
            //     }
            // });
        });
        $(".window-close-btn").on("click",function(){
            $(".gonggu-window").hide();
        });

        ////////////////////////////////////////////////////////////////////////////////////////////////////////////
        window.onload = function(){
            // 찜하기 DB조회후 로그인한 회원과 같으면 색칠해주는 ajax
            if($("#loginMember").val() != ''){
                $.ajax({
                    url : "/selectProductLike.do",
                    type : "POST",
                    dataType : "JSON",
                    data : {memberNo : $("#loginMember").val(), productNo : $("#productNo").val()},
                    success : function(data){
                        if(data.memberNo == $("#loginMember").val()){
                            $("[name=like]").empty();
                            $("[name=like]").append("<span class='material-symbols-outlined test'>favorite</span>")
                        // } else  {
                        //     $("[name=like]").empty();
                        //     $("[name=like]").append("<span class='material-symbols-outlined'>favorite</span>")
                        }
                    },
                    error : function(){
                        $("[name=like]").empty();
                        $("[name=like]").append("<span class='material-symbols-outlined'>favorite</span>")
                    }
                });
                }
            }
        // 찜하기 버튼 색칠하기
        $("[name=like]").children().on("click",function(){ /*like click event*/
            $(this).children().toggleClass("test");
        })
        // 찜하기 삭제
            $("[name=like]").on("click",function(){ /*like delete*/
            $.ajax({
                url : "/deleteLike.do",
                type : "POST",
		    	dataType : "JSON",
                data : {productNo : $("#productNo").val(), memberNo : $("#loginMember").val()},
                success : function(data){
                    $("[name=like]").empty();
                    $("[name=like]").append("<span class='material-symbols-outlined'>favorite</span>")
                }
            });
        });
        // 찜하기 insert
            $("[name=like]").on("click",function(){ /*like insert*/
            $.ajax({
                url : "/productLike.do",
                type : "POST",
		    	dataType : "JSON",
                data : {productNo : $("#productNo").val(), memberNo : $("#loginMember").val()},
                success : function(data){
                    console.log(data);
                }
            });
        });

        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        let productPrice = $("#productPrice").val();
        let productDiscount = $("#productDiscount").val();
        // 금액 3자리마다 , 찍는 함수
        $(function(){
            let result = productPrice * (100-productDiscount)/1000;
            var num = 0;
            num = result;
            var DiscountPrice = Math.floor(result);
            var price = DiscountPrice*10;
            price = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            $(".product-price").text(price);
        })

        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        // 슬릭슬라이드
        $(function(){
            $('.img-box').slick();
        });
        $(".scroll-top").on("click",function(){
            var offset = $("body").offset();
            $("html, body").animate({scrollTop: offset.top},400);
        });

        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


        // 퀵스크롤 버튼 시작
        $(document).ready(function(){
            $('.product-info-btn').click(function(){
                var offset = $('.product-info-box').offset(); //선택한 태그의 위치를 반환
                    //animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 
                    $("html, body").animate({scrollTop: offset.top},400); // 선택한 위치로 이동. 두번째 인자는 0.4초를 의미한다.
            });
        });
        $(document).ready(function(){
            $('.product-view-btn').click(function(){
                var offset = $('.product-info-view').offset(); //선택한 태그의 위치를 반환
                    //animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 
                    $("html, body").animate({scrollTop: offset.top},400); // 선택한 위치로 이동. 두번째 인자는 0.4초를 의미한다.
            });
        });
        $(document).ready(function(){
            $('.product-review-btn').click(function(){
                var offset = $('.product-review').offset(); //선택한 태그의 위치를 반환
                    //animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 
                    $("html, body").animate({scrollTop: offset.top},400); // 선택한 위치로 이동. 두번째 인자는 0.4초를 의미한다.
            });
        });
        $(document).ready(function(){
            $('.product-inquiry-btn').click(function(){
                var offset = $('.product-inquiry').offset(); //선택한 태그의 위치를 반환
                    //animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 
                    $("html, body").animate({scrollTop: offset.top},400); // 선택한 위치로 이동. 두번째 인자는 0.4초를 의미한다.
            });
        });
        //퀵스크롤 버튼 끝


        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


        //문의사항 update에 필요한 값을 게시글 첫번째 수정 버튼 눌렀을때 필요한 값을 추출하기
        $(".updateBtn").on("click",function(){
            var inquiryContent = $(this).parent().parent().parent().prev().children().text();
            var testNumber = $(this).prev().val();
            console.log(testNumber);
            $("[name=inquiryContent]").val(inquiryContent);
            $(".testNumber").val(testNumber);
            console.log($(".testNumber").val());
        })
        //모달 띄우는 함수
        $(function () {
            $('.btn-flex-wrap').children().click(function (event) {
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
            //모달 닫기
            $('#insertInquiry').click(function (event) {
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
        //문의사항 클릭한 게시글 내용 보여주는 버튼(toggle) / 관리자 답변 select
        $(".inquiry-content").hide();
        $(".udBtn").hide();
        let chkcnt = 0;
        $(".inquiry-content-btn").on("click",function(){
            $(this).parent().next().next().children().remove();
            $(this).parent().next().toggle();
            $(this).parent().next().next().next().toggle();
            var inquiryNo = $(this).prev().val();
            if(chkcnt == 0){
                $.ajax({
                    url : "/selectAdminInquiry.do",
                    type : "POST",
                    dataType : "JSON",
                    data : {inquiryNo : inquiryNo},
                    context: this,
                    success : function(data){
                        $(this).parent().next().next().append("<td colspan='4' style='text-align : left;'>"+data.iqAdminContent+"</td>");
                        chkcnt = 1;
                    }
                });
            }else if(chkcnt == 1){
                $(this).parent().next().next().children().remove();
                chkcnt = 0;
            }
        });
        //문의사항 작성
        $("#modalInsertBtn").on("click",function(){
            var inquiryTitle = $("[name=inquiryTitle]").val();
            var inquiryContent = $("[name=inquiryContent1]").val();
            var inquiryWriter = $("#loginMemberId").val();
            var productNo = $("#productNo").val();
            $.ajax({
                url : "/insertInquiry.do",
                type : "POST",
                dataType : "JSON",
                data : {inquiryTitle:inquiryTitle, inquiryContent:inquiryContent, inquiryWriter:inquiryWriter, productNo:productNo},
                success : function(data){
                    if(data == 1){
                        $("#modalBasic2").hide();
                            insertAlert();
                    }
                }
            });
        });
        //문의사항 삭제
        $(".deleteButton").on("click",function(){
            var inquiryNo = $(this).parent().parent().parent().prev().children().next().children().next().children().children().next().children().val();
            console.log(inquiryNo);
        });
        //문의사항 수정
        $(".updateDoneBtn").on("click",function(){
            var inquiryContent = $("[name=inquiryContent]").val();
            var inquiryNo = $(".testNumber").val();
            console.log(inquiryNo);
            
            $.ajax({
                url : "/updateInquiry.do",
                type : "POST",
                dataType : "JSON",
                data : {inquiryContent : inquiryContent, inquiryNo : inquiryNo },
                success : function(data){
                    if(data == 1){
                        $("#modalBasic").hide();
                        jalertshow();
                    } else {
                        console.log("문의사항 작성 실패");
                    }
                }
            });
        });
        //문의사항 답글 모달 값 띄우기
        $(".adminModal").on("click",function(){
            var inquiryContent = $(this).parent().parent().parent().prev().prev().children().text();
            var inquiryWriter = $(this).parent().parent().parent().prev().prev().children().attr("value");
            var inquiryNo = $(this).prev().val();
            $(".adminInquiryNo").val(inquiryNo);
            $("[name=userContent]").text(inquiryContent);
            $(".userId").text(inquiryWriter);

        });
        //문의사항 답글 달기
        $(".adminInsert").on("click",function(){
            var iqAdminContent = $("[name=adminContent]").val();
            var inquiryNo = $(".adminInquiryNo").val();
            $.ajax({
                url : "/adminInsert.do",
                type : "POST",
                dataType : "JSON",
                data : {inquiryNo:inquiryNo, iqAdminContent:iqAdminContent},
                success : function(data){
                    if(data == 1){
                        $("#adminModal").hide();
                        adminInsertAlert();
                    }
                }
            });
        });
        //답글 select
        // $(".inquiry-content-btn").on("click",)
         //문의사항 답글 성공시 띄울 alert창
         function adminInsertAlert(){
                jQueryAlert('success',"문의사항 답글 작성 완료.");

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
                             location.reload()
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
        }
         //문의사항 작성 성공시 띄울 alert창
         function insertAlert(){
                jQueryAlert('success',"문의사항이 작성되었습니다.");

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
                             location.reload()
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
        }
        //문의사항 수정 성공시 띄울 alert창
            function jalertshow(){
                jQueryAlert('success',"문의사항이 수정되었습니다.");

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
                            location.reload();
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
        }
        /////////////////////////////////////////////////////////////////////////////////////////////
        //리뷰관련

        function readURL(input) {
            if (input.files && input.files[0]) {
              var reader = new FileReader();
              reader.onload = function(e) {
                document.getElementById('preview').src = e.target.result;
              };
              reader.readAsDataURL(input.files[0]);
            } else {
              document.getElementById('preview').src = "";
            }
          }

        //   $(".updateReviewBtn").on("click",function(){
        //     var reviewContent = $(this).parent().parent().prev().text();
        //     console.log(reviewContent);
        //     $("[name=updateReviewContent]").text(reviewContent);
        //   });








        /////////////////////////////////////////////////////////////////////////////////////////////
        function DropFile(dropAreaId, fileListId) {
            let dropArea = document.getElementById(dropAreaId);
            let fileList = document.getElementById(fileListId);
          
            function preventDefaults(e) {
              e.preventDefault();
              e.stopPropagation();
            }
          
            function highlight(e) {
              preventDefaults(e);
              dropArea.classList.add("highlight");
            }
          
            function unhighlight(e) {
              preventDefaults(e);
              dropArea.classList.remove("highlight");
            }
          
            function handleDrop(e) {
              unhighlight(e);
              let dt = e.dataTransfer;
              let files = dt.files;
          
              handleFiles(files);
          
              const fileList = document.getElementById(fileListId);
              if (fileList) {
                fileList.scrollTo({ top: fileList.scrollHeight });
              }
            }
          
            function handleFiles(files) {
              files = [...files];
              // files.forEach(uploadFile);
              files.forEach(previewFile);
            }
          
            function previewFile(file) {
              console.log(file);
              renderFile(file);
            }
          
            function renderFile(file) {
              let reader = new FileReader();
              reader.readAsDataURL(file);
              reader.onloadend = function () {
                let img = dropArea.getElementsByClassName("preview")[0];
                img.src = reader.result;
                img.style.display = "block";
              };
            }
          
            dropArea.addEventListener("dragenter", highlight, false);
            dropArea.addEventListener("dragover", highlight, false);
            dropArea.addEventListener("dragleave", unhighlight, false);
            dropArea.addEventListener("drop", handleDrop, false);
          
            return {
              handleFiles
            };
          }
          
          const dropFile = new DropFile("drop-file", "files");   
          
          
