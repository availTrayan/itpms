<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<script>
	
	$().ready(function(){
	
		getTotalPrice();
		
		$("[name='cartCd']").change(function(){
			getTotalPrice();
		});
		
	});
	
	
	function getTotalPrice () {
		var totalPrice = 0;
		$("[name='cartCd']:checked").each(function(){
			var tempCartCd = $(this).val();
			totalPrice += Number($("#price" + tempCartCd).val()) * Number($("#cartGoodsQty" + tempCartCd).val());
		});
		totalPrice = totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " 원";
		$("#totalPrice").html(totalPrice);
	}
	
	
	function removeCart() {
			
		var cartCdList = "";
		if (confirm("정말로 삭제하시겠습니까?")) {
			
			$("input[name='cartCd']:checked").each(function(){
				cartCdList += $(this).val() + ",";
			});
			location.href = "${contextPath}/myPage/removeCart?cartCdList=" + cartCdList;
		}
		
	}
	
	
	function modifyCartGoodsQty(cartCd){
		$.ajax({
			type : "get",
			url : "${contextPath}/myPage/modifyCartGoodsQty",
			data : {
				"cartCd"   : cartCd,
				"cartGoodsQty" : $("#cartGoodsQty" + cartCd).val()
			},
			success:function(){
				getTotalPrice();
			}
		});
		
	}
	
	
	function processOrderCart() {
	
		var goodsCdList = "";
		var cartGoodsQtyList = "";
		var cartCdList = ""
		
		$("[name='cartCd']:checked").each(function(){
			
			var cartCd = $(this).val();
			var goodsCd =  $("#goodsCd" + cartCd).val();
			var cartGoodsQty = $("#cartGoodsQty" + cartCd).val();
			
			goodsCdList += goodsCd + ",";
			cartGoodsQtyList += cartGoodsQty +",";
			cartCdList += cartCd + ",";
			
		});
		
		if (goodsCdList == "") {
			alert("주문 목록이 없습니다.");
			return false;
		}
		
		var url = "${contextPath}/order/orderCartGoods";
		    url += "?goodsCdList=" + goodsCdList;
		    url += "&cartGoodsQtyList=" + cartGoodsQtyList;
		    url += "&cartCdList=" + cartCdList;
		
		location.href = url;
		
		
	}
	
	
	function selectAllCart() {
		if ($("#changeAllChoice").prop("checked")) {
			$("[name='cartCd']").prop("checked" , true);
		}
		else {
			$("[name='cartCd']").prop("checked" , false);
		}
		getTotalPrice();
	}	
	

</script>
<title>장바구니</title>
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
       			<h4><b>장바구니 목록</b></h4>
       		</div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shop__cart__table">
                    	<h6><input type="checkbox" id="changeAllChoice" onchange="selectAllCart()"> &nbsp;전체선택</h6>
                    	<br>
                        <table>
                            <thead>
                                <tr>
                                    <th width="3%"></th>
                                    <th>상품명</th>
                                    <th width="13%">상품가격</th>
                                    <th width="13%">주문수량</th>
                                    <th width="13%">등록일자</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:choose>
                            		<c:when test="${empty myCartList}">
                            			<tr align="center">
                            				<td colspan="5"><h5>조회된 상품이 없습니다.</h5></td>
                            			</tr>
                            		</c:when>
                            		<c:otherwise>
		                            	<c:forEach var="myCart" items="${myCartList }">
		                            		 <tr>
		                            		 	<td><input type="checkbox" name="cartCd" value="${myCart.cartCd }" checked></td>
                                    			<td class="cart__product__item">
			                                        <div class="cart__product__item__title">
			                                        	<img src="${contextPath }/thumbnails?goodsFileName=${myCart.goodsFileName }" width="50" height="50">
			                                            <h6>
			                                            	<a href="${contextPath }/goods/goodsDetail?goodsCd=${myCart.goodsCd}">${myCart.goodsNm }</a>
			                                            	<input type="hidden" id="goodsCd${myCart.cartCd }" value="${myCart.goodsCd }"/>
			                                            </h6>
			                                            <p>${myCart.company }</p>
			                                        </div>
			                                    </td>
			                                    <td class="cart__price">
			                                    	<div class="product__price" >
			                                    		<span style="text-decoration: line-through; color: gray" ><fmt:formatNumber value="${myCart.price }"/>원</span><br>
				                                    	<fmt:formatNumber value="${myCart.price -  myCart.price * (myCart.discountRate / 100)}"/>
														<input type="hidden" id="price${myCart.cartCd }" value="${myCart.price -  myCart.price * (myCart.discountRate / 100)}">원			                                    
			                                    	</div>
			                                    </td>
			                                     <!-- Add to Cart Form -->
			                                    <td class="cart__quantity" onmouseleave="modifyCartGoodsQty(${myCart.cartCd })">
					                                    <span class="qty-minus" onclick="var effect = document.getElementById('cartGoodsQty${myCart.cartCd }'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) effect.value--;return false;"><i class="fa fa-minus" aria-hidden="true"></i></span>
					                                    	<input type="number" class="qty-text" id="cartGoodsQty${myCart.cartCd }" step="1" min="1" max="12" name="quantity" value="${myCart.cartGoodsQty }">
					                                    <span class="qty-plus" onclick="var effect = document.getElementById('cartGoodsQty${myCart.cartCd }'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i class="fa fa-plus" aria-hidden="true"></i></span>
			                                    </td>
			                                    <td><h6><fmt:formatDate value="${myCart.enrollDt }" pattern="yyyy-MM-dd"/></h6></td>
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
                        <a href="javascript:removeCart();"><span class="icon_trash"></span>장바구니에서 삭제</a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="discount__content">
                    </div>
                </div>
                <div class="col-lg-4 offset-lg-2">
                    <div class="cart__total__procced">
                        <h6>주문가격</h6>
                        <ul>
                            <li>Total <span id="totalPrice"></span></li>
                        </ul>
                        <a href="javascript:processOrderCart()" class="primary-btn"><span class="icon_check"></span> 주문하기</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shop Cart Section End -->
</body>
</html>