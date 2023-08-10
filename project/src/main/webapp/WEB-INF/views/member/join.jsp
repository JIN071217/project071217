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
                <h2>회원가입</h2>
              </div>
            </div>
            <div class="col-md-6">
              <ol class="breadcrumb float-right">
                <li>
                  <a href="/">Home</a>
                </li>
                <li class="active">회원가입</li>
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
                <div class="panel-heading"><h3>회원가입</h3></div>
                <div class="panel-body">
                  <form action="/member/join" id="joinForm" method="POST" role="form">
					<!-- 아이디 -->
					<div class="row align-items-center">
						<div class="form-group col-md-8 mb-3">
							<label for="">아이디<span class="text-muted">&nbsp;(8~12자 이내)</span></label>
							<input type="text" class="form-control" name="mbsp_id" id="mbsp_id" placeholder="아이디를 입력해주세요.">
						</div>
						<div class="form-group col-md-4 mb-3">
							<button id="btn_IdCheck" class="btn btn-info-outlined btn-mid" type="button">중복체크</button>
						</div>
					</div>
					<!-- 패스워드 -->
						<div class="form-group col-mt-3">
							<label for="">패스워드</label>
							<input type="password" class="form-control" name="mbsp_password" id="mbsp_password" placeholder="비밀번호 입력해주세요.">
						</div>
						<div class="form-group">
							<label for="">패스워드 확인</label>
							<input type="password" class="form-control" id="mbsp_repassword" placeholder="비밀번호 확인 입력해주세요.">
						</div>
					<!-- 이름,닉네임 -->
					<div class="row">
						<div class="form-group col-md-3">
							<label for="">이름</label>
							<input type="text" class="form-control" name="mbsp_name" id="mbsp_name" placeholder="이름">
						</div>
						<div class="form-group col-md-4">
							<label for="">닉네임<span class="text-muted">&nbsp;(7자 이내)</span></label>
							<input type="text" class="form-control" name="mbsp_nick" id="mbsp_nick" placeholder="닉네임">
						</div>
						<div class="form-group col-md-5">
							<label for="">전화번호</label>
							<input type="text" class="form-control" name="mbsp_phone" id="mbsp_phone" placeholder="전화번호 입력해주세요.">
						</div>
					</div>
					<!-- 이메일 -->
					<div class="row align-items-center">
						<div class="form-group col-md-8">
							<label for="">이메일</label>
							<input type="email" class="form-control" name="mbsp_email" id="mbsp_email" placeholder="이메일 입력해주세요.">
						</div>
						<div class="form-group col-md-4">
							<button id="btn_authcode" class="btn btn-info-outlined btn-mid" type="button">코드 요청</button>
						</div>
					</div>
					<div class="row align-items-center">
						<div class="form-group col-md-8 mb-3">
							<label for="">인증코드 입력</label>
							<input type="text" class="form-control" id="email_auth_code" placeholder="인증코드를 입력해주세요">
						</div>
						<div class="form-group col-md-4 mb-3">
							<button id="btn_confirmAuthCode" class="btn btn-info-outlined btn-mid" type="button">인증 확인</button>
						</div>
					</div>
					<!-- 우편번호 -->
					<div class="row align-items-center">
						<div class="form-group col-md-8">
							<label for="sample2_address">주소</label>
							<input type="text" class="form-control" name="mbsp_addr" id="sample2_address" placeholder="성남시 분당구"> 
						</div>
						<div class="form-group col-md-4">
							<button type="button" onclick="sample2_execDaumPostcode()" class="btn btn-info-outlined btn-mid" type="button">주소 찾기</button>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-8">
							<label for="sample2_detailAddress">상세주소<span class="text-muted">&nbsp;(필수 아님)</span></label>
							<input type="text" class="form-control" name="mbsp_deaddr" id="sample2_detailAddress" placeholder="상세주소를 입력해주세요.">
							<input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
						</div>
						<div class="form-group col-md-4">
							<label for="sample2_postcode">우편번호</label>
							<input type="text" class="form-control" name="mbsp_zipcode" id="sample2_postcode">
						</div>
					</div>
					<!-- 회원가입 -->
                    <button type="submit" id="btn_join" class="btn btn-primary btn-block">회원가입</button>
                    <a href="/member/login"><button type="button" class="btn btn-link btn-block"><span>회원 입니까? </span>로그인</button></a>
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

		<!-- 관리자 로그인 -->
		<%@include file="/WEB-INF/views/admin/adLogin.jsp" %>

		<!-- SIGN UP MODAL -->
		<div class="modal fade " id="signup" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header justify-content-center">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
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
			
			//회원가입 전송
			$("#btn_join").click(function(){
				let joinForm = $("#joinForm");

				joinForm.submit();
			});

			//아이디 중복체크
			let idCheck = false;

			$("#btn_IdCheck").click(function() {
				if ($("#mbsp_id").val() == "") {
					alert("아이디를 입력하세요.");
					$("#mbsp_id").focus();
					return;
				}

				$.ajax({
					url: '/member/idCheck',
					type: 'get',
					dataType: 'text',
					data: { mbsp_id: $("#mbsp_id").val() },
					success: function(result) {
						if (result == "yes") {
							alert("멋진 아이디네요!");
							idCheck = true;
						} else {
							alert("이미 사용중인 아이디입니다.");
							$("#mbsp_id").val("");
							$("#mbsp_id").focus();
						}
						idCheck = true;
					}
				});
			});
			let isAuthcode = false;

			//메일인증 코드발송
			$("#btn_authcode").click(function(){
				if($("#mbsp_email").val() == ""){
					alert("메일 주소를 입력하세요.");
					$("#mbsp_email").focus();
					return;
				}

				$.ajax ({
					url: '/email/send',
					type : 'get',
					datatype : 'text',
					data : {receiverMail : $("#mbsp_email").val()},
					success : function(result){
						if (result == "success")
						alert("인증 메일이 발송되었습니다. 메일을 확인해주세요.")
					}
				});
			});

			//메일 인증확인

			$("#btn_confirmAuthCode").click(function(){
				if($("#email_auth_code").val() == ""){
					alert("인증 코드를 입력하세요.");
					$("#email_auth_code").focus();
					return;
				}

				$.ajax({
					url : '/email/confirmAuthcode',
					type : 'get',
					dataType : 'text',
					data : {authCode : $("#email_auth_code").val()},
					success : function(result){
						if(result == "success") {
							alert("인증코드가 일치합니다.");
							isAuthcode = true;
						}else if(result == "fail"){
							alert("인증코드가 다릅니다.");
						}
					}
				});
			});

		});
		

	</script>


<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
	<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
	</div>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		// 우편번호 찾기 화면을 넣을 element
		var element_layer = document.getElementById('layer');
	
		function closeDaumPostcode() {
			// iframe을 넣은 element를 안보이게 한다.
			element_layer.style.display = 'none';
		}
	
		function sample2_execDaumPostcode() {
			new daum.Postcode({
				oncomplete: function(data) {
					// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수
	
					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}
	
					// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
					if(data.userSelectedType === 'R'){
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
							extraAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if(data.buildingName !== '' && data.apartment === 'Y'){
							extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if(extraAddr !== ''){
							extraAddr = ' (' + extraAddr + ')';
						}
						// 조합된 참고항목을 해당 필드에 넣는다.
						document.getElementById("sample2_extraAddress").value = extraAddr;
					
					} else {
						document.getElementById("sample2_extraAddress").value = '';
					}
	
					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('sample2_postcode').value = data.zonecode;
					document.getElementById("sample2_address").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("sample2_detailAddress").focus();
	
					// iframe을 넣은 element를 안보이게 한다.
					// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
					element_layer.style.display = 'none';
				},
				width : '100%',
				height : '100%',
				maxSuggestItems : 5
			}).embed(element_layer);
	
			// iframe을 넣은 element를 보이게 한다.
			element_layer.style.display = 'block';
	
			// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
			initLayerPosition();
		}
	
		// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
		// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
		// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
		function initLayerPosition(){
			var width = 300; //우편번호서비스가 들어갈 element의 width
			var height = 400; //우편번호서비스가 들어갈 element의 height
			var borderWidth = 5; //샘플에서 사용하는 border의 두께
	
			// 위에서 선언한 값들을 실제 element에 넣는다.
			element_layer.style.width = width + 'px';
			element_layer.style.height = height + 'px';
			element_layer.style.border = borderWidth + 'px solid';
			// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
			element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
			element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
		}
	</script>

</body>
</html>