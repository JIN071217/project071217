<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>

    <!-- SITE TITTLE -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login - BIGBAG Store</title>

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

  <body id="body" class="body-wrapper version1 up-scroll">

    <div class="main-wrapper">


    <!-- HEADER -->
    <%@include file="/WEB-INF/views/include/header.jsp" %>

      <!-- LIGHT SECTION -->
      <section class="lightSection clearfix pageHeader">
        <div class="container">
          <div class="row">
            <div class="col-md-6">
              <div class="page-title">
                <h2>로그인</h2>
              </div>
            </div>
            <div class="col-md-6">
              <ol class="breadcrumb float-right">
                <li>
                  <a href="index.html">Home</a>
                </li>
                <li class="active">로그인</li>
              </ol>
            </div>
          </div>
        </div>
      </section>

      <!-- MAIN CONTENT SECTION -->
      <section class="mainContent clearfix logIn">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-md-7 col-lg-8 col-xl-7 col-12">
              <div class="panel panel-default">
                <div class="panel-heading">
                  <h3>아이디 로그인해주세요.</h3>
                </div>
                <div class="panel-body">
                  <form action="/member/login" method="post" role="form">
                    <div class="form-group">
                      <label for="mbsp_id">아이디</label>
                      <input type="text" class="form-control"name="mbsp_id" id="mbsp_id">
                    </div>
                    <div class="form-group">
                      <label for="mbsp_password">비밀번호</label>
                      <input type="password" class="form-control" name="mbsp_password" id="mbsp_password">
                    </div>
                    <div class="form-check ">
                      <input id="remember_mbsp_id" class="checkbox-custom form-check-input" name="remember_mbsp_id"
                        type="checkbox">
                      <label for="remember_mbsp_id" class="checkbox-custom-label form-check-label">아이디 저장</label>
                    </div>
                    <button type="submit" class="btn btn-primary btn-default btn-block">로그인</button>
                    <button type="button" class="btn btn-link btn-block">아이디/비밀번호 잃어버리셨나요?</button>
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

		<!-- LOGIN MODAL -->
		<%@include file="/WEB-INF/views/admin/adLogin.jsp" %>

		<!-- SIGN UP MODAL -->
		<div class="modal fade " id="signup" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header justify-content-center">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h3 class="modal-title">Create an account</h3>
					</div>
					<div class="modal-body">
						<form action="" method="POST" role="form">
							<div class="form-group">
								<label for="">Enter Email</label>
								<input type="email" class="form-control">
							</div>
							<div class="form-group">
								<label for="">Password</label>
								<input type="password" class="form-control">
							</div>
							<div class="form-group">
								<label for="">Confirm Password</label>
								<input type="password" class="form-control">
							</div>
							<button type="submit" class="btn btn-primary btn-block">Sign up</button>
							<button type="button" class="btn btn-link btn-block">New User?</button>
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
									<select name="guiest_id3" id="guiest_id3" class="select-drop">
										<option value="0">Size</option>
										<option value="1">Size 1</option>
										<option value="2">Size 2</option>
										<option value="3">Size 3</option>
									</select>
								</span>
								<span class="quick-drop resizeWidth">
									<select name="guiest_id4" id="guiest_id4" class="select-drop">
										<option value="0">Qty</option>
										<option value="1">Qty 1</option>
										<option value="2">Qty 2</option>
										<option value="3">Qty 3</option>
									</select>
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

		<!-- 로그인 동작-->
		<!-- <script>
			
			$(document).ready(function(){
				let msg = '${msg}';
				if(msg == 'failID'){
					alert("아이디가 틀립니다.")

					$("#mbsp_id").focus();
				}else if(msg == 'failPW'){
					alert("비밀번호 확인바람");
					$("#mbsp_password").focus();
				}
			});
			
		</script> -->

		<script>
		$(document).ready(function() {
			// 쿠키에서 저장된 아이디 가져오기
			let savedMbspId = getCookie("saved_mbsp_id"); 

			if(savedMbspId) {
				$('#mbsp_id').val(savedMbspId);
				$('#remember_mbsp_id').prop('checked', true);
			}
		});

		// 쿠키에서 값 읽기 함수
		function getCookie(name) {
			let value = "; " + document.cookie;
			let parts = value.split("; " + name + "=");
			if (parts.length == 2) return parts.pop().split(";").shift();
		}
		</script>
	</body>
</html>
