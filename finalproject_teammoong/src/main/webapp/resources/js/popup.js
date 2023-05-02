const value = $("#memberId").val();
    $(document).ready(function(){
        showPopupModal();
        
    });
	    // 팝업 모달을 표시하는 함수
	    function showPopupModal() {
	        // 쿠키를 확인하여 팝업 모달을 표시할지 여부를 결정합니다.
	        const popupCookie = getCookie("memberId");
            
	        if (popupCookie === null) {
	        // 쿠키가 없으면 팝업 모달을 표시합니다.
	        $("#popupModal").show();
	        }
	    }

	    // 팝업 모달을 닫는 함수
	    function closePopupModal() {
	        // "다시보지 않기" 체크박스의 상태를 가져옵니다.
            const checkbox = $("#popupModal .checkbox-remember input[type=checkbox]");
	        const isChecked = checkbox.prop("checked");

	        // "다시보지 않기" 체크박스가 체크되어 있으면 쿠키를 설정합니다.
	        if (isChecked) {
	            const expires = new Date();
	            expires.setDate(expires.getDate() + 1); // 쿠키 유효 기간을 하루로 설정합니다.
	            setCookie("memberId", "1", expires);
	        }

	        // 팝업 모달을 닫습니다.
	        $("#popupModal").hide();
	    }

	    // 쿠키를 가져오는 함수
	    function getCookie(memberId) {
	        const value = `; ${document.cookie}`;
	        const parts = value.split(`; ${memberId}=`);
	        if (parts.length === 2) {
	            return parts.pop().split(";").shift();
	        }
	        return null;
	    }
        
        
	    // 쿠키를 설정하는 함수
	    function setCookie(memberId, value, expires) {
	        const cookie = `${memberId}=${value}; expires=${expires.toUTCString()}; path=/`;
	        document.cookie = cookie;
            
	    }
    
