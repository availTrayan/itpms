<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오시는 길</title>

</head>
<body>
	<!-- ****** Checkout Area Start ****** -->
        <div class="checkout_area section_padding_100">
            <div class="container">
                <div class="row">
                    <div class="col-12 col-md-6">
                        <div class="contact__content">
						<div class="contact__address">
							<h5>회사 위치안내</h5>
							<ul>
								<li>
						            <p>주소</p>
						            <p>서울특별시 강남구 강남대로94길 13, 삼경빌딩 1층~5층</p>
								</li>
			                    <li>
						            <p>대표전화</p>
						            <span>02-317-3972</span>
			                    </li>
			                    <li>
						            <p>지하철 이용시</p>
						            <span>[2호선] 강남역 11번출구,12번출구 2분거리</span>
			                    </li>
							</ul>
	                    </div>
    					</div>
	                    <div class="col-5 md-5" align="left">
		                    <img src="${contextPath }/resources/bootstrap/img/core-img/logo.png">
	                    </div>
  					</div>
                    <div class="col-lg-6col-md-6">

						<!-- 지도 -->
						<div id="daumRoughmapContainer1600749162322"
							class="mymap root_daum_roughmap root_daum_roughmap_landing os_mac"
							style="z-index: 2; width: 250px;">
	
						<script charset="UTF-8" class="daum_roughmap_loader_script"
							src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
						<script charset="UTF-8"
							src="http://t1.daumcdn.net/kakaomapweb/place/jscss/roughmap/b88f2e2f/roughmapLander.js"></script>
						<script charset="UTF-8"
							src="http://t1.daumcdn.net/kakaomapweb/place/jscss/roughmap/b88f2e2f/roughmapLander.js"></script>
						<!-- 3. 실행 스크립트 -->
						<script charset="UTF-8">
							new daum.roughmap.Lander({
								"timestamp" : "1600749162322",
								"key" : "226ga",
								"mapWidth" : "550",
								"mapHeight" : "500"
							}).render();
						</script>
	
					</div>
					</div>
					<div>
						
					</div>
                </div>
            </div>
        </div>
        <!-- ****** Checkout Area End ****** -->
</body>
</html>