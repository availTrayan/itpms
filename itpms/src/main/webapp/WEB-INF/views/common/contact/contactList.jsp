<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>

	function removeContact() {
		
		
		var contactCdList = "";
		if (confirm("정말로 삭제하시겠습니까?")) {
			
			$("[name='contactCd']:checked").each(function(){
				contactCdList += $(this).val() + ",";
			});
			
			if (contactCdList == "") {
				alert("삭제할 내역이 없습니다.");
				return;
			}
			
			location.href = "${contextPath}/removeContact?contactCdList="+contactCdList;
		}
		
	}
	
	function selectAllContact() {
		if ($("#changeAllChoice").prop("checked")) {
			$("[name='contactCd']").prop("checked" , true);
		}
		else {
			$("[name='contactCd']").prop("checked" , false);
		}
	}	
	
</script>
<title>문의내역 관리</title>
</head>
<body>
	  <!-- ****** Cart Area Start ****** -->
	      <section class="shop-cart spad">
            <div class="container">
            <div align="center" class="mb-4">
	            <h4><b>문의내역</b></h4>
            </div>
            <div class="row">	
                <div class="col-lg-12">
	            	
                    <div class="shop__cart__table">
                       	<h6><input type="checkbox" id="changeAllChoice" onchange="selectAllContact()"> &nbsp;전체선택</h6>
                    	<br>
                        <table>
                            <thead>
                                <tr>
                                    <th width="5%"></th>
                                    <th width="40%">문의제목</th>
                                    <th width="20%">문의자</th>
                                    <th width="20%">메일</th>
                                    <th width="15%">등록일</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:choose>
                            		<c:when test="${empty contactList}">
                            			<tr>
                            				<td colspan="5" align="center"><h6>등록된 문의가 없습니다.</h6></td>
                            			</tr>
                            		</c:when>
                            		<c:otherwise>
		                            	<c:forEach var="contactDto" items="${contactList }">
		                            		 <tr>
		                            		 	<td><input type="checkbox" name="contactCd" value="${contactDto.contactCd }"></td>
                                    			<td class="cart__product__item">
		                                            <h6><a href="${contextPath }/contactDetail?contactCd=${contactDto.contactCd}">${contactDto.content }</a></h6>
			                                    </td>
			                                    <td>${contactDto.name }</td>
			                                    <td>${contactDto.email }</td>
			                                    <td class="cart__total"><fmt:formatDate value="${contactDto.regDt }" pattern="yyyy-MM-dd"/> </td>
			                                </tr>
		                            	</c:forEach>
                            		</c:otherwise>
                            	</c:choose>
                            </tbody>
                        </table>
                    </div>
                    <div class="cart__btn update__btn" align="right">
						<a href="javascript:removeContact();"><span class="icon_close"></span>문의 삭제</a>
					</div>
                </div>
            </div>
        </div>
        </section>
   
        <!-- ****** Cart Area End ****** -->

</body>
</html>