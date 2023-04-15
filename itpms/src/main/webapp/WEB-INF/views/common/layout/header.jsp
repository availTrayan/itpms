<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- ****** Header Area Start ****** -->
        <header class="header_area">
            <!-- Top Header Area Start -->
            <div class="top_header_area">
                <div class="container h-100">
                    <div class="row h-100 align-items-center justify-content-end">

                        <div class="col-12 col-lg-7">
                            <div class="top_single_area d-flex align-items-center">
                                <!-- Logo Area -->
                                <div class="top_logo">
                                    <a href="${contextPath}/"><img src="${contextPath }/resources/bootstrap/img/core-img/logo.png" height="100" width="200"></a>
                                </div>
                                <!-- Cart & Menu Area -->
                                <div class="header-cart-menu d-flex align-items-center ml-auto">
                                    <!-- Cart Area -->
                                    <div class="cart">
                                        <a href="${contextPath}/myPage/myCartList" id="header-cart-btn" >
                                       		<c:choose>
	                                       		<c:when test="${sessionScope.memberId eq null }">
	                                       			<span class="cart_quantity">0</span>
	                                       		 </c:when>
	                                      		 <c:otherwise>
	                                        		<span class="cart_quantity">${sessionScope.myCartCnt}</span> 
	                                       		</c:otherwise>
                                       		</c:choose>
                                        <i class="ti-bag"></i> 장바구니</a>
                                       
                                    </div>
                                    <div class="header-right-side-menu ml-15">
                                        <a href="#" id="sideMenuBtn"><i class="ti-menu" aria-hidden="true"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <!-- Top Header Area End -->
            <div class="main_header_area">
                <div class="container h-100">
                    <div class="row h-100">
                        <div class="col-12 d-md-flex justify-content-between">
                            <!-- Header Social Area -->
                            <div class="header-social-area">
                                <a href="#"><span class="karl-level">Share</span> <i class="fa fa-pinterest" aria-hidden="true"></i></a>
                                <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                                <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                                <a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
                            </div>
                            <!-- Menu Area -->
                            <div class="main-menu-area">
                                <nav class="navbar navbar-expand-lg align-items-start">

                                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#karl-navbar" aria-controls="karl-navbar" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"><i class="ti-menu"></i></span></button>

                                    <div class="collapse navbar-collapse align-items-start collapse" id="karl-navbar">
                                        <ul class="navbar-nav animated" id="nav">
                                        	<c:choose>
                                        		<c:when test="${sessionScope.memberId eq null }">
		                                            <li class="nav-item active"><a class="nav-link" href="${contextPath }/member/login">로그인</a></li>
                                        		</c:when>
                                        		<c:otherwise>
                                        			<li class="nav-item active"><a class="nav-link" href="${contextPath }/member/logout">로그아웃</a></li>
                                        		</c:otherwise>
                                        	</c:choose>
                                            <li class="nav-item"><a class="nav-link" href="${contextPath }/member/register">회원가입</a></li>
                                             <c:choose>
												<c:when test="${sessionScope.role eq 'admin' }">
													<li class="nav-item dropdown">
		                                                <a class="nav-link dropdown-toggle" href="#" id="karlDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">관리페이지</a>
		                                                <div class="dropdown-menu" aria-labelledby="karlDropdown">
		                                                    <a class="dropdown-item" href="${contextPath }/admin/member/adminMemberList">회원관리</a>
		                                                    <a class="dropdown-item" href="${contextPath }/admin/goods/adminGoodsList">상품관리</a>
		                                                    <a class="dropdown-item" href="${contextPath }/admin/order/adminOrderList">주문관리</a>
		                                                    <a class="dropdown-item" href="${contextPath }/contactList">문의관리</a>
		                                                    <a class="dropdown-item" href="${contextPath }/noticeList">공지관리</a>
		                                                </div>
		                                            </li>
												</c:when>
												<c:otherwise>
													   <li class="nav-item dropdown">
		                                                <a class="nav-link dropdown-toggle" href="#" id="karlDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">마이페이지</a>
		                                                <div class="dropdown-menu" aria-labelledby="karlDropdown">
		                                                    <a class="dropdown-item" href="${contextPath}/myPage/myInfo?memberId=${sessionScope.memberId}">가입정보</a>
		                                                    <a class="dropdown-item" href="${contextPath}/myPage/myOrderList">주문정보</a>
		                                                    <a class="dropdown-item" href="${contextPath}/myPage/myFavorList">찜목록</a>
		                                                    <a class="dropdown-item" href="${contextPath}/myPage/myCartList">장바구니</a>
		                                                </div>
		                                            </li>
												</c:otherwise>
											</c:choose>
                                            <li class="nav-item"><a class="nav-link" href="${contextPath }/noticeList">공지사항</a></li>
                                            <li class="nav-item"><a class="nav-link" href="${contextPath}/contact">문의하기</a></li>
                                        </ul>
                                    </div>
                                </nav>
                            </div>
                            <!-- Help Line -->
                            <div class="help-line">
                                <a href="tel:+82023173972"><i class="ti-headphone-alt">&nbsp;</i>고객센터 031 317 3972</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- ****** Header Area End ****** -->

</body>
</html>