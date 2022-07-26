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
    	$(".saveBtn").click(function()
    	{
    		
    		Swal.fire({
    			  title: '공지사항을 수정하시겠습니까?',
    			  showCancelButton: true,
    			  confirmButtonText: '수정',
    			  cancelButtonText: '취소',
    		      reverseButtons: true
    			}).then((result) => {
    			  if (result.isConfirmed) {
    				  
        			// Update 작업 처리 코드 작성하기!
 					//alert("확인");
        			
        			
        			  /*
        			  
        			  var params= "title=" + $.trim($("#title").val())
     				   + "&content=" + $.trim($("#content").val());
      			       //+ "&path=" + $.trim($("#file1").val());
     					
      			       $.ajax(
     					{
     						type:"POST"
     						, url:"ad_notice_article.lion"
     						, data:params				//--check~!!
     						, success:function(args)
     						{
     							alert("성공");
     						}
     						, error:function(e)
     						{
     							alert(e.responseText);
     						}
     					});
      			       
      			       //////////////////////
      			       */
      			       
      			       
      			       /*
      			       var form = $('#adNoticeUpdateForm')[0];
      			       
      			       var data = new FormData(form);
      			       
      			       $.ajax({
      			    			type: "POST",
      			    			,url: 'ad_notice_article.lion'
      			    			,data:data
      			    			,success:function(data)
      			    			{
      			    				alert("전송성공!!");
      			    			}
      			       			, error:function(e)
      			       			{
      			       				alert(e.responseText);
      			       			}
      			    	   
      			    	   
      			       });
      			       
      			       */
      			       
      			       
      			       
      			       /*
      			       $("#adNoticeUpdateForm").submit();
      			       alert("전송 성공");
      			       */
      			       
      			        /*
					   var form1 = $("#adNoticeUpdateForm");
      			       
      			       $.ajax({
      			    			type:"POST"
      			    			,url:"ad_notice_article.lion"
      			    			,data:form1
      			    			,success:function(data)
      			    			{
      			    				alert("전송성공!!");
      			    			}
      			       			, error:function(e)
      			       			{
      			       				alert(e.responseText);
      			       			}
      			    	   
      			    	   
      			       });
        			 	 */
        			 	
        			 	//location.href='ad_notice_list.lion';
        			 	/* var form = document.getElementById("adNoticeUpdateForm");
        			 	form.action= "ad_notice_list.lion"; 
        			 	form.method = "GET";
        			 	form.submit(); */ 
        			 	 
        			 	 
        			
      		    	// Update 완료 후, 띄울 알림창
      			    Swal.fire({
      			    	title: '수정 완료!',
      			    	icon: 'success',
      			    	confirmButtonText: '확인'
      			    }).then(() => {
      			    	
      			    	///location.href = 'ad_notice_article.lion';
      			    	
      			    	// 수정 완료 팝업이 뜨는 부분에서 submit 처리를 해주지 않으면 
      			    	// 수정 완료 알림이 제대로 뜨기 전에 페이지가 넘어가버리기 때문에
      			    	// 여기에 처리하게 되었다.
      			    	//var form = document.getElementById("adNoticeUpdateForm");
        			 	//form.action= "ad_notice_update.lion"; 
        			 	//form.method = "POST";
        			 	//form.submit();
        			 	
        			 	
        			 	/*
        			 	var title = $(this).parents("inquiry-container").find("td:eq(0)").text();
						var content = $(this).parents("inquiry-container").find("td:eq(1)").text(); 		// 부모 tr의 1번째 td의 글자
						var photo_path = $(this).parents("inquiry-container").find("td:eq(2)").text();
						var code = $(this).parents("inquiry-container").find("td:eq(2)").text();
						
						// 위에 담은 변수를 대입
						$("#title").val(title);
						$("#content").val(content);
						$("#photo_path").val(photo_path);
						$("#code").val(code);
						
						$("form").attr("action", "ad_notice_update.lion"); // 지금은 action 속성이 memberinsert.action인데 이것을 바꾸겠다.
			        	*/	 	
        			 	
			        	
			        	
			        	/*
			        	document.adNoticeUpdateForm.method="POST";
						document.adNoticeUpdateForm.action="location.href='ad_notice_update.lion'";
						document.adNoticeUpdateForm.submit();
						*/
						
						
						//title, content, photo_path, code
						var title = $("#title").val();
						var content = $("#content").val();
						//var photo_path = $("#photo_path").val();
						//var photo_path = document.getElementById("photo_path").files[0].name;
						var photo_path = document.getElementById("photo_path").value;
						var code = $("#code").val();
							
						location.href = 'ad_notice_update.lion?title=' + title + '&content=' + content + '&photo_path=' + photo_path + '&code=' + code;
						
						
      			    });
      			  }
    			})
        });
    	
    	$(".cancelBtn").click(function()
		{
    		Swal.fire({
    			  title: '그만하고 목록으로 돌아가시겠습니까?',
    			  text: "변경사항이 저장되지 않습니다.",
    			  icon: 'warning',
    			  iconColor: '#f27474',
    			  showCancelButton: true,
    			  confirmButtonText: '목록으로',
    			  cancelButtonText: '취소'
    			}).then((result) => {
    			  if (result.isConfirmed) {
    				  location.href='ad_notice_list.lion';
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
								<a class="nav-link current-menu" href="admin_homepage_noticeList.jsp">공지사항</a> 
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
								<a class="nav-link" href="admin_inquiry_inquiryList.jsp">1:1문의</a> 
								<a class="nav-link current-menu" href="admin_inquiry_faqList.jsp">FAQ</a>
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
								<li class="breadcrumb-item active" aria-current="page"><a href="#">공지사항</a></li>
							</ol>
						</nav>

						<div class="card-body">
							<div class="inquiry-container">
								
								<div class="admin-textarea-box">
									<form method="post" id="adNoticeUpdateForm" action="ad_notice_update.lion"   >
										<c:forEach var="noticeArticle" items="${article }">
										<label for="title" class="col-form-label">제목</label>
										<input type="text" class="form-control-plaintext faq-title" id="title"
										value="${noticeArticle.title }">
									
										<label for="content" class="col-form-label">내용</label>
										<textarea class="form-control admin-textarea" id="content" rows="15">
<c:forTokens items="${noticeArticle.content }" delims="." var="content">
	<c:out value="${content}"/>
</c:forTokens>					
										</textarea>
										<!-- <input type="file" class="admin-textarea-file" id="photo_path"/> -->
										<input type="hidden" id="code" value="${noticeArticle.code }">
										
										</c:forEach>
										<button type="button" class="adminBtn cancelBtn answerCancelBtn">취소</button>
										<button type="button" id="adNtcUpdtBtn" class="adminBtn saveBtn answerInsertBtn">수정</button>
									</form>
								</div>
							</div>
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
