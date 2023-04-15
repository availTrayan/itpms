<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입정보</title>
<script>

	$().ready(function(){
		
		var dateBirth = $("[name='dateBirth']").val().split("-");
		$("#birthY").val(dateBirth[0]);
		$("#birthM").val(dateBirth[1]);
		$("#birthD").val(dateBirth[2]);
		
		$("form").submit(function(){
			var dateBirth = $("#birthY").val() + "-" + $("#birthM").val() + "-" + $("#birthD").val();
			$("[name='dateBirth']").val(dateBirth);
		});
		
	});
	
	function removeMember(){
		if (confirm("회원가입을 탈퇴하시겠습니까?")) {
			location.href = "${contextPath}/myPage/removeMember?memberId=" + $("#memberId").val();
		}
	}

</script>
</head>
<body>
		<c:if test="${sessionScope.memberId eq null}">
			<script>
					alert("로그인이 필요합니다!");
					location.href = "${contextPath}/member/login";
			</script>
		</c:if>
	<!-- ****** Checkout Area Start ****** -->
        <div class="checkout_area section_padding_100">
            <div class="container">
            <div align="center" class="mb-4">
        		<h4><b>가입 정보</b></h4>
        	</div>
                <div class="row">

                    <div class="col-12 col-md-6">
                        <div class="checkout_details_area mt-50 clearfix">

                            <div class="cart-page-heading">
                                <h5>회원정보</h5>
                                <p>회원정보를 수정할수있습니다.</p>
                            </div>

                             <form action="${contextPath }/myPage/modifyInfo" method="post">
                        		<div class="row">
                                    <div class="col-md-6 mb-4">
                                        <p>아이디 <span style="color:red;">*</span></p>
                                    	<input type="text" class="form-control" id="memberId" name="memberId" value="${memberDto.memberId }" readonly>
                            		</div>
                                    <div class="col-md-6 mb-4">
                                    	<p>이름 <span style="color:red;">*</span></p>
                                    	<input type="text" class="form-control" name="memberNm" value="${memberDto.memberNm }">
                                	</div>
                                    <div class="col-md-6 mb-4">
	                                    <p>비밀번호 <span style="color:red;">*</span></p>
	                                    <input type="password" class="form-control" name="passwd" value="${memberDto.passwd }" readonly>
                               		 </div>
                                    <div class="col-md-6 mb-4">
                                    	<p>포인트 <span style="color:red;">*</span></p>
                                    	<input type="text" class="form-control" name="point" value="${memberDto.point }" readonly>
                                	</div>
                               		<div class="col-md-6 mb-4">
		                               	<div class="checkout__form__checkbox">
		                                    <p>성별 <span style="color:red;">*</span></p>
		                                    남 &nbsp;<input type="radio" name="sex" value="m" <c:if test="${memberDto.sex eq 'm'}">checked</c:if>> &emsp;
		                                    여 &nbsp;<input type="radio" name="sex" value="f" <c:if test="${memberDto.sex eq 'f'}">checked</c:if>>
		                                </div>
                           		 	</div>
                                    <div class="col-md-6 mb-4">
		                                <div class="checkout__form__input">
		                                    <p>생년월일 <span>*</span></p>
		                                    <select id="birthY">
		                                    	<c:forEach var="i" begin="0" end="2022" >
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
		                                    <input type="hidden" name="dateBirth" value="${memberDto.dateBirth }"/>
		                                </div>
                            		</div>
                                    <div class="col-12 mb-3">
	                                    <p>전화번호 <span style="color:red;">*</span></p>
	                                    <input type="text" class="form-control" name="hp" value="${memberDto.hp }">
                                    </div>
                                   <div class="col-12 mb-4">
	                                    <div class="checkout__order__widget">
		                                    <label for="smsstsYn">
		                                        ITings의 소식을 문자로 수신합니다.
		                                        <input type="checkbox" id="smsstsYn" name="smsstsYn" value="Y" <c:if test="${memberDto.smsstsYn eq 'Y'}">checked</c:if>>
		                                        <span class="checkmark"></span>
		                                    </label>
	                                    </div>
                          			</div>
	                               <div class="col-12 mb-3">
	                                    <p>이메일 <span style="color:red;">*</span></p>
	                                    <input type="text" class="form-control" name="email" value="${memberDto.email }">
	                                </div>
	                                <div class="col-12 mb-4">
	                                    <div class="checkout__order__widget">
	                                    	<label for="emailstsYn">
		                                        ITings의 소식을 이메일로 수신합니다.
		                                        <input type="checkbox" id="emailstsYn" name="emailstsYn" value="Y" <c:if test="${memberDto.emailstsYn eq 'Y'}">checked</c:if>>
	                                        	<span class="checkmark"></span>
	                                    	</label>
                                   		 </div>
                               		 </div>
	                                <div class="col-12 mb-2">
	                                    <p>우편번호 <span style="color:red;">*</span></p>
	                                    <input type="text" class="form-control" id="postalcode" name="postalcode" value="${memberDto.postalcode }" >
                                        <input type="button" class="btn karl-checkout-btn" value="검색" onclick="execDaumPostcode();">
	                                </div>
	                                <div class="col-12 mb-2">
	                                    <p>도로명 주소 <span style="color:red;">*</span></p>
	                                    <input type="text" class="form-control" id="roadAddress" name="roadAddress" value="${memberDto.roadAddress }">
	                                </div>
	                                <div class="col-12 mb-2">
	                                    <p>지번 주소 <span style="color:red;">*</span></p>
	                                    <input type="text" class="form-control" id="jibunAddress" name="jibunAddress" value="${memberDto.jibunAddress }">
	                                </div>
	                                <div class="col-12 mb-4">
	                                    <p>나머지 주소 <span style="color:red;">*</span></p>
	                                    <input type="text" class="form-control" id="restAddress" name="restAddress" value="${memberDto.restAddress }">
	                                </div>                            
	                   				<div class="col-md-6">
	                                     <button type="submit" class="btn karl-checkout-btn">수정확인</button>
	                                </div>
				                	<div class="col-md-6">
		                                 <button type="button" class="btn karl-checkout-btn" onclick="javascript:removeMember();">회원탈퇴</button>
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