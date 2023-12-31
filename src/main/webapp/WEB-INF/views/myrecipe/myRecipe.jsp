<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	 isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://kit.fontawesome.com/3e352a9905.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/myRecipe.css">
	<script>
function deleteRecipe(recipeId) {
    // 삭제 요청을 보냅니다.
    $.ajax({
        type: "POST",
        url: "${contextPath}/recipe/deletemyRecipe",
        data: { recipeId: recipeId },
        success: function(response) {
            if (response.success) {
                alert("레시피가 성공적으로 삭제되었습니다.");
            } else {
                alert("레시피 삭제 중 오류가 발생했습니다.");
            }
        },
        error: function() {
            alert("요청 처리 중 오류가 발생했습니다.");
        }
    });
}
</script>
	
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<%@ include file="/WEB-INF/views/common/CommonHeader.jsp" %>
<body>
	<section class="recipes">
		<h1>${memberLoggedIn}의 레시피</h1>
		<div class="containner">
			<c:forEach var="recipeSummary" items="${recipeSummary}">
				<div class="recipe">
				
					<a href="${contextPath}/recipe/recipeInfo?recipeId=${recipeSummary.recipeId}">
						<img src="${contextPath}/resources/img/recipe/${recipeSummary.image}">
					</a>
						<h3>${recipeSummary.recipeName}</h3>
						<p>${recipeSummary.summary}</p>
						<p>${recipeSummary.nationName},${recipeSummary.levelName},${recipeSummary.typeName}</p>
					
					<!--  <a href="${contextPath}/recipe/updatemyRecipeForm?recipeId=${recipeSummary.recipeId}" class="edit-button">수정</a>-->
    				<a href="javascript:void(0);" onclick="deleteRecipe(${recipeSummary.recipeId});" class="delete-button">삭제</a>
					
				</div>
			</c:forEach>
		</div>
		<div class="pagination" style="display: block; text-align: center;">		
			<c:if test="${paging.startPage != 1}">
				<a href="${contextPath}/recipe/recipeForm?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}">&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage}">
						<b>${p}</b>
					</c:when>
					<c:when test="${p != paging.nowPage}">
						<a href="${contextPath}/recipe/recipeForm?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<a href="${contextPath}/recipe/recipeForm?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}">&gt;</a>
			</c:if>
		</div>
	</section>
</body>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>