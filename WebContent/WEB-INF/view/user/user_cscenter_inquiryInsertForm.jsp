<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String member_code = (String)session.getAttribute("member_code");
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
		    	$("#saveBtn").click(function()
		    	{
		    		
		    		Swal.fire({
		    			  title: '1:1 문의를 등록하시겠습니까?',
		    			  showCancelButton: true,
		    			  confirmButtonText: '등록',
		    			  cancelButtonText: '취소',
		    			  reverseButtons: true
		    			}).then((result) => {
		    			  if (result.isConfirmed) {
		    				  
		      				// Insert 작업 처리 코드 작성하기!
		    		    		
		    		    		
		    		    	// Insert 완료 후, 띄울 알림창
		      			    Swal.fire({
		      			    	title: '등록 완료!',
		      			    	icon: 'success',
		      			    	confirmButtonText: '확인'
		      			    }).then(() => {
		      			    	/* 해당게시물 상세보기로 이동 시키기!! */
		      			    	
		      			    	var title = $("#title").val();
		      			    	var content = $("#content").val();
		      			    	var member_code = $("#member_code").val();
		      			    	
		      			    	location.href='user_cscenter_insertIq.lion?title=' + title + "&content=" + content + "&member_code=" + member_code;
		      			    });
		      			  }
		    			})
		        });
		    	
		    	$("#cancelBtn").click(function()
				{
		    		Swal.fire({
		    			  title: '그만하고 목록으로 돌아가시겠습니까?',
		    			  text: "입력사항이 저장되지 않습니다.",
		    			  icon: 'warning',
		    			  iconColor: '#f27474',
		    			  showCancelButton: true,
		    			  confirmButtonText: '목록으로',
		    			  cancelButtonText: '취소'
		    			}).then((result) => {
		    			  if (result.isConfirmed) {


		    				  Swal.fire({
		        			    	title: '등록 완료!',
		        			    	icon: 'success',
		        			    	confirmButtonText: '확인'
		        			    }).then(() => {
		        			    	/* 해당게시물 상세보기로 이동 */
		        			    	location.href='user_cscenter_listIq.lion';
		        			    });
		    				  
		    				  
		    				  
		    			  }
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
							<h2>1:1 문의</h2>
							<hr class="inquiry-hr"/>
						</div>
					</div>
					
					<form action="">
						<table class="table inquiryInsertTable">
							<thead>
							</thead>
							<tbody>
								<tr>
									<th>제목</th>
									<td><input type="text" class="form-control" id="title"></td>
								</tr>
								<tr>
									<th>내용</th>
									<td><textarea class="form-control" id="content" rows="15"></textarea></td>
								</tr>
								<tr>
									<th></th>
									<td>
										<!-- <input type="file" class="inquiry-file" /> -->
									</td>
								</tr>
							</tbody>
						</table>
						
						<div class="form-btn-box">
							<button type="button" class="btn btn-outline-primary lion-outline-btn cancelBtn" id="cancelBtn">목록으로</button>
							<!-- <button type="button" class="btn btn-outline-primary lion-outline-btn cancelBtn"
									onclick="location.href='user_cscenter_listIq.lion'" id="cancelBtn">목록으로</button> -->
									
							<!-- 등록버튼 클릭 → insert 시키고, 입력한 게시물 상세보기 페이지로 이동하면 됩니다. -->
							<button type="button" class="btn btn-primary lion-primary-btn saveBtn" id="saveBtn">등록</button>
							<input type="hidden" id="member_code" value="<%=member_code %>">
						</div>
					</form>
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