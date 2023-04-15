<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 목록</title>
</head>
<body>

	<c:if test="${sessionScope.memberId eq null}">
		<script>
			alert("먼저 로그인해주세요.");
			location.href = "${contextPath}/member/login";
		</script>
	</c:if>
	
	<section class="shop-cart spad">
        <div class="container">
        	<div align="center" class="mb-4">
        		<h4><b>주문 내역</b></h4>
        	</div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shop__cart__table">
                    	<br>
                        <table>
                            <thead>
                                <tr>
                                    <th>상품명</th>
                                    <th>상품가격</th>
                                    <th>주문날짜</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:choose>
                            		<c:when test="${empty myOrderList}">
                            			<tr align="center">
                            				<td colspan="5"><h5>조회된 상품이 없습니다.</h5></td>
                            			</tr>
                            		</c:when>
                            		<c:otherwise>
		                            	<c:forEach var="myOrder" items="${myOrderList }">
		                            		 <tr>
                                    			<td class="cart__product__item">
                                    				<img src="${contextPath }/thumbnails?goodsFileName=${myOrder.goodsFileName }" width="50" height="50">
			                                        <div class="cart__product__item__title">
			                                            <h6><a href="${contextPath }/myPage/myOrderDetail?orderCd=${myOrder.orderCd}&memberId=${myOrder.memberId}">${myOrder.goodsNm } | ${myOrder.orderGoodsQty }개</a></h6>
			                                         </div>
	                                          	</td>
			                                    <td class="cart__price"><fmt:formatNumber value="${myOrder.price }"/>원</td>
			                                    <td class="cart__total"><fmt:formatDate value="${myOrder.payOrderTime }" pattern="yyyy-MM-dd"/> </td>
			                                     </tr>      
			                                       
			                                    </c:forEach>
                            		</c:otherwise>
                            	</c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
      
        </div>
    </section>
</body>
</html>