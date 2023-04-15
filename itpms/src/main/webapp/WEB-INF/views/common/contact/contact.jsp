<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 등록</title>

</head>
<body>
	<!-- ****** Checkout Area Start ****** -->
        <div class="checkout_area section_padding_100">
            <div class="container">
                <div class="row">

                    <div class="col-12 col-md-6">
                 		<div class="contact__content">
						<div class="contact__address">
							<h5>고객지원 센터</h5>
							<ul>
								<li>
									<h6>
										<i class="fa fa-map-marker"></i> 주소
									</h6>
									<p>서울특별시 강남구 강남대로94길 13, 삼경빌딩 1층~5층 ITings</p>
								</li>
								<li>
									<h6>
										<i class="fa fa-phone"></i> 전화번호
									</h6>
									<p>
										<span>02-317-3972</span>
									</p>
								</li>
								<li>
									<h6>
										<i class="fa fa-headphones"></i> 고객지원 이메일
									</h6>
									<p>ITings@gmail.com</p>
								</li>
							</ul>
						</div>
						<div class="contact__form">
							<h5>문의 등록</h5>
							<form action="${contextPath }/contact" method="post">
								<input type="text" name="name" 	  placeholder="이름을 입력하세요."> 
								<input type="text" name="email"   placeholder="Email을 입력하세요."> 
								<input type="text" name="subject" placeholder="제목을 입력하세요.">
								<textarea name="content"  placeholder="메세지를 입력하세요." ></textarea>
								<button type="submit" class="btn karl-checkout-btn">문의등록</button>
							</form>
						</div>
					</div>
                    </div>
                    <div class="col-lg-6 col-md-6">

						<!-- 지도 -->
						<div id="daumRoughmapContainer1600749162322"
							class="mymap root_daum_roughmap root_daum_roughmap_landing os_mac"
							style="z-index: 2; width: 450px;">
	
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
								"mapWidth" : "450",
								"mapHeight" : "707"
							}).render();
						</script>
	
					</div>
					</div>


                </div>
            </div>
        </div>
        <!-- ****** Checkout Area End ****** -->
</body>
</html>