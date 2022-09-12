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

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
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

.inquiry-container.notice-container {
    background-color: #e6e3e3;
    border-radius: 10px;
    padding: 50px 40px;
    width: 800px;
    margin-left: auto;
    margin-right: auto;
}

p {
    margin-top: 0;
    margin-bottom: 1rem;
}

h2, .h2 {
    font-size: calc(1.325rem + 0.9vw);
}
h6, .h6, h5, .h5, h4, .h4, h3, .h3, h2, .h2, h1, .h1 {
    margin-top: 0;
    margin-bottom: 0.5rem;
    font-weight: 500;
    line-height: 1.2;
}
 
button.adminBtn.listBtn {  
    width: 55px;
    height: 32px;
    border: none;
    border-radius: 8px;
    background-color: #969799;
    color: #fff;
    font-size: 16px;
 	float:right;
} 

.btn-container {
    text-align: center;
}

/* sweetalert */
h2#swal2-title {
    font-size: 23px;
    padding-top: 40px;
    padding-bottom: 10px;
}
button.swal2-confirm.swal2-styled {
    background-color: #fca652;
    width: 100px;
    margin-right: 20px;
}
button.swal2-confirm.swal2-styled:focus {
    box-shadow: none;
}
</style>
<script>

	$(document).ready(function()
    {
    	$(".cancelBtn").click(function()
		{
    		Swal.fire({
    			  title: '삭제 완료!',
    			  icon: 'success',
    			  confirmButtonText: '확인'
    			}).then(() => {
    				location.href='user_cscenter_inquiryMain.jsp';
    			})
		});

    });	
</script>
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
							<h2>공지사항</h2>
							<hr class="inquiry-hr"/>
						</div>
					</div> 	
					
						<div class="card-body">
							<div class="inquiry-container notice-container">
							
							<c:forEach var="userNoticeArticle" items="${article }">
								<h2 class="title">${userNoticeArticle.title }</h2>
								
								<div class="helper"></div><div class="info-container">
									<br><h5 style="text-align: right";>등록일: ${userNoticeArticle.write_day }</h5>
									<h5 style="text-align: right";>작성자: 가치사자</h5><br>
								
								</div>
								<p>
<c:forTokens items="${userNoticeArticle.content }" delims="." var="content" >  
	<c:out value="${content}"/> 
</c:forTokens>   
								</p> 
							</c:forEach>
								<!-- <h2 class="title">시스템 점검 안내</h2>
								
								<div class="helper"></div><div class="info-container">
									<br><h5 style="text-align: right";>등록일: 2022-05-04</h5>
									<h5 style="text-align: right";>작성자: yong_qo_oa</h5><br>
								
								</div>
								<p>
								안녕하세요 고객님, 가치사자입니다. <br /><br />
								보다 안정적인 서비스 제공을 위해 서버 점검을 시행할 예정입니다. <br />
								점검 시간 동안은 서비스 이용이 중단되오니, <br />
								고객님의 양해 부탁드립니다. <br /><br />
								점검 일시 : 5월 15일 일요일 02시 ~ 05시 (약3시간) <br />
								*점검 시간은 공지보다 다소 길어질 수 있습니다. <br /><br />
								
								감사합니다. <br />
								가치사자 드림. <br />
								</p> -->
								
							</div> 
							<div>
								<div class="noticeArticle-helper"></div>
								<br>
								<button type="button" class="adminBtn listBtn"
								onclick="location.href='admin_homepage_noticeList.jsp'">목록</button>
							</div>
						</div>
					 
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