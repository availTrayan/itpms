<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 상품주문</title>
<script>

	$().ready(function() {
		
		var orderGoodsQtyList = "${orderGoodsQtyList}".split(",");
		
		var viewPaymentAmt = 0;
		var paymentAmtList = 0;
		var totalDeliveryPrice = 0;
		var totalPoint = 0;
		for (var i = 0; i < orderGoodsQtyList.length - 1; i++) {
			
			$("#qty"+i).text(orderGoodsQtyList[i] + "개");
			$("#orderGoodsQty"+i).val(orderGoodsQtyList[i] );
			
			var price = Number($("#price"+i).val());
			var discountRate = Number($("#discountRate"+i).val());
			var orderGoodsQty = Number($("#orderGoodsQty"+i).val());
			var deliveryPrice =  Number($("#deliveryPrice"+i).val());
			
			viewPaymentAmt += (price - parseInt(price * (discountRate / 100))) * orderGoodsQty + deliveryPrice;
			
			paymentAmtList += (price - parseInt(price * (discountRate / 100))) * orderGoodsQty + deliveryPrice;
			paymentAmtList += ",";
		
			totalDeliveryPrice += deliveryPrice;
			totalPoint += Number($("#point"+i).val() * Number($("#orderGoodsQty"+i).val()));
			
		}
		
		$("#totalDeliveryPrice").html(totalDeliveryPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " 원");
		$("#totalPoint").html(totalPoint.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "P 적립");
		$("#viewPaymentAmt").html(viewPaymentAmt.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " 원");
		$("[name='paymentAmtList']").val(paymentAmtList);
		$("[name='totalPoint']").val(totalPoint);
		
		
	});
	
	function setPayMethod(){
		
		var method = $("[name='payMethod']").val();
		if (method == 'card') {
			$("#cardPayMonth,#cardCompanyNm").show();
			$("#payOrdererHp").hide();
		}
		else {
			$("#cardPayMonth,#cardCompanyNm").hide();
			$("#payOrdererHp").show();
		}
		
	}
	
</script>
</head>
<body>
	 <!-- ****** Checkout Area Start ****** -->
        <div class="checkout_area section_padding_100">
            <div class="container">
             <form action="${contextPath }/order/orderCartGoods" method="post">
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
                                        <input type="text" class="form-control" name="ordererNm" id="ordererNm" value="${orderer.memberNm }">
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="ordererHp">주문자 연락처 <span>*</span></label>
                                        <input type="text" class="form-control" name="ordererHp" id="ordererHp" value="${orderer.hp }">
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="receiverNm">받는분 성함</label>
                                        <input type="text" class="form-control" name="receiverNm" id="receiverNm" value="${orderer.memberNm }">
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="receiverHp">받는분 연락처 <span>*</span></label>
                                        <input type="text" class="form-control" name="receiverHp" id="receiverHp" value="${orderer.hp }">
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <div class="checkout__order__widget">
		                                    <p>포장여부 <span>*</span></p>
												<input type="radio" id="giftWrapping" name="giftWrapping" value="yes"> 예 &emsp;
												<input type="radio" id="giftWrapping" name="giftWrapping" checked value="no"> 아니요
											<p>
	                                	</div>
                                    </div>
                                   <div class="col-md-6 mb-3">
	                                    <div class="checkout__order__widget">
		                                     <p>배송방법 <span>*</span></p>
		                                     <input type="radio" name="deliveryMethod" value="일반" checked> 일반 &emsp; 
											 <input type="radio" name="deliveryMethod" value="우체국"> 우체국 &emsp;
											 <input type="radio" name="deliveryMethod" value="퀵배송"> 퀵배송 &emsp;
		                                </div>
	                                </div>
                                   <div class="col-md-6 mb-3">
	                                    <div class="checkout__order__widget">
		                                    <p>지불 방법 <span>*</span></p>
		                                    <select name="payMethod" onchange="setPayMethod()">
		                                    	<option value="card">카드 결제</option>
		                                    	<option value="phone">휴대폰 결제</option>
		                                    </select>
                                		</div>
	                                </div>
	                                <div class="col-lg-12 col-md-12 col-sm-12 mb-3">
                            		</div>
	                                <div id="cardCompanyNm" class="col-lg-6 col-md-6 col-sm-6">
		                                <div class="checkout__order__widget">
		                                    <p>카드 회사 <span>*</span></p>
			                                <select name="cardCompanyNm">
												<option value="삼성카드">삼성</option>
												<option value="하나은행">하나은행</option>
												<option value="현대카드">현대카드</option>
												<option value="국민은행">국민은행</option>
												<option value="신한은행">신한은행</option>
												<option value="롯데카드">롯데카드</option>
												<option value="BC카드">BC카드</option>
												<option value="시티은행">시티은행</option>
												<option value="NH농협">NH농협</option>
										   </select>
		                                </div>
                           		   </div>
                       		   		<div id="cardPayMonth" class="col-lg-6 col-md-6 col-sm-6 mb-3">
		                                <div class="checkout__order__widget">
		                                    <p>할부 개월 <span>*</span></p>
		                                    <select name="cardPayMonth">
												<option value="0">일시불</option>                                    
												<option value="1">1개월</option>                                    
												<option value="2">2개월</option>                                    
												<option value="3">3개월</option>                                    
												<option value="4">4개월</option>                                    
												<option value="5">5개월</option>                                    
												<option value="6">6개월</option>                                    
		                                    </select>
		                                </div>
                          			</div>
	                                <div id="payOrdererHp" class="col-lg-6 col-md-6 col-sm-6" style="display: none">
		                                <div class="checkout__form__input">
		                                    <p>결제 휴대폰 번호 <span>*</span></p>
		                                    <input type="text" name="payOrdererHp">
		                                </div>
		                            </div>
		                            <div class="col-lg-12 col-md-12 col-sm-12 mb-3">
                            		</div>
                            		<div class="col-12 mb-3">
                            			 <div class="checkout__form__input">
		                                    <p>배송메세지 <span>*</span></p>
		                                    <input type="text" class="form-control mb-3" name="deliveryMessage" placeholder="배송메세지를 입력하세요.">
                                		</div>
                            		</div>
                            		<div class="col-md-6 mb-3">
                            			<div class="checkout__form__input">
		                                    <p>우편번호 <span>*</span></p>
		                                    <input type="text" id="postalcode" name="postalcode" value="${orderer.postalcode }" >
		                                    <input type="button" value="주소 검색" onclick="execDaumPostcode();">
		                                </div>
                            		</div>
                                    <div class="col-12 mb-3">
                                        <div class="checkout__form__input">
	                                        <label for="roadAddress">도로명 주소 <span>*</span></label>
	                                        <input type="text" class="form-control mb-3" id="roadAddress" name="roadAddress" value="${orderer.roadAddress }">
                                    	</div>
                                    </div>
                                    <div class="col-12 mb-3">
                                        <div class="checkout__form__input">
	                                        <label for="jibunAddress">지번 주소 <span>*</span></label>
	                                        <input type="text" class="form-control" id="jibunAddress" name="jibunAddress" value="${orderer.jibunAddress }">
                                    	</div>
                                    </div>
                                    <div class="col-12 mb-3">
                                     	<div class="checkout__form__input">
	                                        <label for="restAddress">나머지 주소 <span>*</span></label>
	                                        <input type="text" class="form-control" id="restAddress" name="restAddress" value="${orderer.restAddress }">
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
                                <p>주문 상세내역</p>
                            </div>

                            <ul class="order-details-form mb-4">
                            	<ul>
	                                <li>
	                                      <span class="top__text">주문상품</span>
	                                      <span class="top__text__right">주문수량</span>
	                                      <span class="top__text__right">상품가격&emsp;</span>
	                                 </li>
                                 	<c:set var="point" value="0"/>
                                    <c:forEach var="goodsDto" items="${goodsList }" varStatus="i">
	                                     <c:set var="point" value="${point + goodsDto.point }"/>
	                            		 <li>
	                                     	${i.index + 1}.&nbsp; ${goodsDto.goodsNm } 
	                                      <span id="qty${i.index }"></span>
	                                      <span><fmt:formatNumber value="${goodsDto.price - goodsDto.price * goodsDto.discountRate / 100}"/>원 &emsp;</span>
	                                      <input type="hidden" id="price${i.index }" value="${goodsDto.price}" />
	                                      <input type="hidden" id="discountRate${i.index }" value="${goodsDto.discountRate}" />
	                                      <input type="hidden" id="orderGoodsQty${i.index }"/>
	                                      <input type="hidden" id="deliveryPrice${i.index }" value="${goodsDto.deliveryPrice}" />
	                                      <input type="hidden" id="point${i.index }" value="${goodsDto.point}" />
	                                     </li>
                                    </c:forEach>
                                    <br>
		                            <li>배송비 <span id="totalDeliveryPrice"></span></li>
		                            <li>적립 포인트 <span id="totalPoint"></span></li>
		                       </ul>     
		                            <input type="hidden" name="goodsCdList" value="${goodsCdList }">
	              					<input type="hidden" name="orderGoodsQtyList" value="${orderGoodsQtyList}">		
	              					<input type="hidden" name="cartCdList" value="${cartCdList}">		
	              					<input type="hidden" name="memberId" value="${orderer.memberId}">
	              					<input type="hidden" name="paymentAmtList">
	              					<input type="hidden" name="totalPoint" value="${totalPoint }">
                            </ul>
                            <ul class="order-details-form mb-4">
                                    <li>Total <span id="viewPaymentAmt"></span></li>
                            </ul>
                           
                            <div id="accordion" role="tablist" class="mb-4">
                                <div class="card">
                                    <div class="card-header" role="tab" id="headingOne">
                                        <h6 class="mb-0">
                                            <a data-toggle="collapse" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne"><i class="fa fa-circle-o mr-3"></i>개인정보 제공동의 안내</a>
                                        </h6>
                                    </div>

                                    <div id="collapseOne" class="collapse" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion">
                                        <div class="card-body">
                                            <p>필수 개인정보 제공 동의(판매자)
												ITings 회원 계정으로 ITings를 이용하여 ITings 에서 제공하는 상품 및 서비스를 구매하고자 할 경우, ITings는 거래 당사자간 원활한 의사소통 및 배송, 상담 등 거래이행을 위하여 필요한 최소한의 개인정보를 아래와 같이 제공하고 있습니다.
												
												1. 개인정보를 제공받는 자 : 상품 및 서비스 판매자
												2. 제공하는 개인정보 항목 : 이름, ITings 아이디, (휴대)전화번호, 상품 구매정보,결제수단, 상품 수령인 정보(배송상품:수령인명, 주소, (휴대)전화번호/ E쿠폰:이름, ITings 아이디, 휴대전화번호)
												3. 개인정보를 제공받는 자의 이용목적 : 판매자와 구매자의 원활한 거래 진행, 본인의사의 확인, 고객상담 및 불만처리/부정이용 방지 등의 고객관리, 물품배송, 새로운 상품/서비스 정보와 고지사항의 안내, 상품/서비스 구매에 따른 혜택 제공
												4. 개인정보를 제공받는 자의 개인정보 보유 및 이용기간 : 개인정보 이용목적 달성 시까지 보존합니다. 단, 관계 법령의 규정에 의하여 일정 기간 보존이 필요한 경우에는 해당 기간만큼 보관 후 삭제합니다.
												위 개인정보 제공 동의를 거부할 권리가 있으나, 거부 시 ITings를 이용한 상품 및 디지털 콘텐츠 구매가 불가능합니다. 그 밖의 내용은 ITings 의 자체 이용약관 및 개인정보처리방침에 따릅니다.</p>
                                        </div>
                                    </div>
                                </div>
                               
                            </div>
                            <button type="submit" class="btn karl-checkout-btn">주문하기</button>
                        </div>
                    </div>

                </div>
                </form>
            </div>
        </div>
        <!-- ****** Checkout Area End ****** -->
</body>
</html>