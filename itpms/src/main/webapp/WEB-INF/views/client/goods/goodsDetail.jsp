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
				data : {"goodsCd" : goodsCd , "cartGoodsQty" : $("#orderGoodsQty").val()},
				success : function(result) {
					
					if (result == "duple") {
						alert("이미 장바구니에 추가된 품목입니다.");
					}
					else {
						alert("장바구니에 추가되었습니다.");
					}
					
				}
			})
			
		}
	}
	
	function processToFavor(goodsCd) {
		
		if ("${sessionId == null}" == "true") {
			alert("먼저 로그인해주세요.");
			location.href = "${contextPath }/member/login";
		}
		else {
			
			$.ajax({
				url : "${contextPath }/myPage/addFavor",
				method : "get",
				data : {"goodsCd" : goodsCd },
				success : function(result) {
					
					if (result == "duple") {
						alert("이미 찜목록에 추가된 품목입니다.");
					}
					else {
						alert("찜목록에 추가되었습니다.");
					}
					
				}
			})
			
		}
	}
	
	function processToOrder(goodsCd) {
		
		if ("${sessionId == null}" == "true") {
			alert("로그인을 진행해주세요.");
			location.href = "${contextPath }/member/login";
		}
		else {
			location.href = "${contextPath }/order/orderGoods?goodsCd="+goodsCd+"&orderGoodsQty=" + $("#orderGoodsQty").val();	
		}
		
	}
	
	
</script>
<title>Insert title here</title>
</head>
<body>

        <!-- <<<<<<<<<<<<<<<<<<<< Breadcumb Area Start <<<<<<<<<<<<<<<<<<<< -->
        <div class="breadcumb_area">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <ol class="breadcrumb d-flex align-items-center">
                            <li class="breadcrumb-item"><a href="${contextPath }/goods/goodsDetail?goodsCd=${goodsDto.goodsCd}">${goodsDto.goodsNm }</a></li>
                            <li class="breadcrumb-item"><a href="${contextPath }/goods/goodsDetail?goodsCd=${goodsDto.goodsCd}">${goodsDto.category }</a></li>
                            <li class="breadcrumb-item"><a href="${contextPath }/goods/goodsDetail?goodsCd=${goodsDto.goodsCd}">${goodsDto.company }</a></li>
                            
                        </ol>
                        <!-- btn -->
                        <a href="${contextPath }/goods/goodsList?sort=all&category=all" class="backToHome d-block"><i class="fa fa-angle-double-left"></i> Back to Category</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- <<<<<<<<<<<<<<<<<<<< Breadcumb Area End <<<<<<<<<<<<<<<<<<<< -->

        <!-- <<<<<<<<<<<<<<<<<<<< Single Product Details Area Start >>>>>>>>>>>>>>>>>>>>>>>>> -->
        <section class="single_product_details_area section_padding_0_100">
            <div class="container">
                <div class="row">

                    <div class="col-12 col-md-6">
                        <div class="single_product_thumb">
                            <div id="product_details_slider" class="carousel slide" data-ride="carousel">

                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <a class="gallery_img" href="${contextPath }/thumbnails?goodsFileName=${goodsDto.goodsFileName }">
                                        <img class="d-block w-100" src="${contextPath }/thumbnails?goodsFileName=${goodsDto.goodsFileName }" alt="First slide">
                                    </a>
                                    </div>
                                </div>
                                 <div class="carousel-item">
                                        <a class="gallery_img" href="img/product-img/product-2.jpg">
                                        <img class="d-block w-100" src="img/product-img/product-2.jpg" alt="Second slide">
                                    </a>
                                    </div>
                                    <div class="carousel-item">
                                        <a class="gallery_img" href="img/product-img/product-3.jpg">
                                        <img class="d-block w-100" src="img/product-img/product-3.jpg" alt="Third slide">
                                    </a>
                                    </div>
                                    <div class="carousel-item">
                                        <a class="gallery_img" href="img/product-img/product-4.jpg">
                                        <img class="d-block w-100" src="img/product-img/product-4.jpg" alt="Fourth slide">
                                    </a>
                                    </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-md-6">
                        <div class="single_product_desc">

                            <h4 class="title"><a href="#">${goodsDto.goodsNm }</a></h4>
						
	                            <a href="javascript:processToFavor(${goodsDto.goodsCd});"  class="cart-btn"><span class="icon_heart" style="color: red"></span> 찜하기</a>
                            
                        <div class="product__details__price"><fmt:formatNumber value="${goodsDto.price - (goodsDto.price * goodsDto.discountRate / 100)}" />원<span><fmt:formatNumber value="${goodsDto.price }"/>원</span></div>

                            <p class="available">남은수량: <span class="text-muted">${goodsDto.stock}</span></p>
							
                            <div class="single_product_ratings mb-15">
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star-o" aria-hidden="true"></i>
                            </div>
							
							  <!-- Add to Cart Form -->
                            <form class="cart clearfix mb-50 d-flex" method="post">
                                <div class="quantity">
                                    <span class="qty-minus" onclick="var effect = document.getElementById('orderGoodsQty'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) effect.value--;return false;"><i class="fa fa-minus" aria-hidden="true"></i></span>
                                    <input type="number" class="qty-text" id="orderGoodsQty" step="1" min="1" max="12" name="quantity" value="1">
                                    <span class="qty-plus" onclick="var effect = document.getElementById('orderGoodsQty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i class="fa fa-plus" aria-hidden="true"></i></span>
                                </div>
                                <p>수량선택</p>
                            </form>
                            <div class="product__details__button">
	                            <a href="javascript:processToCart(${goodsDto.goodsCd });" class="cart-btn"><span class="icon_cart_alt"></span> 장바구니</a>
	                            <a href="javascript:processToOrder(${goodsDto.goodsCd });" class="cart-btn"><span class="icon_bag_alt"></span> 주문하기</a>
                     		</div>
							
							
							
                            <div id="accordion" role="tablist">
                                <div class="card">
                                    <div class="card-header" role="tab" id="headingOne">
                                        <h6 class="mb-0">
                                            <a data-toggle="collapse" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">상품 정보</a>
                                        </h6>
                                    </div>

                                    <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion">
                                        <div class="card-body">
                                        <p>제품분류 : ${goodsDto.category }</p>
                                        <p>제조사 : ${goodsDto.company }</p>
                                        <p>배송비 : ${goodsDto.deliveryPrice }원</p>
                                        <p>할인률 : ${goodsDto.discountRate}%</p>
                                        <p>적립포인트 : ${goodsDto.point }P</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header" role="tab" id="headingTwo">
                                        <h6 class="mb-0">
                                            <a class="collapsed" data-toggle="collapse" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">제품 정보</a>
                                        </h6>
                                    </div>
                                    <div id="collapseTwo" class="collapse" role="tabpanel" aria-labelledby="headingTwo" data-parent="#accordion">
                                        <div class="card-body">
                                        	<p>제품 소개</p>
											<p>${goodsDto.intro }</p>
											<p>제품 스펙</p>
											<p>${goodsDto.goodsSpec }</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header" role="tab" id="headingThree">
                                        <h6 class="mb-0">
                                            <a class="collapsed" data-toggle="collapse" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">배송, 환불안내</a>
                                        </h6>
                                    </div>
                                    <div id="collapseThree" class="collapse" role="tabpanel" aria-labelledby="headingThree" data-parent="#accordion">
                                        <div class="card-body">
                                        	<p>배송도착일은 평균 3일이며 개봉시 단순변심으로 인한 환불은 불가능합니다.</p>
                                        	<p>제품에 문제발생시 제품 제조사 A/S센터에 문의하실수 있습니다.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- <<<<<<<<<<<<<<<<<<<< Single Product Details Area End >>>>>>>>>>>>>>>>>>>>>>>>> -->

        <!-- ****** Quick View Modal Area Start ****** -->
        <div class="modal fade" id="quickview" tabindex="-1" role="dialog" aria-labelledby="quickview" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                <div class="modal-content">
                    <button type="button" class="close btn" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                    <div class="modal-body">
                        <div class="quickview_body">
                            <div class="container">
                                <div class="row">
                                    <div class="col-12 col-lg-5">
                                        <div class="quickview_pro_img">
                                            <img src="img/product-img/product-1.jpg" alt="">
                                        </div>
                                    </div>
                                    <div class="col-12 col-lg-7">
                                        <div class="quickview_pro_des">
                                            <h4 class="title">Boutique Silk Dress</h4>
                                            <div class="top_seller_product_rating mb-15">
                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                <i class="fa fa-star" aria-hidden="true"></i>
                                            </div>
                                            <h5 class="price">$120.99 <span>$130</span></h5>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia expedita quibusdam aspernatur, sapiente consectetur accusantium perspiciatis praesentium eligendi, in fugiat?</p>
                                            <a href="#">View Full Product Details</a>
                                        </div>
                                        <!-- Add to Cart Form -->
                                        <form class="cart" method="post">
                                            <div class="quantity">
                                                <span class="qty-minus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) effect.value--;return false;"><i class="fa fa-minus" aria-hidden="true"></i></span>

                                                <input type="number" class="qty-text" id="qty2" step="1" min="1" max="12" name="quantity" value="1">

                                                <span class="qty-plus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i class="fa fa-plus" aria-hidden="true"></i></span>
                                            </div>
                                            <button type="submit" name="addtocart" value="5" class="cart-submit">Add to cart</button>
                                            <!-- Wishlist -->
                                            <div class="modal_pro_wishlist">
                                                <a href="wishlist.html" target="_blank"><i class="ti-heart"></i></a>
                                            </div>
                                            <!-- Compare -->
                                            <div class="modal_pro_compare">
                                                <a href="compare.html" target="_blank"><i class="ti-stats-up"></i></a>
                                            </div>
                                        </form>

                                        <div class="share_wf mt-30">
                                            <p>Share With Friend</p>
                                            <div class="_icon">
                                                <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                                                <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                                                <a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
                                                <a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ****** Quick View Modal Area End ****** -->

        <section class="you_may_like_area clearfix">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section_heading text-center">
                            <h2 style="color: #e20f0f;">관련 상품</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="you_make_like_slider owl-carousel">
             			<c:forEach var="relatedGoods" items="${relatedGoodsList }">
                            <!-- Single gallery Item -->
                            <div class="single_gallery_item">
                                <!-- Product Image -->
                                <div class="product-img" style="height: 400px; width: 300px;" >
                                    <img src="${contextPath }/thumbnails?goodsFileName=${relatedGoods.goodsFileName}">
                                    
                                </div>
                                <!-- Product Description -->
                                <div class="product-description">
                                    <div class="product__price" style="text-decoration: line-through; color: gray"><fmt:formatNumber value="${relatedGoods.price }"/>원 (${relatedGoods.discountRate}%)</div>
                               		<div class="product__price"><fmt:formatNumber value="${relatedGoods.price - relatedGoods.price * relatedGoods.discountRate / 100 }"/>원</div>
                                    <p><a href="${contextPath }/goods/goodsDetail?goodsCd=${relatedGoods.goodsCd}">${relatedGoods.goodsNm }<br>
                                	${relatedGoods.category } | ${relatedGoods.company }
                               	</a></p>
                                    <!-- Add to Cart -->
                                    <a href="javascript:processToFavor(${goodsDto.goodsCd})" class="cart-btn"><span class="icon_heart" style="color: red"></span> 찜하기</a>
                                    <a href="javascript:processToCart(${relatedGoods.goodsCd})" class="add-to-cart-btn">장바구니 담기</a>
                                </div>
                            </div>
                    	</c:forEach>
                            </div>
                        </div>
                    </div>
                </div>         
        </section>
                <div class="line"></div>
                
</body>
</html>