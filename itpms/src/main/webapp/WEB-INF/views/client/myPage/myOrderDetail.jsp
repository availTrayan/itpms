<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세정보</title>
<script>

	$().ready(function(){
		
		$("[name='cardCompanyNm']").val("${myOrder.cardCompanyNm}");
		$("[name='payMethod']").val("${myOrder.payMethod}");
		$("[name='cardPayMonth']").val("${myOrder.cardPayMonth}");
		$("[name='deliveryStatus']").val("${myOrder.deliveryStatus}");
		
		$("[name='giftWrapping']").each(function(){
			if ($(this).val() == "${myOrder.giftWrapping}"){
				$(this).prop("checked", true);
			}
		})
		$("[name='deliveryMethod']").each(function(){
			if ($(this).val() == "${myOrder.deliveryMethod}"){
				$(this).prop("checked", true);
			}
		})
		
		
	});

</script>
</head>
<body>
	<!-- ****** Checkout Area Start ****** -->
        <div class="checkout_area section_padding_100">
            <div class="container">
             <form action="${contextPath }/order/orderGoods" method="post">
                <input type="hidden" name="goodsCd" value="${goodsDto.goodsCd }">
                <input type="hidden" name="orderGoodsQty" value="${orderGoodsQty}">
                <input type="hidden" name="memberId" value="${orderer.memberId}">
                <input type="hidden" name="point" value="${goodsDto.point * orderGoodsQty}">
               
                <div class="row">

                    <div class="col-12 col-md-6">
                        <div class="checkout_details_area mt-50 clearfix">

                            <div class="cart-page-heading">
                                <h4>주문정보</h4>
                                <p>주문 정보를 입력해주세요.</p>
                            </div>

                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label for="ordererNm">주문자 성함 <span>*</span></label>
                                        <input type="text" class="form-control" name="ordererNm" id="ordererNm" value="${myOrder.ordererNm }" disabled>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="ordererHp">주문자 연락처 <span>*</span></label>
                                        <input type="text" class="form-control" name="ordererHp" id="ordererHp" value="${myOrder.ordererHp }" disabled>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="receiverNm">받는분 성함</label>
                                        <input type="text" class="form-control" name="receiverNm" id="receiverNm" value="${myOrder.receiverNm }" disabled>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="receiverHp">받는분 연락처 <span>*</span></label>
                                        <input type="text" class="form-control" name="receiverHp" id="receiverHp" value="${myOrder.receiverHp}" disabled>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <div class="checkout__order__widget">
		                                    <p>포장여부 <span>*</span></p>
                                    		<input type="text" name="giftWrapping" value="${myOrder.giftWrapping }" disabled>
	                                	</div>
                                    </div>
                                   <div class="col-md-6 mb-3">
	                                    <div class="checkout__order__widget">
		                                     <p>배송방법 <span>*</span></p>
		                                 	 <input type="text" name="deliveryMethod" value="${myOrder.deliveryMethod }" disabled>
		                                </div>
	                                </div>
                                   <div class="col-md-6 mb-3">
	                                    <div class="checkout__order__widget">
		                                    <p>지불 방법 <span>*</span></p>
		                                    <input type="text" name="payMethod" value="${myOrder.payMethod }" disabled>
                                		</div>
	                                </div>
	                                <c:choose>
                            			<c:when test="${myOrder.payMethod eq 'card'}">
			                                <div class="col-lg-12 col-md-12 col-sm-12 mb-3">
		                            		</div>
			                                <div id="cardCompanyNm" class="col-lg-6 col-md-6 col-sm-6">
				                                <div class="checkout__order__widget">
				                                    <p>카드 회사 <span>*</span></p>
					                                <input type="text" name="cardCompanyNm" value="${myOrder.cardCompanyNm }" disabled>
				                                </div>
		                           		   </div>
		                       		   		<div id="cardPayMonth" class="col-lg-6 col-md-6 col-sm-6 mb-3">
				                                <div class="checkout__order__widget">
				                                    <p>할부 개월 <span>*</span></p>
					                                   <c:choose>
					                                    	<c:when test="${myOrder.cardPayMonth == 0}">
					                                    		<input type="text" name="cardPayMonth" value="일시불" disabled>
					                                    	</c:when>
					                                    	<c:otherwise>
							                                    <input type="text" name="cardPayMonth" value="${myOrder.cardPayMonth }개월" disabled>
					                                    	</c:otherwise>
					                                    </c:choose>
				                                </div>
		                          			</div>
                          				</c:when>
	                            		<c:otherwise>
			                                <div id="payOrdererHp" class="col-lg-6 col-md-6 col-sm-6" style="display: none">
				                                <div class="checkout__form__input">
				                                    <p>결제 휴대폰 번호 <span>*</span></p>
				                                    <input type="text" name="paymyOrderHp" value="${myOrder.ordererHp }" disabled>
				                                </div>
				                            </div>
			                            </c:otherwise>
                            		</c:choose>
		                            <div class="col-lg-12 col-md-12 col-sm-12 mb-3">
                            		</div>
                            		<div class="col-12 mb-3">
                            			 <div class="checkout__form__input">
		                                    <p>배송상태 <span>*</span></p>
	                                    	<input type="text" name="deliveryStatus" value="${myOrder.deliveryStatus }" disabled>
                                		</div>
                            		</div>
                            		<div class="col-12 mb-3">
                            			 <div class="checkout__form__input">
		                                    <p>배송메세지 <span>*</span></p>
                                    		<input type="text" name="deliveryMessage" value="${myOrder.deliveryMessage }"disabled>
                                		</div>
                            		</div>
                            		<div class="col-md-6 mb-3">
                            			<div class="checkout__form__input">
		                                    <p>우편번호 <span>*</span></p>
		                                    <input type="text" id="postalcode" name="postalcode" value="${myOrder.postalcode }" disabled>
		                                    <input type="button" value="주소 검색" onclick="execDaumPostcode();" disabled>
		                                </div>
                            		</div>
                                    <div class="col-12 mb-3">
                                    	<div class="checkout__form__input">
	                                        <label for="roadAddress">도로명 주소 <span>*</span></label>
	                                        <input type="text" class="form-control mb-3" id="roadAddress" name="roadAddress" value="${myOrder.roadAddress }" disabled>
                                    	</div>
                                    </div>
                                    <div class="col-12 mb-3">
                                    	<div class="checkout__form__input">
	                                        <label for="jibunAddress">지번 주소 <span>*</span></label>
	                                        <input type="text" class="form-control" id="jibunAddress" name="jibunAddress" value="${myOrder.jibunAddress }" disabled>
                                    	</div>
                                    </div>
                                    <div class="col-12 mb-3">
                                        <div class="checkout__form__input">
	                                        <label for="restAddress">나머지 주소 <span>*</span></label>
	                                        <input type="text" class="form-control" id="restAddress" name="restAddress" value="${myOrder.restAddress }" disabled>
                                    	</div>
                                    </div>
                                    <div class="col-12">
                                        
                                    </div>
                                </div>
                        </div>
                    </div>

                    <div class="col-12 col-md-6 col-lg-5 ml-lg-auto">
                        <div class="order-details-confirmation">

                            <div class="cart-page-heading">
                                <h4>결제정보</h4>
                                <p>주문내역</p>
                            </div>

                            <ul class="order-details-form mb-4">
                                <li><span>주문정보</span></li>
                                <li><span>상품명 | 수량</span> <span>${myOrder.goodsNm } | ${myOrder.orderGoodsQty }개</span></li>
                                <li><span>상품가격</span> <span><fmt:formatNumber value="${myOrder.price - myOrder.price * myOrder.discountRate / 100}"/>원</span></li>
                                <li><span>배송비</span> <span><fmt:formatNumber value="${myOrder.deliveryPrice}"/>원</span></li>
                                <li><span>적립포인트</span> <span><fmt:formatNumber value="${myOrder.point}"/>P적립</span></li>
                            </ul>
                            <ul class="order-details-form mb-4">
                                    <li>Total <span><fmt:formatNumber value="${myOrder.price - myOrder.price * myOrder.discountRate / 100 + myOrder.deliveryPrice}"/>원</span></li>
                            </ul>
                        </div>
                    </div>
                </div>
                </form>
            </div>
        </div>
        <!-- ****** Checkout Area End ****** -->
</body>
</html>