<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script>

	$().ready(function() {
	
		$("#btnOverlapped").click(function(){
			
		    var memberId = $("#memberId").val();
		   
		    if (memberId == ''){
		   		alert("ID를 입력하세요");
		   		return;
		    }
		   
		    $.ajax({
		       type : "get",
		       url  : "${contextPath}/member/checkDuplicatedId?memberId=" + memberId,
		       success : function (data){
		          if (data == "notDuplicated"){
					  alert("사용할 수 있는 ID입니다.");
		          }
		          else {
		          	  alert("사용할 수 없는 ID입니다.");
		          }
		       }
		    });
		    
		 });	
		
		
		$("form").submit(function(){
			
			if ($("#memberId").val() == '') {
				alert("아이디를 입력하세요.");
				$("#memberId").focus();
				return false;
			}
			
			if ($("#passwd").val() == "") {
				alert("비밀번호를 입력하세요.");
				$("#passwd").focus();
				return false;
			}
			
			if ($("#confirmPasswd").val() != $("#passwd").val()) {
				alert("비밀번호를 확인하세요.");
				$("#passwd").focus();
				return false;
			}
			
			if ($("#memberNm").val() == "") {
				alert("이름을 입력하세요.");
				$("#memberNm").focus();
				return false;
			}
			
			if ($("#hp").val() == "") {
				alert("연락처를 입력하세요.");
				$("#hp").focus();
				return false;
			}
			
			if ($("#email").val() == "") {
				alert("이메일을 입력하세요.");
				$("#email").focus();
				return false;
			}
			
			if ($("#roadAddress").val() == "") {
				alert("도로명 주소를 입력하세요.");
				$("#roadAddress").focus();
				return false;
			}
			
			if ($("#jibunAddress").val() == "") {
				alert("지번 주소를 입력하세요.");
				$("#jibunAddress").focus();
				return false;
			}
			
			if ($("#restAddress").val() == "") {
				alert("나머지 주소를 입력하세요.");
				$("#restAddress").focus();
				return false;
			}
			
			var dateBirth = $("#birthY").val() + "-" + $("#birthM").val() + "-" + $("#birthD").val();
			$("[name='dateBirth']").val(dateBirth);
			
			if ($("#smsstsYn").val() != "Y") {
				$(this).val("N");
			}
			if ($("#emailstsYn").val() != "Y") {
				$(this).val("N")
			}
			if ($("[name='useAgreementYn']:checked").val() != "Y") {
				alert("이용 약관에 동의하셔야 합니다.");
				$("#useAgreementYn").focus();
				return false;
			}
		
			if ($("[name='personalAgreementYn']:checked").val() != "Y") {
				alert("개인정보 수집 및 이용 동의하셔야 합니다.");
				$("#personalAgreementYn").focus();
				return false;
			}
		
		});
	
	});
	
</script>
</head>
<body>
	<!-- ****** Checkout Area Start ****** -->
        <div class="checkout_area section_padding_100">
            <div class="container">
                <div class="row">

                    <div class="col-12 col-md-6">
                        <div class="checkout_details_area mt-50 clearfix">

                            <div class="cart-page-heading">
                                <h5>회원가입</h5>
                            </div>

                            <form action="${contextPath}/member/register" method="post">
                                <div class="row">
                                    <div class="col-md-6 mb-4">
                                        <p>아이디 <span style="color:red;">*</span></p>
                                        <input type="text" class="form-control" name="memberId" id="memberId" placeholder="아이디를 입력하세요.">
                                    </div>
                                    <div class="col-md-5 mb-4">
                                    	<label for="btnOverlapped">아이디 중복여부를 확인해주세요.</label>
                                    	<input type="button" id = "btnOverlapped" value="중복확인" class="btn karl-checkout-btn" >
                                     </div>
                                    <div class="col-md-6 mb-4">
                                        <p>비밀번호 <span style="color:red;">*</span></p>
                                        <input type="password" class="form-control" name="passwd" id="passwd" placeholder="비밀번호를 입력하세요.">
                                    </div>
                                    <div class="col-md-6 mb-4">
                                        <p>비밀번호 확인 <span style="color:red;">*</span></p>
                                        <input type="password" class="form-control" id="confirmPasswd" placeholder="비밀번호를 한번 더 입력하세요." >
                                    </div>
                                    
                                    <div class="col-12 mb-4">
                                    	<p>이름 <span style="color:red;">*</span></p>
                                        <input type="text" class="form-control" name="memberNm" id="memberNm" placeholder="성함을 입력하세요.">
                                    </div>
                                    
                                    <div class="col-md-6 mb-4">
		                               <div class="checkout__order__widget">
		                                    <p>성별 <span style="color:red;">*</span></p>
		                                    남 &nbsp;<input type="radio" name="sex" value="m"> &emsp;
		                                    여 &nbsp;<input type="radio" name="sex" value="f">
		                                </div>
                            		</div>
                                    <div class="col-md-6 mb-4">
                                		<div class="checkout__order__widget">
                                    		<p>생년월일 <span style="color:red;">*</span></p>
                                    		<select id="birthY">
		                                    	<c:forEach var="i" begin="0" end="${2022-1940}" >
		                                    		<option>${2022 - i}</option>
		                                    	</c:forEach>
                                    		</select>년 
                                    		<select id="birthM">
                                    			<c:forEach var="i" begin="1" end="12" >
                                    				<c:choose>
			                                    		<c:when test="${i < 10 }">
				                                    		<option>0${i}</option>
			                                    		</c:when>
			                                    		<c:otherwise>
				                                    		<option>${i}</option>
			                                    		</c:otherwise>
                                    				</c:choose>
                                    			</c:forEach>
		                                    </select>월
		                                    <select id="birthD">
		                                    	<c:forEach var="i" begin="1" end="31" >
		                                    		<c:choose>
			                                    		<c:when test="${i < 10 }">
				                                    		<option>0${i}</option>
			                                    		</c:when>
			                                    		<c:otherwise>
				                                    		<option>${i}</option>
			                                    		</c:otherwise>
		                                    		</c:choose>
		                                    	</c:forEach>
		                                    </select>일	
		                                    <input type="hidden" name="dateBirth"/>
		                                </div>
		                            </div>
                                    <div class="col-12 mb-3">
                                        <p>전화번호 <span style="color:red;">*</span></p>
                                        <input type="text" class="form-control" name="hp" id="hp" placeholder="-를 포함해 입력해주세요.">
                                    </div>
	                               <div class="col-12 mb-4">
	                                     	<div class="custom-control custom-checkbox d-block mb-2">
                                            	<input type="checkbox" class="custom-control-input" name="smsstsYn" id="smsstsYn" value="Y">
                                            	<label class="custom-control-label" for="smsstsYn">ITings의 소식을 문자로 수신합니다.</label>
                                       		</div>
                                    </div>
                                    <div class="col-12 mb-3">
                                        <p>이메일 <span style="color:red;">*</span></p>
                                        <input type="email" class="form-control" name="email" id="email" value="">
                                    </div>
                                    <div class="col-12 mb-4">
	                                    <div class="custom-control custom-checkbox d-block">
	                                        <input type="checkbox" class="custom-control-input" name="emailstsYn" id="emailstsYn" value="Y">
	                                        <label class="custom-control-label" for="emailstsYn">ITings의 소식을 이메일로 수신합니다.</label>
	                                    </div>
                                    </div>
                                    <div class="col-12 mb-2">
                                        <p>우편번호 <span style="color:red;">*</span></p>
                                        <input type="text" id="postalcode" name="postalcode">
                                   		<input type="button" value="검색" onclick="execDaumPostcode();" style="width: 10%; padding-left: 0">
                                    </div>
                                    <div class="col-12 mb-2">
                                        <label for="street_address">도로명 주소 <span>*</span></label>
                                        <input type="text" class="form-control" name="roadAddress" id="roadAddress">
                                    </div>
                                    <div class="col-12 mb-2">
                                        <label for="street_address">지번 주소 <span>*</span></label>
                                        <input type="text" class="form-control" name="jibunAddress" id="jibunAddress" >
                                    </div>
                                      <div class="col-12 mb-4">
                                        <label for="street_address">나머지 주소 <span>*</span></label>
                                        <input type="text" class="form-control mb-3" name="restAddress" id="restAddress">
                                    </div>
                                    <div class="col-12 mb-4">
                                   	   <div class="custom-control custom-checkbox d-block mb-2">
											<input type="checkbox" class="custom-control-input" name="useAgreementYn" id="useAgreementYn" value="Y">
											<label class="custom-control-label" for="useAgreementYn">이용 약관 동의</label> 
										</div>
                                            <textarea rows="5" cols="72">
                                            
여러분은 본 약관을 읽고 동의하신 후 회원 가입을 신청하실 수 있으며, ITings는 이에 대한 승낙을 통해 회원 가입 절차를 완료하고 여러분께 ITings 서비스 이용 계정(이하 ‘계정’)을 부여합니다. 계정이란 회원이 ITings 서비스에 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원 별로 관리하기 위해 설정한 회원 식별 단위를 말합니다. 회원은 자신의 계정을 통해 좀더 다양한 ITings 서비스를 보다 편리하게 이용할 수 있습니다.
											</textarea>
                                    </div>
                                    <div class="col-12 mb-4">
                                    	<div class="custom-control custom-checkbox d-block mb-2">
											<input type="checkbox" class="custom-control-input" name="personalAgreementYn" id="personalAgreementYn" value="Y">
                                            <label class="custom-control-label" for="personalAgreementYn">개인정보 활용 동의</label> 
										</div>
                                            <textarea rows="5" cols="72">
                                            
개인정보보호법에 따라 ITings에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
											</textarea>
                                    </div>
                                     <div class="col-md-6">
                                       <button type="submit" class="btn karl-checkout-btn" id="formValidationCheck">회원가입</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>


                </div>
            </div>
        </div>
        <!-- ****** Checkout Area End ****** -->
</body>
</html>