<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<script>
	function gerateMemberExcelExport() {
		location.href = "${contextPath}/admin/member/memberExcelExport";
	}
</script>
</head>
<body>
	  <!-- ****** Cart Area Start ****** -->
    <section class="shop-cart spad">
            <div class="container">
            <div align="center" class="mb-4">
        		<h4><b>회원 목록</b></h4>
        	</div>
                <div class="row">
                    <div class="col-lg-12">
                	<div class="cart__btn update__btn" align="right">
						<a href="javascript:gerateMemberExcelExport();"><span class="icon_folder_download"></span>엑셀로 출력</a>
					</div>
                    <div class="shop__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th width="10%">가입번호</th>
                                    <th width="30%">회원아이디</th>
                                    <th width="25%">회원이름</th>
                                    <th width="15%">포인트</th>
                                    <th width="5%">성별</th>
                                    <th width="15%">가입일자</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:choose>
                            		<c:when test="${empty memberList}">
                            			<tr>
                            				<td colspan="6"><h3>가입된 회원이 없습니다.</h3></td>
                            			</tr>
                            		</c:when>
                            		<c:otherwise>
		                            	<c:forEach var="memberDto" items="${memberList }" varStatus="i">
		                            		 <tr>
		                            		 	<td>
		                            		 		<h6>${i.count }</h6>
			                                    </td>
                                    			<td class="cart__product__item">
			                                        <h6><a href="${contextPath }/myPage/myInfo?memberId=${memberDto.memberId}">${memberDto.memberId} </a></h6>
			                                    </td>
			                                	<td class="cart__product__item__title"><strong>${memberDto.memberNm }</strong></td>
			                                	<td class="cart__total"><fmt:formatNumber value="${memberDto.point }"/> P</td>
			                                    <td>${memberDto.sex }</td>
			                                    <td><fmt:formatDate value="${memberDto.joinDt }" pattern="yyyy-MM-dd"/> </td>
			                                </tr>
		                            	</c:forEach>
                            		</c:otherwise>
                            	</c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>
                </div>

                <div class="row">
                    <div class="col-12 col-md-6 col-lg-4">
                        <div class="coupon-code-area mt-70">
                            <div class="cart-page-heading">
                               
                            </div>
                            <form action="#">
                                
                            </form>
                        </div>
                    </div>
                    <div class="col-12 col-md-6 col-lg-4">
                        <div class="shipping-method-area mt-70">
                            <div class="cart-page-heading">
                              
                            </div>

                        </div>
                    </div>
                  
                </div>
            </div>
        </section>
        <!-- ****** Cart Area End ****** -->
</body>
</html>