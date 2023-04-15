<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>
    	<tiles:insertAttribute name="title"/> 
    </title>

    <!-- Favicon  -->
    <link rel="icon" href="${contextPath }/resources/bootstrap/img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="${contextPath }/resources/bootstrap/css/core-style.css">
    <link rel="stylesheet" href="${contextPath }/resources/bootstrap/style.css">
    
    <!-- 옮긴 CSS -->
    <link rel="stylesheet" href="${contextPath }/resources/bootstrap/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath }/resources/bootstrap/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${contextPath }/resources/bootstrap/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="${contextPath }/resources/bootstrap/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath }/resources/bootstrap/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath }/resources/bootstrap/css/style.css" type="text/css">

    <!-- Responsive CSS -->
    <link href="${contextPath }/resources/bootstrap/css/responsive.css" rel="stylesheet">

	<!-- jQuery (Necessary for All JavaScript Plugins) -->
    <script src="${contextPath }/resources/bootstrap/js/jquery/jquery-2.2.4.min.js"></script>
    
    <!-- 우편번호 검색 js -->
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script>
	function execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	            var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	
	            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if (data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if (extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	            if (fullRoadAddr !== ''){
	                fullRoadAddr += extraRoadAddr;
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('postalcode').value = data.zonecode; //5자리 새우편번호 사용
	            document.getElementById('roadAddress').value = fullRoadAddr;
	            document.getElementById('jibunAddress').value = data.jibunAddress;
	
	        }
	    }).open();
	}
</script>
</head>

<body>
    <div class="catagories-side-menu">
        <!-- Close Icon -->
        <div id="sideMenuClose">
            <i class="ti-close"></i>
        </div>
        <!--  Side Nav  -->
        <div class="nav-side-menu">
            <div class="menu-list">
                <h6 style="background-color: rgb(219, 33, 79); color: white;" >상품 빠른이동</h6>
                <ul id="menu-content" class="menu-content collapse out">
                
                    <!-- Single Item -->
                        <ul >
	                        <li><h6>Category</h6></li>
                            <li><a href="${contextPath }/goods/goodsList?sort=all&category=노트북">노트북</a></li>
                            <li><a href="${contextPath }/goods/goodsList?sort=all&category=스마트폰/태블릿">스마트폰 / 태블릿</a></li>
                            <li><a href="${contextPath }/goods/goodsList?sort=all&category=게임기">게임기</a></li>
                            <li><a href="${contextPath }/goods/goodsList?sort=all&category=음향기기">음향기기</a></li>
                            <li><a href="${contextPath }/goods/goodsList?sort=all&category=키보드/마우스">키보드 / 마우스</a></li>
                            <li><a href="${contextPath }/goods/goodsList?sort=all&category=악세사리">악세사리</a></li>
                        </ul>
                
                </ul>
            </div>
        </div>
    </div>

    <div id="wrapper">

        <!-- ****** Header Area Start ****** -->
       	<tiles:insertAttribute name="header" />
        <!-- ****** Header Area End ****** -->

       <tiles:insertAttribute name="body" />

        <!-- ****** Footer Area Start ****** -->
        <tiles:insertAttribute name="footer" />
        <!-- ****** Footer Area End ****** -->
    </div>
    <!-- /.wrapper end -->
    
    <!-- Popper js -->
    <script src="${contextPath }/resources/bootstrap/js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="${contextPath }/resources/bootstrap/js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="${contextPath }/resources/bootstrap/js/plugins.js"></script>
    <!-- Active js -->
    <script src="${contextPath }/resources/bootstrap/js/active.js"></script>

</body>

</html>