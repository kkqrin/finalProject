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

//알림 관련 기능
$(function () {
    $("#alert01").on("click", function () {
        jQueryAlert('success',"성공내용성공내용성공내용");
    });
    $("#alert02").on("click", function () {
        jQueryAlert('error',"에러내용에러내용에러내용에러내용");
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