<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="sessionId" value="${sessionScope.memberId }"/>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>

	function processToCart(goodsCd) {
		
		if ("${sessionId == null}" == "true") {
			alert("먼저 로그인해주세요.");
			location.href = "${contextPath }/member/login";
		}
		else {
			
			$.ajax({
				url : "${contextPath }/myPage/addCart",
				method : "get",
				data : {"goodsCd" : goodsCd , "cartGoodsQty" : 1},
				success : function(result) {
					
					if (result == "duple") {
						alert("이미 추가된 품목입니다.");
					}
					else {
						alert("장바구니에 추가되었습니다.");
					}
					
				}
			})
			
		}
		
	}
	
	function processToOrder(goodsCd) {
		
		if ("${sessionId == null}" == "true") {
			alert("먼저 로그인 해주세요.");
			location.href = "${contextPath }/member/login";
		}
		else {
			location.href = "${contextPath }/order/orderGoods?goodsCd="+goodsCd+"&orderGoodsQty=1";	
		}
		
	}
	
	function getGoodsListByPrice(){
		location.href =  "${contextPath }/goods/searchGoods?method=price&min="+$("#minamount").val() + "&max=" + $("#maxamount").val();
	}
	
</script>
<title>상품 리스트</title>
</head>

<body>

    <!-- Shop Section Begin -->
    <section class="shop spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3">
                        <div class="shop_sidebar">
                        <div class="sidebar__categories">
                            <div class="section-title">
                                <h4>카테고리</h4>
                            </div>
                            <div class="categories__accordion">
                                <div class="accordion" id="accordionExample">
                                    <div class="card">
                                        <div class="card-heading active">
                                            <a data-toggle="collapse" data-target="#collapseOne">새 상품</a>
                                        </div>
                                        <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                            <div class="card-body">
                                                <ul>
                                                    <li><a href="${contextPath }/goods/goodsList?sort=new&category=노트북">노트북</a></li>
                                                    <li><a href="${contextPath }/goods/goodsList?sort=new&category=스마트폰/태블릿">스마트폰/태블릿</a></li>
                                                    <li><a href="${contextPath }/goods/goodsList?sort=new&category=게임기">게임기</a></li>
                                                    <li><a href="${contextPath }/goods/goodsList?sort=new&category=키보드/마우스">키보드/마우스</a></li>
                                                    <li><a href="${contextPath }/goods/goodsList?sort=new&category=음향기기">음향기기</a></li>
                                                    <li><a href="${contextPath }/goods/goodsList?sort=new&category=악세사리">악세사리</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-heading">
                                            <a data-toggle="collapse" data-target="#collapseTwo">베스트 상품</a>
                                        </div>
                                        <div id="collapseTwo" class="collapse" data-parent="#accordionExample">
                                            <div class="card-body">
                                                <ul>
                                                    <li><a href="${contextPath }/goods/goodsList?sort=best&category=노트북">노트북</a></li>
                                                    <li><a href="${contextPath }/goods/goodsList?sort=best&category=스마트폰/태블릿">스마트폰/태블릿</a></li>
                                                    <li><a href="${contextPath }/goods/goodsList?sort=best&category=게임기">게임기</a></li>
                                                    <li><a href="${contextPath }/goods/goodsList?sort=best&category=키보드/마우스">키보드/마우스</a></li>
                                                    <li><a href="${contextPath }/goods/goodsList?sort=best&category=음향기기">음향기기</a></li>
                                                    <li><a href="${contextPath }/goods/goodsList?sort=best&category=악세사리">악세사리</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-heading">
                                            <a data-toggle="collapse" data-target="#collapseFour">일반상품</a>
                                        </div>
                                        <div id="collapseFour" class="collapse" data-parent="#accordionExample">
                                            <div class="card-body">
                                                <ul>
                                                    <li><a href="${contextPath }/goods/goodsList?sort=general&category=노트북">노트북</a></li>
                                                    <li><a href="${contextPath }/goods/goodsList?sort=general&category=스마트폰/태블릿">스마트폰 / 태블릿</a></li>
                                                    <li><a href="${contextPath }/goods/goodsList?sort=general&category=게임기">게임기</a></li>
                                                    <li><a href="${contextPath }/goods/goodsList?sort=general&category=키보드/마우스">키보드 / 마우스</a></li>
                                                    <li><a href="${contextPath }/goods/goodsList?sort=general&category=음향기기">음향기기</a></li>
                                                    <li><a href="${contextPath }/goods/goodsList?sort=general&category=악세사리">악세사리</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                         
                        <div class="sidebar__sizes">
                            <div class="section-title">
                                <h4>정렬기준</span></h4>
                            </div>
                            <div class="size__list">
                                <p><a href="${contextPath }/goods/searchGoods?method=keyword&keyword=publishedDt">최신순</a></p>
                                <p><a href="${contextPath }/goods/searchGoods?method=keyword&keyword=highPrice">높은가격순</a></p>
                                <p><a href="${contextPath }/goods/searchGoods?method=keyword&keyword=lowPrice">낮은가격순</a></p>
                                <p><a href="${contextPath }/goods/searchGoods?method=keyword&keyword=discountRate">할인률이 높은순</a></p>
                            </div>
                        </div>
                        <div class="sidebar__color">
                            <div class="section-title">
                                <h4>상품검색</h4>
                            </div>
                            <div class="checkout__form__input">
                            	<form action="${contextPath }/goods/searchGoods" method="get">
	                            	<input type="text" name="word">
	                            	<input type="hidden" name="method" value="search">
	                            	<input type="submit" value="검색">
	                            	<span class="icon_search"></span>
                            	</form>
							</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-9">
                    <div class="row">
                    	<c:choose>
                    		<c:when test="${empty goodsList}">
	                            <div class="product__item">
	                    			<h3>등록된 상품이 없습니다.</h3>
	                            </div>
                    		</c:when>
                    		<c:otherwise>
		                    	<c:forEach var="goodsDto" items="${goodsList }">
			                        <div class="col-lg-4 col-md-6">
			                            <div class="product__item">
			                                <div class="product__item__pic set-bg">
			                                <img src="${contextPath }/thumbnails?goodsFileName=${goodsDto.goodsFileName}">
			                                    <c:choose>
			                                    	<c:when test="${goodsDto.sort eq 'new' }"> <div class="label new">신상품</div></c:when>
			                                    	<c:when test="${goodsDto.sort eq 'best' }">  <div class="label sale">베스트</div></c:when>
			                                    	<c:when test="${goodsDto.sort eq 'general' }"> <div class="label stockout stockblue">일반</div></c:when>
			                                    </c:choose>
			                                    <ul class="product__hover">
			                                        <li><a href="${contextPath }/thumbnails?goodsFileName=${goodsDto.goodsFileName}" class="image-popup"><span class="arrow_expand"></span></a></li>
			                                        <li><a href="javascript:processToCart(${goodsDto.goodsCd})"><span class="icon_cart_alt"></span></a></li>
			                                        <li><a href="javascript:processToOrder(${goodsDto.goodsCd})"><span class="icon_bag_alt"></span></a></li>
			                                    </ul>
			                                </div>
			                                <div class="product__item__text">
			                                    <h6>
			                                    	<a href="${contextPath }/goods/goodsDetail?goodsCd=${goodsDto.goodsCd}">${goodsDto.goodsNm }<br>
				                                    ${goodsDto.category } | ${goodsDto.company }
			                                    	</a>
			                                    </h6>
			                                    <div class="product__price" style="text-decoration: line-through; color: gray"><fmt:formatNumber value="${goodsDto.price }"/>원 (${goodsDto.discountRate}%)</div>
			                                    <div class="product__price"><fmt:formatNumber value="${goodsDto.price - goodsDto.price * goodsDto.discountRate / 100 }"/>원</div>
			                                </div>
			                            </div>
			                        </div>
		                    	</c:forEach>
                    		</c:otherwise>
                    	</c:choose>
                    </div>
                
                </div>
            </div>
        </div>
    </section>
    <!-- Shop Section End -->
</body>
</html>