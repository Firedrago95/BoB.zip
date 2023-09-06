<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	 isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<script src="https://kit.fontawesome.com/3e352a9905.js" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<body>
	<section class="recipes">
		<div class="containner">
			<c:forEach var="recipeSummary" items="${recipeSummary}">
				<div class="recipe">
					<a href="${contextPath}/recipe/recipeInfo">
						<img src="${contextPath}/resources/img/recipe/${recipeSummary.image}">
						<h5>${recipeSummary.recipeName}</h5>
						<p>${recipeSummary.summary}</p>
						<p>${recipeSummary.nationName}</p>
						<p>${recipeSummary.levelName}</p>
						<p>${recipeSummary.typeName}</p>
					</a>
				</div>
			</c:forEach>
		</div>
		<div style="display: block; text-align: center;">		
			<c:if test="${paging.startPage != 1 }">
				<a href="${contextPath}/recipe/recipeForm?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage }">
						<b>${p }</b>
					</c:when>
					<c:when test="${p != paging.nowPage }">
						<a href="${contextPath}/recipe/recipeForm?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<a href="${contextPath}/recipe/recipeForm?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
			</c:if>
		</div>
	</section>
</body>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</html>