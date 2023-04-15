<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 로그인</title>
<style>
	#aaa {
		-webkit-transition: all 500ms ease 0s;
		    transition: all 500ms ease 0s;
		    text-decoration: none;
		    outline: none;
		    color: #007bff;
		    font-family: 'Open Sans', sans-serif;
		    font-weight: 400;
		    text-decoration : underline;
	}
</style>
</head>
<body>

<!-- ****** Checkout Area Start ****** -->
        <div class="checkout_area section_padding_100">
            <div class="container">
                <div class="row">

                    <div class="col-12 col-md-6">
                        <div class="checkout_details_area mt-50 clearfix">

                            <div class="cart-page-heading">
                                <h5>회원 로그인</h5>
                                <a id="aaa" href="${contextPath }/member/register">회원가입은 여기를 눌러주세요.</a>
                            </div>

                            <form action="${contextPath }/member/login" method="post">
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label for="login">로그인 <span>*</span></label>
                                        <input type="text" class="form-control" name="memberId" >
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