<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 내용</title>

</head>
<body>
	<!-- ****** Checkout Area Start ****** -->
        <div class="checkout_area section_padding_100">
            <div class="container">
               <form class="checkout__form">
            
                <div class="row">

                    <div class="col-lg-12">
                 		<br><br><br>
                        <h5>공지번호 : ${noticeDto.noticeCd }</h5>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <div class="checkout__form__input">
                                    <p>등록자 </p>
                                    <input type="text" value="관리자" disabled>
                                </div>
                            </div>
                           <div class="col-lg-12 col-md-12 col-sm-12">
                                <div class="checkout__form__input">
                                    <p>문의 이메일 </p>
                                    <input type="text" value="Itings@gmail.com" disabled>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <div class="checkout__form__input">
                                    <p>공지 제목 </p>
                                    <input type="text" value="${noticeDto.subject }" disabled>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <div class="checkout__form__input">
                                    <p>공지 내용 </p>
                                    <textarea cols="150" rows="10" disabled>${noticeDto.content }</textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
				
					</div>


                </div>
                </form>
            </div>
        </div>
        <!-- ****** Checkout Area End ****** -->
</body>
</html>