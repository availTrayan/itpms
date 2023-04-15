<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- ****** Checkout Area Start ****** -->
        <div class="checkout_area section_padding_100">
            <div class="container">
                <div class="row">

                    <div class="col-12 col-md-6">
                        <div class="checkout_details_area mt-50 clearfix">

                            <div class="cart-page-heading">
                                <h5>관리자 로그인</h5>
                                <p>관리자 전용 로그인입니다.</p>
                            </div>

                            <form action="${contextPath }/admin/member/adminLogin" method="post">
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label for="login">로그인 <span>*</span></label>
                                        <input type="text" class="form-control" name="adminId" >
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="passwd">비밀번호 <span>*</span></label>
                                        <input type="password" class="form-control" name="passwd" >
                                    </div>
                                    <p></p>
                                    <div class="col-md-6 mb-3">
                                       <button type="submit" class="btn karl-checkout-btn">로그인</button>
                                    </div>

                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- ****** Checkout Area End ****** -->
</body>
</html>