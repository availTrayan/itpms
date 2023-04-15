<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<script>
	$().ready(function(){
		
		$("[name='category']").val("${goodsDto.category}");
		$("[name='sort']").val("${goodsDto.sort}");
		
	});

</script>
<meta charset="UTF-8">
<title>등록상품 수정</title>
</head>
<body>
	<!-- ****** Checkout Area Start ****** -->
        <div class="checkout_area section_padding_100">
            <div class="container">
                <div class="row">
                    <div class="col-12 col-md-6">
                        <div class="checkout_details_area mt-50 clearfix">
                            <div class="cart-page-heading">
                            <h4>상품 수정</h4>
                            </div>
                                 <form action="${contextPath }/admin/goods/adminGoodsModify" method="post" enctype="multipart/form-data" class="checkout__form" >
					               <input type="hidden" name="goodsCd" value="${goodsDto.goodsCd }">
					                <div class="row">
                                    	<div class="col-md-6 mb-4">
			                                    <p>제품 이미지 등록<span style="color:red;">*</span> <span class="icon_upload"></span></p>
			                                    <input type="file" name="goodsFileName" value="${goodsDto.goodsFileName }">
	                                    </div>
                                    	<div class="col-12 mb-4">
			                                    <p>제품명 <span style="color:red;">*</span></p>
			                                    <input type="text" class="form-control" name="goodsNm" value="${goodsDto.goodsNm }">
			                            </div>
                                    	<div class="col-12 mb-4">
			                                    <p>제조사 <span style="color:red;">*</span></p>
			                                    <input type="text" class="form-control" name="company" value="${goodsDto.company }">
			                            </div>
                                    <div class="col-md-6 mb-4">
					                                    <p>가격 <span style="color:red;">*</span></p>
					                                    <input type="text" class="form-control" name="price" value="${goodsDto.price }">
					                            </div>
                                    <div class="col-md-6 mb-4">
					                                    <p>할인률 <span style="color:red;">*</span></p>
					                                    <input type="text" class="form-control" name="discountRate" value="${goodsDto.discountRate }">
					                            </div>
                                    <div class="col-md-6 mb-4">
					                                    <p>재고 <span style="color:red;">*</span></p>
					                                    <input type="text" class="form-control" name="stock" value="${goodsDto.stock }">
					                            </div>
                                    <div class="col-md-6 mb-4">
					                                    <p>분류 <span style="color:red;">*</span></p>
					                                    <select name="sort" class="form-control">
					                                    	<option value="new">신상품</option>
					                                    	<option value="best">베스트상품</option>
					                                    	<option value="general">일반상품</option>
					                                    </select>
					                            </div>
                                    <div class="col-md-6 mb-4">
					                                    <p>적립포인트(P) <span style="color:red;">*</span></p>
					                                    <input type="text" class="form-control" name="point" value="${goodsDto.point }">
					                            </div>
                                    <div class="col-md-6 mb-4">
					                                    <p>출시일 <span style="color:red;">*</span></p>
					                                    <input type="date" name="publishedDt" value='<fmt:formatDate value="${goodsDto.publishedDt }" pattern="yyyy-MM-dd"/>'>
					                            </div>
                                    <div class="col-md-6 mb-4">
					                                    <p>배송비 <span style="color:red;">*</span></p>
					                                    <input type="text" class="form-control" name="deliveryPrice" value="${goodsDto.deliveryPrice }">
					                            </div>
                                    			<div class="col-md-6 mb-4">
					                                    <p>제품 카테고리<span style="color:red;">*</span></p>
					                                    <select name="category" >
					                                    	<option value="노트북">노트북</option>
					                                    	<option value="스마트폰/태블릿">스마트폰 / 태블릿</option>
					                                    	<option value="게임기">게임기</option>
					                                    	<option value="키보드/마우스">키보드 / 마우스</option>
					                                    	<option value="음향기기">음향기기</option>
					                                    	<option value="악세사리">악세사리</option>
					                                    </select>
					                            </div>
                                    			<div class="col-12 mb-4">
					                                    <p>제품스펙<span style="color:red;">*</span></p>
					                                    <textarea rows="5" cols="100" class="form-control" name="goodsSpec">${goodsDto.goodsSpec }</textarea> 
					                                	<script>CKEDITOR.replace("goodsSpec");</script>
					                            </div>
                                   				<div class="col-12 mb-4">
					                                    <p>상품소개<span style="color:red;">*</span></p>
					                                    <textarea rows="10" cols="100" class="form-control" name="intro" >${goodsDto.intro }</textarea> 
					                                	<script>CKEDITOR.replace("intro");</script>
					                            </div>
								                <div class="col-md-6 mb-3">
	                                       			<button type="submit" class="btn karl-checkout-btn">수정확인</button>
	                                    		</div>
				                        	</div>
					                        <br>
                					</form>
                            </div>
                    	</div>
                </div>
                </div>
                </div>
        <!-- ****** Checkout Area End ****** -->
</body>
</html>