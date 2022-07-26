<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>같이사자</title>
    <link rel="stylesheet" href="<%=cp %>/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="<%=cp %>/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="<%=cp %>/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="<%=cp %>/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="<%=cp %>/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="<%=cp %>/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="<%=cp %>/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="<%=cp %>/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="<%=cp %>/css/userStyle.css" type="text/css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	
<style type="text/css">
.sidebar__item ul li:last-child {
	background-color: #f5f3ed;
}
.sidebar__item ul li:last-child a {
	color: #fc9942;
}
.sidebar__item ul li:last-child a i {
	color: #fc9942;
}
</style>
</head>
<body>
	<!-- import HEADER -->
	<c:import url="user_header.jsp"></c:import>

	<section class="product spad cscenterSection">
		<div class="container">
			<div class="row">

				<!-- import CScenter_MENUBAR -->
				<c:import url="user_cscenter_menubar.jsp"></c:import>

				<div class="col-lg-9 col-md-7">
					<div class="product__discount">
						<div class="section-title product__discount__title">
							<h2>1:1 문의</h2>
						</div>
					</div>

					<button type="button" class="btn btn-primary inquiryBtn"
							onclick="location.href='user_cscenter_insertIqArticle.lion'">문의하기</button>
					<table class="table noticeTable">
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">제목</th>
								<th scope="col">작성일</th>
								<th scope="col">답변상태</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="userInqueryList" items="${list }">
							<tr>
								<th scope="row">${userInqueryList.num }</th>
								<td class="title"><a href="user_cscenter_listIqArticle.lion?inquiry_code=${userInqueryList.inquiry_code }">${userInqueryList.title }</a></td>
								<td>${userInqueryList.write_datetime }</td>
								<td>${userInqueryList.state }</td>
							</tr>
						 
							</c:forEach>
						</tbody>
					</table>

					<!-- page navigation -->
					<nav class="pageNav" aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<li class="page-item"><a class="page-link"
								href="javascript:void(0);" aria-label="Previous"> <span
									aria-hidden="true">&laquo;</span>
							</a></li>
							<li class="page-item"><a class="page-link"
								href="javascript:void(0);">1</a></li>
							<li class="page-item"><a class="page-link"
								href="javascript:void(0);">2</a></li>
							<li class="page-item"><a class="page-link"
								href="javascript:void(0);">3</a></li>
							<li class="page-item"><a class="page-link"
								href="javascript:void(0);">4</a></li>
							<li class="page-item"><a class="page-link"
								href="javascript:void(0);">5</a></li>
							<li class="page-item"><a class="page-link"
								href="javascript:void(0);" aria-label="Next"> <span
									aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>

				</div>
			</div>
		</div>
	</section>

	<!-- import FOOTER -->
	<c:import url="user_footer.jsp"></c:import>

	<!-- js plugins -->
    <script src="<%=cp %>/js/jquery-3.3.1.min.js"></script>
    <script src="<%=cp %>/js/bootstrap.min.js"></script>
    <script src="<%=cp %>/js/jquery.nice-select.min.js"></script>
    <script src="<%=cp %>/js/jquery-ui.min.js"></script>
    <script src="<%=cp %>/js/jquery.slicknav.js"></script>
    <script src="<%=cp %>/js/owl.carousel.min.js"></script>
    <script src="<%=cp %>/js/main.js"></script>
</body>

</html>