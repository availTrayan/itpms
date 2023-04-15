<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리</title>
<script>
	
	function adminGoodsRemove(goodsCd) {
		if (confirm("정말로 삭제하시겠습니까?")) {
			location.href = "${contextPath}/admin/goods/adminGoodsRemove?goodsCd="+goodsCd;
		}
	}
	
	function gerateGoodsExcelExport() {
		location.href = "${contextPath}/admin/goods/goodsExcelExport";
	}

</script>
</head>
<body>
	  <!-- ****** Cart Area Start ****** -->
	      <section class="shop-cart spad">
            <div class="container">
            <div align="center" class="mb-4">
        		<h4><b>등록상품</b></h4>
        	</div>
            <div class="row">	
                <div class="col-lg-12">
	            	<div class="cart__btn update__btn" align="right">
						<a href="javascript:gerateGoodsExcelExport();"><span class="icon_folder_download"></span>엑셀로 출력</a>
					</div>
                    <div class="shop__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th width="10%">상품코드</th>
                                    <th width="70%">상품정보</th>
                                    <th width="10%">등록날짜</th>
                                    <th width="10%">수정/삭제</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:choose>
                            		<c:when test="${empty goodsList}">
                            			<tr>
		                                    <td colspan="4" align="center"><h6>등록된 상품이 없습니다.</h6></td>
		                                </tr>	
                            		</c:when>
                            		<c:otherwise>
		                            	<c:forEach var="goodsDto" items="${goodsList }" varStatus="i">
		                            		 <tr>
		                            		 	<td class="cart__product__item" align="center">
		                            		 		<h6>${goodsDto.goodsCd }</h6>
			                                    </td>
                                    			<td class="cart__product__item">
			                                        <img src="${contextPath }/thumbnails?goodsFileName=${goodsDto.goodsFileName }" width="100" height="100">
			                                        <div class="cart__product__item__title">
			                                            <h6><a href="${contextPath }/goods/goodsDetail?goodsCd=${goodsDto.goodsCd}">${goodsDto.goodsNm }</a></h6>
			                                        	<p>${goodsDto.category} | ${goodsDto.company} | <fmt:formatNumber value="${goodsDto.price }"/>원</p>
			                                        </div>
			                                    </td>
			                                    <td class="cart__total"><fmt:formatDate value="${goodsDto.enrollDt }" pattern="yyyy-MM-dd"/> </td>
			                                	<td class="cart__close">
			                                		<a href="${contextPath }/admin/goods/adminGoodsModify?goodsCd=${goodsDto.goodsCd}"><span class="icon_pencil-edit"></span></a>
			                                		<a href="javascript:adminGoodsRemove(${goodsDto.goodsCd });"><span class="icon_trash_alt"></span></a>
			                                	</td>
			                                </tr>
		                            	</c:forEach>
                            		</c:otherwise>
                            	</c:choose>
                            </tbody>
                        </table>
                    </div>
                    <div class="cart__btn update__btn" align="right">
						<a href="javascript:location.href='${contextPath}/admin/goods/adminGoodsAdd'"><span class="icon_folder_upload"></span>새 상품 등록</a>
					</div>
                </div>
            </div>
        </div>
        </section>
   
        <!-- ****** Cart Area End ****** -->

</body>
</html>