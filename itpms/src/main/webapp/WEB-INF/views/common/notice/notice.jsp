<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 등록</title>

</head>
<body>
	<!-- ****** Checkout Area Start ****** -->
        <div class="checkout_area section_padding_100">
            <div class="container">
                <div class="row">

                    <div class="col-12 col-md-6">
                 		<div class="contact__content">
						<div class="contact__form">
							<h5>공지 등록</h5>
							<form action="${contextPath }/notice" method="post">
								<input type="text" name="subject" placeholder="제목을 입력하세요.">
								<textarea name="content"  placeholder="내용을 입력하세요." ></textarea>
								<button type="submit" class="btn karl-checkout-btn">공지등록</button>
							</form>
						</div>
					</div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ****** Checkout Area End ****** -->
</body>
</html>