<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<html lang="en"><head>

    <!-- SITE TITTLE -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Signup - BIGBAG Store</title>

    <!-- PLUGINS CSS STYLE -->
    <link href="/resources/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/assets/plugins/jquery-ui/jquery-ui.css" rel="stylesheet">
    <link href="/resources/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/resources/assets/plugins/selectbox/select_option1.css" rel="stylesheet">
    <link href="/resources/assets/plugins/fancybox/jquery.fancybox.min.css" rel="stylesheet"> 
    <link href="/resources/assets/plugins/rateyo/jquery.rateyo.min.css" rel="stylesheet">
    <link href="/resources/assets/plugins/iziToast/css/iziToast.css" rel="stylesheet">
    <link href="/resources/assets/plugins/prismjs/prism.css" rel="stylesheet">
    <link href="/resources/assets/plugins/revolution/css/settings.css" rel="stylesheet">
    <link href="/resources/assets/plugins/animate/animate.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/resources/assets/plugins/slick/slick.css" media="screen">
    <link rel="stylesheet" type="text/css" href="/resources/assets/plugins/slick/slick-theme.css" media="screen">


    <!-- CUSTOM CSS -->
    <link href="/resources/assets/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/assets/css/default.css" id="option_style">

    <!-- Icons -->
    <link rel="shortcut icon" href="resources/assets/img/favicon.png">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

  </head>

  <body id="body" class="body-wrapper version1 up-scroll loaded">

    <div class="main-wrapper">

      <!-- HEADER -->
      <%@include file="/WEB-INF/views/include/header.jsp" %>

      <!-- LIGHT SECTION -->
      <section class="lightSection clearfix pageHeader">
        <div class="container">
          <div class="row">
            <div class="col-md-6">
              <div class="page-title">
              </div>
            </div>
            <div class="col-md-6">
              <ol class="breadcrumb float-right">
                <li>
                  <a href="/">Home</a>
                </li>
                <li class="active">마이페이지</li>
              </ol>
            </div>
          </div>
        </div>
      </section>

      <!-- MAIN CONTENT SECTION -->
      <section class="mainContent clearfix signUp">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-md-6">
              <div class="panel panel-default">
                <div class="panel-heading"><h3>${memberVO.mbsp_id}님 프로필</h3></div>
                <div class="panel-body">
                  <!-- <form action="/member/modify" id="modifyForm" method="post" role="form"> -->
					<!-- 이름,닉네임 -->
					<div class="row">
						<div class="form-group col-md-3">
							<label for="">이름</label>
							<div class="form-control text-left py-0">${memberVO.mbsp_name}</div>
						</div>
						<div class="form-group col-md-4">
							<label for="">닉네임</label>
							<div class="form-control text-left py-0">${memberVO.mbsp_nick}</div>
						</div>
						<div class="form-group col-md-5">
							<label for="">전화번호</label>
							<span class="form-control text-left py-0">${memberVO.mbsp_phone}</span>
						</div>
					</div>
					<!-- 이메일 -->
					<div class="row align-items-center">
						<div class="form-group col-md-12">
							<label for="">이메일</label>
							<span class="form-control text-left py-0">${memberVO.mbsp_email}</span>
						</div>
					</div>
					<!-- 우편번호 -->
					<div class="row align-items-center">
						<div class="form-group col-md-12">
							<label for="sample2_address">주소</label>
							<span class="form-control text-left py-0">${memberVO.mbsp_addr}</span>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-8">
							<label for="sample2_detailAddress">상세주소</label>
							<span class="form-control text-left py-0">${memberVO.mbsp_deaddr}</span>
						</div>
						<div class="form-group col-md-4">
							<label for="sample2_postcode">우편번호</label>
							<span class="form-control text-left py-0">${memberVO.mbsp_zipcode}</span>
						</div>
					</div>
					<!-- 회원수정 페이지 전환 -->
					<div class="row">
						<div class="form-group col-md-12">
							<span style="display: flex; justify-content: flex-end;">
								<a data-toggle="modal" href="#pwchangeModal" class="btn btn-info-outlined btn-sm">비밀번호 변경</a>
								<span>&nbsp;</span>
								<a data-toggle="modal" href="#deleteModal" class="btn btn-info-outlined btn-sm">회원탈퇴</a>
							</span>
						</div>
					</div>
                    <button type="submit" id="btn_modify" class="btn btn-primary btn-block">회원정보 수정</button>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

    <!-- FOOTER -->
    <%@include file="/WEB-INF/views/include/footer.jsp" %>
		</div>

		<!-- 비밀번호변경 MODAL -->
		<div class="modal fade login-modal" id="pwchangeModal" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header justify-content-center">
						<h3 class="modal-title">비밀번호 변경</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					</div>
					<div class="modal-body">
						<form action="" method="POST" role="form">
							<div class="form-group">
								<label for="">현재 비밀번호</label>
								<input type="password" class="form-control" id="old_mbsp_password">
							</div>
							<div class="form-group">
								<label for="">새로운 비밀번호</label>
								<input type="password" class="form-control" id="new_mbsp_password">
							</div>
							<div class="form-group">
								<label for="">새로운 비밀번호 재확인</label>
								<input type="password" class="form-control" id="re_mbsp_password">
							</div>
							<button type="submit" class="btn btn-primary btn-block" id="btn_pwchange">비밀번호 변경하기</button>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!-- 회원탈퇴 MODAL -->
		<div class="modal fade " id="deleteModal" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header justify-content-center">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h3 class="modal-title">회원탈퇴</h3>
					</div>
					<div class="modal-body">
						<form action="/" method="POST" role="form">
							<div class="form-group">
								<label for="mbsp_password">비밀번호</label>
								<input type="password" class="form-control" id="mbsp_password">
							</div>
							<button type="submit" class="btn btn-primary btn-block" id="btn_delete">탈퇴하기</button>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!-- PORDUCT QUICK VIEW MODAL -->
		<div class="modal fade quick-view" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<div class="media flex-wrap">
							<div class="media-left px-0">
								<img class="media-object" src="assets/img/products/quick-view/quick-view-01.jpg" alt="Image">
							</div>
							<div class="media-body">
								<h2>Old Skool Navy</h2>
								<h3>$149</h3>
								<p>Classic sneaker from Vans. Cotton canvas and suede upper. Textile lining with heel stabilizer and ankle support. Contrasting laces. Sits on a classic waffle rubber sole.</p>
								<span class="quick-drop">
									<select name="guiest_id3" id="guiest_id3" class="select-drop" sb="83282822" style="display: none;">
										<option value="0">Size</option>
										<option value="1">Size 1</option>
										<option value="2">Size 2</option>
										<option value="3">Size 3</option>
									</select><div id="sbHolder_83282822" class="sbHolder"><a id="sbToggle_83282822" href="#" class="sbToggle"></a><a id="sbSelector_83282822" href="#" class="sbSelector">Size</a><ul id="sbOptions_83282822" class="sbOptions" style="display: none;"><li><a href="#0" rel="0">Size</a></li><li><a href="#1" rel="1">Size 1</a></li><li><a href="#2" rel="2">Size 2</a></li><li><a href="#3" rel="3">Size 3</a></li></ul></div>
								</span>
								<span class="quick-drop resizeWidth">
									<select name="guiest_id4" id="guiest_id4" class="select-drop" sb="20978464" style="display: none;">
										<option value="0">Qty</option>
										<option value="1">Qty 1</option>
										<option value="2">Qty 2</option>
										<option value="3">Qty 3</option>
									</select><div id="sbHolder_20978464" class="sbHolder"><a id="sbToggle_20978464" href="#" class="sbToggle"></a><a id="sbSelector_20978464" href="#" class="sbSelector">Qty</a><ul id="sbOptions_20978464" class="sbOptions" style="display: none;"><li><a href="#0" rel="0">Qty</a></li><li><a href="#1" rel="1">Qty 1</a></li><li><a href="#2" rel="2">Qty 2</a></li><li><a href="#3" rel="3">Qty 3</a></li></ul></div>
								</span>
								<div class="btn-area">
									<a href="#" class="btn btn-primary btn-block">Add to cart <i class="fa fa-angle-right" aria-hidden="true"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<script src="/resources/assets/plugins/jquery/jquery.min.js"></script>
		<script src="/resources/assets/plugins/jquery/jquery-migrate-3.0.0.min.js"></script>
		<script src="/resources/assets/plugins/jquery-ui/jquery-ui.js"></script>
		<script src="/resources/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="/resources/assets/plugins/revolution/js/jquery.themepunch.tools.min.js"></script>
		<script src="/resources/assets/plugins/revolution/js/jquery.themepunch.revolution.min.js"></script>
		<script src="/resources/assets/plugins/slick/slick.js"></script>
		<script src="/resources/assets/plugins/fancybox/jquery.fancybox.min.js"></script>
		<script src="/resources/assets/plugins/iziToast/js/iziToast.js"></script>
		<script src="/resources/assets/plugins/prismjs/prism.js"></script>
		<script src="/resources/assets/plugins/selectbox/jquery.selectbox-0.1.3.min.js"></script>
		<script src="/resources/assets/plugins/countdown/jquery.syotimer.js"></script>
		<script src="/resources/assets/plugins/velocity/velocity.min.js"></script>
		<script src="/resources/assets/plugins/rateyo/jquery.rateyo.min.js"></script>
		<script src="/resources/assets/js/custom.js"></script>

	<!-- 제이쿼리 시작-->
	<script>

		$(document).ready(function(){
			
		//회원정보 수정 
			$("#btn_modify").click(function(){
				location.href = "/member/modify";
			});
		//비밀번호 변경
			$("#btn_pwchange").click(function(){

				if($("#new_mbsp_password").val() != $("#re_mbsp_password").val()){
					alert("신규 비밀번호가 일치하지않습니다.");
					return;
				}

				$.ajax({
					url : '/member/pwchange',
					type : 'post',
					data : {
						old_mbsp_password : $("#old_mbsp_password").val(),
						new_mbsp_password : $("#new_mbsp_password").val()
					},
					dataType : 'text',

					success : function(result){
						if(result == "success"){
							alert("비밀번호가 변경되었습니다.");
							$("#old_mbsp_password").val('');
							$("#new_mbsp_password").val('');
							$("#re_mbsp_password").val('');

							$("#pwchangeModal").modal('hide')
						}else if(result == "failPW"){
							alert("기존 비밀번호가 틀립니다. \n 비밀번호를 확인해주세요.");
							$("#old_mbsp_password").val('');
							$("#old_mbsp_password").focus();
						}
					}
				});
			});
			
		//회원탈퇴 - 기존 코드로 동작시 405오류 request method 'post' not supported 발생
			// $("#btn_delete").click(function(){

			// 	$.ajax({
			// 		url : '/member/delete',
			// 		type : 'post',
			// 		data : {mbsp_password : $("#mbsp_password").val()},
			// 		dataType : 'text',
			// 		success : function(result){
			// 			if(result == "success"){
			// 				alert("회원탈퇴 처리가 되었습니다.");
			// 				$("#deleteModal").modal('hide');

			// 				location.href = "/";

			// 			}else if(result == "failPW"){
			// 				alert("기존 비밀번호가 틀립니다. \n 비밀번호를 확인해주세요.");
			// 				$("#mbsp_password").val('');
			// 				$("#mbsp_password").focus();

			// 			}
			// 		}
			// 	});
			// });

			$("#btn_delete").click(function(event){
    
				// 기본 form 제출 동작을 방지
				event.preventDefault();

				$.ajax({
					url : '/member/delete',
					type : 'POST',  
					data : {mbsp_password : $("#mbsp_password").val()},
					dataType : 'text',
					success : function(result){
						if(result == "success"){
							alert("회원탈퇴 처리가 되었습니다.");
							$("#deleteModal").modal('hide');
							location.href = "/";
						} else if(result == "failPW") {
							alert("기존 비밀번호가 틀립니다. \n 비밀번호를 확인해주세요.");
							$("#mbsp_password").val('');
							$("#mbsp_password").focus();
						}
					}
				});
			});


		}); // 제이쿼리 끝
	</script>


</body>
</html>