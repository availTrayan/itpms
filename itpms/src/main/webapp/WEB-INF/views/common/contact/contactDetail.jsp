<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 내용</title>

</head>
<body>
	<!-- ****** Checkout Area Start ****** -->
        <div class="checkout_area section_padding_100">
            <div class="container">
               <form class="checkout__form">
            
                <div class="row">

                    <div class="col-lg-12">
                 		<br><br><br>
                        <h5>문의 정보</h5>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <div class="checkout__form__input">
                                    <p>문의자 성함 </p>
                                    <input type="text" value="${contactDto.name }" disabled>
                                </div>
                            </div>
                           <div class="col-lg-12 col-md-12 col-sm-12">
                                <div class="checkout__form__input">
                                    <p>문의자 이메일 </p>
                                    <input type="text"value="${contactDto.email }" disabled>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <div class="checkout__form__input">
                                    <p>문의 제목 </p>
                                    <input type="text" value="${contactDto.subject }" disabled>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <div class="checkout__form__input">
                                    <p>문의 내용 </p>
                                    <textarea cols="150" rows="10" disabled>${contactDto.content }</textarea>
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