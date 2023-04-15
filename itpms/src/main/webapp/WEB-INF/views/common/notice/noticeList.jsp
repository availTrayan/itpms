<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>

	function removeNotice() {
		
		
		var noticeCdList = "";
		if (confirm("정말로 삭제하시겠습니까?")) {
			
			$("[name='noticeCd']:checked").each(function(){
				noticeCdList += $(this).val() + ",";
			});
			
			if (noticeCdList == "") {
				alert("삭제할 내역이 없습니다.");
				return;
			}
			
			location.href = "${contextPath}/removeNotice?noticeCdList=" + noticeCdList;
		}
		
	}
	
	
	
</script>
<title>공지사항</title>
</head>
<body>
	  <!-- ****** Cart Area Start ****** -->
	      <section class="shop-cart spad">
            <div class="container">
            <div align="center" class="mb-4">
	            <h4><b>공지 게시판</b></h4>
            </div>
            <div class="row">	
                <div class="col-lg-12">
	            	
                    <div class="shop__cart__table">
                    	<br>
                        <table>
                            <thead>
                                <tr>
                                    <th width="5%"></th>
                                    <th width="40%">공지제목</th>
                                    <th width="20%">등록자</th>
                                    <th width="15%">공지 등록일</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:choose>
                            		<c:when test="${empty noticeList}">
                            			<tr>
                            				<td colspan="5" align="center"><h6>등록된 공지가 없습니다.</h6></td>
                            			</tr>
                            		</c:when>
                            		<c:otherwise>
		                            	<c:forEach var="noticeDto" items="${noticeList }">
		                            		 <tr>
		                            		 	<td><input type="checkbox" name="noticeCd" value="${noticeDto.noticeCd }"></td>
                                    			<td class="cart__product__item">
		                                            <h6><a href="${contextPath }/noticeDetail?noticeCd=${noticeDto.noticeCd}">${noticeDto.subject }</a></h6>
			                                    </td>
			                                    <td>관리자</td>
			                                    <td class="cart__total"><fmt:formatDate value="${noticeDto.regDt }" pattern="yyyy-MM-dd"/> </td>
			                                </tr>
		                            	</c:forEach>
                            		</c:otherwise>
                            	</c:choose>
                            </tbody>
                        </table>
                    </div>
                    <c:choose>
						<c:when test="${sessionScope.role eq 'admin' }">      
						             
		                    <div class="cart__btn update__btn" align="right">
								<a href="javascript:removeNotice();"><span class="icon_close"></span>공지 삭제</a>
							</div>
		                    <div class="cart__btn update__btn" align="right">
								<a href="${contextPath }/notice"><span class="icon_plus"></span>공지 등록</a>
							</div>
							
                    	</c:when>
                    </c:choose>
                </div>
            </div>
        </div>
        </section>
   
        <!-- ****** Cart Area End ****** -->

</body>
</html>