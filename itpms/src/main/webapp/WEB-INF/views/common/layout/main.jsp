<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ItingsMain</title>
</head>
<body>

 <!-- ****** Top Discount Area Start ****** -->
        <section class="top-discount-area d-md-flex align-items-center">
            <!-- Single Discount Area -->
            <div class="single-discount-area" style="background-color: rgb(219, 33, 79);">
            	<img src="${contextPath }/resources/bootstrap/img/bg-img/product.png" height="50" width="50">
                <a href="${contextPath }/goods/goodsList?sort=all&category=all"><h4 style="color: white;">전체상품</h4></a>
                <h6>나에게 필요한 상품 둘러보기</h6>
            </div>
            <!-- Single Discount Area -->
            <div class="single-discount-area" style="background-color: rgb(219, 33, 79);">
           		<img src="${contextPath }/resources/bootstrap/img/bg-img/bestsell.png" height="50" width="50">
                <a href="${contextPath }/goods/goodsList?sort=best&category=all"><h4 style="color: white;">베스트 인기상품</h4></a>
                <h6>가장 인기있는 상품들을 한곳에서</h6>
            </div>
            <!-- Single Discount Area -->
            <div class="single-discount-area" style="background-color: rgb(219, 33, 79);">
            	<img src="${contextPath }/resources/bootstrap/img/bg-img/discount.png" height="50" width="50">
                <a href="${contextPath }/goods/searchGoods?method=discountProduct"><h4 style="color: white;">할인 이벤트</h4></a>
                <h6>할인된 가격으로 합리적인 쇼핑</h6>
            </div>
        </section>
        <!-- ****** Top Discount Area End ****** -->

        <!-- ****** Welcome Slides Area Start ****** -->
        <section class="welcome_area">
            <div class="welcome_slides owl-carousel">
                <!-- Single Slide Start -->
                <div class="single_slide height-800 bg-img background-overlay" style="background-image: url(${contextPath }/resources/bootstrap/img/bg-img/surface-1.webp);">
                    <div class="container h-100">
                        <div class="row h-100 align-items-center">
                            <div class="col-12">
                                <div class="welcome_slide_text">
                                    <h6 data-animation="bounceInDown" data-delay="0" data-duration="500ms">노트북의 강력한 성능과 태블릿의 편리함</h6>
                                    <h2 data-animation="fadeInUp" data-delay="500ms" data-duration="500ms">서피스 프로 9 </h2>
                                    <a href="${contextPath}/goods/goodsDetail?goodsCd=1" class="btn karl-btn" data-animation="fadeInUp" data-delay="1s" data-duration="500ms">보러가기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Single Slide Start -->
                <div class="single_slide height-800 bg-img background-overlay" style="background-image: url(${contextPath }/resources/bootstrap/img/bg-img/iphone14pro.jpeg);">
                    <div class="container h-100">
                        <div class="row h-100 align-items-center">
                            <div class="col-12">
                                <div class="welcome_slide_text">
                                    <h6 data-animation="fadeInDown" data-delay="0" data-duration="500ms">다이내믹 아일랜드로 경험하는 디테일 </h6>
                                    <h2 data-animation="fadeInUp" data-delay="500ms" data-duration="500ms">아이폰 14 pro</h2>
                                    <a href="${contextPath}/goods/goodsDetail?goodsCd=2" class="btn karl-btn" data-animation="fadeInLeftBig" data-delay="1s" data-duration="500ms">보러가기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Single Slide Start -->
                <div class="single_slide height-800 bg-img background-overlay" style="background-image: url(${contextPath }/resources/bootstrap/img/bg-img/ps5.webp);">
                    <div class="container h-100">
                        <div class="row h-100 align-items-center">
                            <div class="col-12">
                                <div class="welcome_slide_text">
                                    <h6 data-animation="fadeInDown" data-delay="0" data-duration="500ms">8K, 레이트레이싱, 3D오디오로 강화된 플레이</h6>
                                    <h2 data-animation="bounceInDown" data-delay="500ms" data-duration="500ms">PlayStation 5</h2>
                                    <a href="${contextPath}/goods/goodsDetail?goodsCd=3" class="btn karl-btn" data-animation="fadeInRightBig" data-delay="1s" data-duration="500ms">보러가기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ****** Welcome Slides Area End ****** -->

        <!-- ****** Top Catagory Area Start ****** -->
        <section class="top_catagory_area d-md-flex clearfix">
            <!-- Single Catagory -->
            <div class="single_catagory_area d-flex align-items-center bg-img" style="background-image: url(${contextPath }/resources/bootstrap/img/bg-img/cable.jpg);">
                <div class="catagory-content">
                    <h6>소중한 기기에 필요한</h6>
                    <h3 style="color: white;">필수 악세사리모음</h3>
                    <div class="mb-3"></div>
                    <a href="${contextPath }/goods/goodsList?sort=all&category=악세사리" class="btn karl-btn">보러가기</a>
                </div>
            </div>
            <!-- Single Catagory -->
            <div class="single_catagory_area d-flex align-items-center bg-img" style="background-image: url(${contextPath }/resources/bootstrap/img/bg-img/galaxybook.jpg);">
                <div class="catagory-content">
                    <h6>신학기 준비 필수품</h6>
                    <h3 style="color: white;">노트북 모음</h3>
                    <div class="mb-3"></div>
                    <a href="${contextPath }/goods/goodsList?sort=all&category=노트북" class="btn karl-btn">보러가기</a>
                </div>
            </div>
        </section>
        <!-- ****** Top Catagory Area End ****** -->

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
                                            <img src="${contextPath }/resources/bootstrap/img/product-img/product-1.jpg" alt="">
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

                                                <input type="number" class="qty-text" id="qty" step="1" min="1" max="12" name="quantity" value="1">

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

        <!-- ****** New Arrivals Area Start ****** -->
        <section class="new_arrivals_area section_padding_100_0 clearfix">
            <!-- Trend Section Begin -->
                        <div class="section_heading text-center">
                            <h2 style="color: #e20f0f;">다양한 상품, 내 마음대로 쇼핑</h2>
                        </div>
			<section class="trend spad">
			    <div class="container">
			        <div class="row">
			            <div class="col-lg-4 col-md-4 col-sm-6">
			                <div class="trend__content">
			                    <div class="section-title">
			                        <h4>NEW<span class="karl-level">Hot</span></h4>
			                    </div>
			                    <c:forEach var="newProducts" items="${newProductsInfo }">
				                    <div class="trend__item">
				                        <div class="trend__item__pic">
				                            <img src="${contextPath }/thumbnails?goodsFileName=${newProducts.goodsFileName }" width="50" height="50">
				                        </div>
				                        <div class="trend__item__text">
				                            <h6><a href="${contextPath }/goods/goodsDetail?goodsCd=${newProducts.goodsCd}">${newProducts.goodsNm }</a></h6>
				                            <div class="product__price"><fmt:formatNumber value="${newProducts.price - newProducts.price * newProducts.discountRate / 100}"/>원<span style="text-decoration: line-through; color: gray"> (<fmt:formatNumber value="${newProducts.price }"/>원)</span></div>
				                        </div>
				                    </div>
			                    </c:forEach>
			                </div>
			            </div>
			            <div class="col-lg-4 col-md-4 col-sm-6">
			                <div class="trend__content">
			                    <div class="section-title">
			                        <h4>BEST</h4>
			                    </div>
			                    <c:forEach var="bestProducts" items="${bestProductsInfo }">
				                    <div class="trend__item">
				                        <div class="trend__item__pic">
				                            <img src="${contextPath }/thumbnails?goodsFileName=${bestProducts.goodsFileName }" width="50" height="50">
				                        </div>
				                        <div class="trend__item__text">
				                            <h6><a href="${contextPath }/goods/goodsDetail?goodsCd=${bestProducts.goodsCd}">${bestProducts.goodsNm }</a></h6>
				                            <div class="product__price"><fmt:formatNumber value="${bestProducts.price - bestProducts.price * bestProducts.discountRate / 100}"/>원<span style="text-decoration: line-through; color: gray"> (<fmt:formatNumber value="${bestProducts.price }"/>원)</span></div>
				                        </div>
				                    </div>
			                    </c:forEach>
			                </div>
			            </div>
			            <div class="col-lg-4 col-md-4 col-sm-6">
			                <div class="trend__content">
			                    <div class="section-title">
			                        <h4>ITings</h4>
			                    </div>
			                    <c:forEach var="eneralProducts" items="${generalProductsInfo }">
			                    	<div class="trend__item__pic">
			                            <img src="${contextPath }/thumbnails?goodsFileName=${eneralProducts.goodsFileName }" width="50" height="50">
			                        </div>
			                    <div class="trend__item">
			                        <div class="trend__item__text">
			                            <h6><a href="${contextPath }/goods/goodsDetail?goodsCd=${eneralProducts.goodsCd}">${eneralProducts.goodsNm }</a></h6>
			                            <div class="product__price"><fmt:formatNumber value="${eneralProducts.price - eneralProducts.price * eneralProducts.discountRate / 100}"/>원<span style="text-decoration: line-through; color: gray"> (<fmt:formatNumber value="${eneralProducts.price }"/>원)</span></div>
			                        </div>
			                    </div>
		                    </c:forEach>
		                </div>
		            </div>
		        </div>
		    </div>
		</section>
		<!-- Trend Section End -->
        </section>
        <!-- ****** New Arrivals Area End ****** -->

        <!-- ****** Offer Area Start ****** -->
        <section class="offer_area height-700 section_padding_100 bg-img" style="background-image: url(${contextPath }/resources/bootstrap/img/bg-img/hd800s.jpg);">
            <div class="container h-100">
                <div class="row h-100 align-items-end justify-content-end">
                    <div class="col-12 col-md-8 col-lg-6">
                        <div class="offer-content-area wow fadeInUp" data-wow-delay="1s">
                            <h2>젠하이져 HD 800s</h2>
                            <p>젠하이저 플래그십 모델 HD800의 후속작</p>
                            <div class="offer-product-price">
                                <h3><span class="regular-price">2,296,300원</span>2,066,670원</h3>
                            </div>
                            <a href="${contextPath}/goods/goodsDetail?goodsCd=13" class="btn karl-btn mt-30">보러가기</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ****** Offer Area End ****** -->

        <!-- ****** Popular Brands Area Start ****** -->
        <section class="karl-testimonials-area section_padding_100">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section_heading text-center">
                            <h2 style="color: #e20f0f;">인기브랜드</h2>
                        </div>
                    </div>
                </div>

                <div class="row justify-content-center">
                    <div class="col-12 col-md-8">
                        <div class="karl-testimonials-slides owl-carousel">

                            <!-- Single Testimonial Area -->
                            <div class="single-testimonial-area text-center">
                                <h4 style="color:#004ab5; font: sans-serif;"><strong>SAMSUNG</strong></h4>
                                <h6>삼성 제품 보러가기</h6>
                			   <div class="trend__content">
	                        	    <div class="trend__item__pic">
	                        	    	<a href="${contextPath }/goods/searchGoods?method=company&companyName=삼성">
                                        <img src="${contextPath }/resources/bootstrap/img/bg-img/samsung.avif" ></a>
                                    </div>
                                    <div class="testi-data">
                                    </div>
                                </div>
                            </div>

                            <!-- Single Testimonial Area -->
                            <div class="single-testimonial-area text-center">
                                <h4 style="color:black; font: serif;"><strong>Apple</strong></h4>
                                <h6>애플 제품 보러가기</h6>
                               <div class="trend__content">
	                        		<div class="trend__item__pic">
	                        			<a href="${contextPath }/goods/searchGoods?method=company&companyName=애플">
                                        <img src="${contextPath }/resources/bootstrap/img/bg-img/apple.jpg" alt=""></a>
                                  	</div>
                                    <div class="testi-data">
                                    </div>
                               </div>
                            </div>

                            <!-- Single Testimonial Area -->
                            <div class="single-testimonial-area text-center">
                                <h4 style="color:grey; font:lighter; ;"><strong>SONY</strong></h4>
                                <h6>소니 제품 보러가기</h6>
                                <div class="trend__content">
	                        	<div class="trend__item__pic">
	                        		   <a href="${contextPath }/goods/searchGoods?method=company&companyName=소니">
                                        <img src="${contextPath }/resources/bootstrap/img/bg-img/sony.webp" alt=""></a>
                                    </div>
                                    <div class="testi-data">
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </section>
        <!-- ****** Popular Brands Area End ****** -->

</body>
</html>