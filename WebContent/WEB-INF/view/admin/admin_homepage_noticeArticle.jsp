<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>admin같이사자</title>

<link href="<%=cp %>/css/adminStyle.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="<%=cp %>/js/scripts.js"></script>

<style type="text/css">
.sb-sidenav-menu a.current-menu {
    background-color: #f5f4f2;
    color: #fca652 !important;
}
 
button.adminBtn.listBtn { 
    width: 120px;
    height: 40px;
    font-size: 18px;
    background-color: #969799;
} 
 

/* sweetalert */

h2#swal2-title {
    font-size: 23px;
    padding-top: 40px;
    padding-bottom: 10px;
}
input.swal2-input {
    margin-bottom: 10px;
}
input.swal2-input:focus {
    box-shadow: none;
    border: 2px solid #fca652;
}
button.swal2-confirm.swal2-styled {
    background-color: #fca652;
    width: 100px;
    margin-right: 20px;
}
button.swal2-cancel.swal2-styled {
    width: 100px;
    margin-right: 20px;
}
button.swal2-confirm.swal2-styled:focus {
    box-shadow: none;
}
button.swal2-cancel.swal2-styled:focus {
    box-shadow: none;
}

</style>	
<script>
	$(document).ready(function()
    {
    	$(".cancelBtn").click(function()
		{
    		Swal.fire({
    			  title: '공지사항을 삭제하시겠습니까?',
    			  icon: 'warning',
    			  iconColor: '#f27474',
    			  showCancelButton: true,
    			  confirmButtonText: '삭제',
    			  cancelButtonText: '취소',
    			  reverseButtons: true
    			}).then((result) => {
    				if (result.isConfirmed) {
    					
      				  // Delete 작업 처리 코드 작성하기!
      		    		
      		    		
    		    	  // Delete 완료 후, 띄울 알림창
      				  Swal.fire({
        			    	title: '삭제 완료!',
        			    	icon: 'success',
        			    	confirmButtonText: '확인'
        			    }).then(() => {
        			    	
        			    	var code = $("#code").val();
        			    	location.href='ad_notice_delete.lion?code='+code;
        			    });
  		    	  }
    			})
		});

    });	
	
</script>
</head>
<body class="sb-nav-fixed">

	<!-- import HEADER -->
	<c:import url="admin_header.jsp"></c:import>

	<div id="layoutSidenav">

		<!-- menubar -->
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-light"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">MENU</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#member" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fa-solid fa-user icon"></i>
							</div> 회원조회
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="member" aria-labelledby="headingOne"
							data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="admin_member_all.jsp">전체회원</a> 
								<a class="nav-link" href="admin_member_permanentBan.jsp">영구정지회원</a> 
								<a class="nav-link" href="admin_member_sleep.jsp">휴면회원</a> 
								<a class="nav-link" href="admin_member_withdrawal.jsp">탈퇴회원</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#point" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fa-solid fa-sack-dollar icon"></i>
							</div> 포인트조회
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="point" aria-labelledby="headingTwo"
							data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="admin_point_charge.jsp">포인트충전</a> 
								<a class="nav-link" href="admin_point_payment.jsp">포인트결제</a> 
								<a class="nav-link" href="admin_point_refund.jsp">포인트환불</a> 
								<a class="nav-link" href="admin_point_withdrawal.jsp">포인트인출</a> 
								<a class="nav-link" href="admin_point_complete.jsp">완료포인트지급</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#homepage" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fa-solid fa-landmark icon"></i>
							</div> 홈페이지관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse show" id="homepage" aria-labelledby="headingThree"
							data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link current-menu" href="ad_notice_list.lion">공지사항</a> 
								<a class="nav-link" href="admin_homepage_categoryList.jsp">카테고리</a> 
								<a class="nav-link" href="admin_homepage_mannerLevelList.jsp">매너지수</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#cancel" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fa-solid fa-circle-xmark icon"></i>
							</div> 미진행취소
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="cancel"
							aria-labelledby="headingFour" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="admin_cancel_receptionList.jsp">접수내역</a>
								<a class="nav-link" href="admin_cancel_handlingList.jsp">처리내역</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#report" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fa-solid fa-triangle-exclamation icon"></i>
							</div> 신고관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="report" aria-labelledby="headingFive"
							data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="admin_report_receptionList.jsp">접수내역</a> 
								<a class="nav-link" href="admin_report_handlingList.jsp">처리내역</a> 
								<a class="nav-link" href="admin_report_reasonList.jsp">사유관리</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#inquiry" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fa-solid fa-circle-question icon"></i>
							</div> 문의관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="inquiry" aria-labelledby="headingSix"
							data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="ad_inquery_list.lion">1:1문의</a> 
								<a class="nav-link current-menu" href="ad_faq_list.lion">FAQ</a>
							</nav>
						</div>
						<div class="sb-sidenav-menu-heading">ADMIN ACCOUNT</div>
						<a class="nav-link" href="admin_accountList.jsp">
							<div class="sb-nav-link-icon">
								<i class="fa-solid fa-gears icon"></i>
							</div> 관리자계정관리
						</a>
					</div>
				</div>
			</nav>
		</div>

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<div class="card mb-4">

						<!--  Breadcrumb -->
						<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item">홈페이지관리</li>
								<li class="breadcrumb-item active" aria-current="page"><a
									href="#">공지사항</a></li>
							</ol>
						</nav>

						<div class="card-body">
							<div class="inquiry-container notice-container">
								 <!-- <h2 class="title">시스템 점검 안내</h2>
								
								<div class="helper"></div><div class="info-container">
									<h5>등록일: 2022-05-04</h5>
									<h5>작성자: yong_qo_oa</h5>
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
								</p>   -->
								
								<c:forEach var="noticeArticle" items="${article }">
								<h2 class="title">${noticeArticle.title }</h2>
								
								<div class="helper"></div><div class="info-container">
									<h5>등록일: ${noticeArticle.write_datetime }</h5>
									<h5>작성자: ${noticeArticle.admin_code }</h5>
								</div>  
									<p>
<c:forTokens items="${noticeArticle.content }" delims="." var="content" >  
	<c:out value="${content}"/> 
</c:forTokens>   
									</p>
									
								 
								 <!-- 사진이 있다면 표시, 없다면 미표시 -->
								<c:choose>
									<c:when test="${noticeArticle.photo_path eq null }">
									</c:when>
									
									<c:otherwise>
										<img src="<%=cp%>/img/ad_notice/${noticeArticle.photo_path }" alt="dsdd"/> 
									</c:otherwise>
								</c:choose>
								
								
							</div>
							<div class="btn-container notice-btn">
								<button type="button" class="adminBtn cancelBtn answerCancelBtn">삭제</button>
								<button type="button" class="adminBtn saveBtn answerInsertBtn"
								onclick="location.href='ad_notice_updateForm.lion?code=${noticeArticle.code}'">수정</button> 
								
								 
							</div>
							
							<input type="hidden" id="code" value="${noticeArticle.code}">
							
							<div>
								<div class="noticeArticle-helper"></div> 
								<button type="button" class="adminBtn listBtn"
								onclick="location.href='ad_notice_list.lion'">목록</button>
							</div>
							</c:forEach>
						</div>

					</div>
				</div>
			</main>

			<!-- import FOOTER -->
			<c:import url="admin_footer.jsp"></c:import>

		</div>
	</div>
</body>
</html>
