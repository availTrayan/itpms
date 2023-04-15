<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<c:set var="sessionId" value="${sessionScope.memberId }"/>	

<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<script>

	function removeFavor() {
			
		var favorCdList = "";
		if (confirm("찜목록에서 삭제하시겠습니까?")) {
			
			$("input[name='favorCd']:checked").each(function(){
				favorCdList += $(this).val() + ",";
			});
			location.href = "${contextPath}/myPage/removeFavor?favorCdList=" + favorCdList;
		}
		
	}

	function selectAllFavor() {
		if ($("#changeAllChoice").prop("checked")) {
			$("[name='favorCd']").prop("checked" , true);
		}
		else {
			$("[name='favorCd']").prop("checked" , false);
		}
	}	
	

</script>
<title>찜목록</title>
</head>
<body>

	<c:if test="${sessionScope.memberId eq null}">
		<script>
			alert("먼저 로그인해주세요!");
			location.href = "${contextPath}/member/login";
		</script>
	</c:if>

    <!-- Shop Cart Section Begin -->
    <section class="shop-cart spad">
        <div class="container">
         	<div align="center" class="mb-4">
        		<h4><b>찜 목록</b></h4>
        	</div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shop__cart__table">
                    	<h6><input type="checkbox" id="changeAllChoice" onchange="selectAllFavor()"> &nbsp;전체선택</h6>
                    	<br>
                        <table>
                            <thead>
                                <tr>
                                    <th width="3%"></th>
                                    <th>상품명</th>
                                    <th width="13%">상품가격</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:choose>
                            		<c:when test="${empty myFavorList}">
                            			<tr align="center">
                            				<td colspan="5"><h5>찜한 상품이 없습니다.</h5></td>
                            			</tr>
                            		</c:when>
                            		<c:otherwise>
		                            	<c:forEach var="myFavor" items="${myFavorList }">
		                            		 <tr>
		                            		 	<td><input type="checkbox" name="favorCd" value="${myFavor.favorCd }" checked></td>
                                    			<td class="cart__product__item">
			                                        <div class="cart__product__item__title">
			                                        	<img src="${contextPath }/thumbnails?goodsFileName=${myFavor.goodsFileName }" width="50" height="50">
			                                            <h6>
			                                            	<a href="${contextPath }/goods/goodsDetail?goodsCd=${myFavor.goodsCd}">${myFavor.goodsNm }</a>
			                                            	<input type="hidden" id="goodsCd${myFavor.cartCd }" value="${myFavor.goodsCd }"/>
			                                            </h6>
			                                            <p>${myFavor.company }</p>
			                                        </div>
			                                    </td>
			                                    <td class="cart__price">
			                                    	<div class="product__price" >
			                                    		<span style="text-decoration: line-through; color: gray" ><fmt:formatNumber value="${myFavor.price }"/>원</span><br>
				                                    	<fmt:formatNumber value="${myFavor.price -  myFavor.price * (myFavor.discountRate / 100)}"/>
														<input type="hidden" id="price${myFavor.cartCd }" value="${myFavor.price -  myFavor.price * (myFavor.discountRate / 100)}">원			                                    
			                                    	</div>
			                                    </td>
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
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <div class="cart__btn update__btn" align="right">
                        <a href="javascript:removeFavor();"><span class="icon_trash"></span>찜 목록에서 삭제</a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="discount__content">
                    </div>
                </div>
                <div class="col-lg-4 offset-lg-2">
                   
                </div>
            </div>
        </div>
    </section>
    <!-- Shop Cart Section End -->
</body>
</html>