<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
				<h2>주문정보</h2>
				</div>
			</div>
			<div class="col-md-6">
				<ol class="breadcrumb float-right">
				<li>
					<a href="/">Home</a>
				</li>
				<li class="active">주문정보</li>
				</ol>
			</div>
			</div>
		</div>
	  </section>
		
	  <!-- MAIN CONTENT SECTION -->
    <section class="mainContent clearfix userProfile">
      <div class="container">
        <div class="row">
          <div class="col-12">
            <div class="btn-group me-0" role="group" aria-label="...">
              <a href="/order/order_info" class="btn btn-default active"><i class="fa fa-list" aria-hidden="true"></i>주문정보</a>
              <a href="/cart/cart_list" class="btn btn-default"><i class="fa fa-gift" aria-hidden="true"></i>장바구니</a>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-12">
            <div class="innerWrapper singleOrder">
              <div class="orderBox d-flex align-items-center mb-4">
                <h3 class="orderBoxContent mb-0">${memberVO.mbsp_name }님</h3>
              </div>

              <div class="row">
                <div class="col-12">
                  <div class="panel panel-default mb-5">
                    <div class="panel-heading">
                      <h4 class="panel-title">주문자 정보</h4>
                    </div>
                    <div class="panel-body">
                      <div class="row">
                        <div class="col-lg-4">
                          <address class="mb-4">
                            <span>이름 : ${memberVO.mbsp_name }</span><br>
                            <span>연락처 : ${memberVO.mbsp_phone }</span>
                          </address>

                          <address>
                            <span> 주소지 </span><br>
                            <p class="mb-5 mb-lg-0">
                              주소 : ${memberVO.mbsp_addr }<br>
                              상세주소 : ${memberVO.mbsp_deaddr }<br>
                              우편번호 : ${memberVO.mbsp_zipcode }<br>
                            </p>
                          </address>
                        </div>

                        <div class="col-lg-8 orderTracking">
                          <div class="innerWrapper border-0 p-0 mb-0">
                            <div class="orderBox text-nowrap mb-4">
                              <h4>배송받을 주소 정보</h4>
                              <div class="table-responsive">
                                <table class="table">
                                  <thead>
                                    <tr>
                                      <th>배송지 입력</th>
                                      <th style="text-align: center;"></th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <td>받는사람</td>
                                      <td style="text-align: center; vertical-align: middle;">
                                        <input type="text" class="form-control" name="ord_name" id="ord_name" value="${memberVO.mbsp_name }"  style="height: 70%; margin-bottom: 5px;">
                                      </td>
                                    </tr>

                                    <tr>
                                      <td>연락처</td>
                                      <td style="text-align: center; vertical-align: middle;">
                                        <input type="text" class="form-control" name="ord_tel" id="ord_tel" value="${memberVO.mbsp_phone }"  style="height: 70%; margin-bottom: 5px;">
                                      </td>
                                    </tr>

                                    <tr>
                                      <td>받는주소</td>
                                      <td style="text-align: center; vertical-align: middle;">
                                        <input type="text" class="form-control" name="ord_addr_basic" id="sample2_address" value="${memberVO.mbsp_addr }"  style="height: 70%; margin-bottom: 5px;">
                                        <input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
                                      </td>
                                    </tr>

                                    <tr>
                                      <td>상세주소</td>
                                      <td style="text-align: center; vertical-align: middle;">
                                        <input type="text" class="form-control" name="ord_addr_detail" id="sample2_detailAddress" value="${memberVO.mbsp_deaddr }"   style="height: 70%; margin-bottom: 5px;">

                                      </td>
                                    </tr>

                                    <tr>
                                      <td>우편번호</td>
                                      <td style="text-align: center; vertical-align: middle;">
                                        <input type="text" class="form-control" name="ord_addr_post" id="sample2_postcode" value="${memberVO.mbsp_zipcode }"  style="height: 70%; margin-bottom: 5px;">
                                        <input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
                                      </td>
                                    </tr>
                                  </tbody>
                                </table>
                              </div>
                            </div>
                            <div class="">
                              <button type="button" onclick="sample2_execDaumPostcode()" class="btn btn-primary">우편번호 찾기</button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="col-12 mb-5">
                  <div class="cartListInner text-nowrap">
                    <div class="table-responsive">
                      <table class="table">
                        <thead>
                          <tr>
                            <th></th>
                            <th>상품명</th>
                            <th>가격</th>
                            <th>포인트</th>
                            <th>배송</th>
                            <th>수량</th>
                            <th>총 Total</th>
                          </tr>
                        </thead>
                        <tbody>
                          <!-- 장바구니 목록 c:forEach출력 -->
                          <c:forEach items="${cart_list }" var="cartListDTO">
                            <tr>
                              <td class="">
                                <button type="button" name="btn_cart_del" class="close" data-dismiss="alert" aria-label="Close">
                                  <span aria-hidden="true">×</span>
                                </button>
                
                                <a class="move"
                                  href="/product/pro_detail?pageNum=${pageNum}&amp;amount=${amount}&amp;pro_num=${cartListDTO.pro_num}">
                                  <span><img style="width: 80px;"
                                      src="/cart/displayImage?folderName=${cartListDTO.pro_up_folder }&fileName=s_${cartListDTO.pro_img}" /></span>
                                </a>
                              </td>
                
                              <td>
                                <a class="move" style="color: black;" href="${cartListDTO.pro_num }">
                                  <c:out value="${cartListDTO.pro_name }"></c:out>
                                </a>
                                <input type="hidden" name="cart_code" value="${cartListDTO.cart_code }">
                              </td>
                
                              <td class="">
                                <fmt:formatNumber value="${cartListDTO.pro_price}" type="currency" currencySymbol="" groupingUsed="true"
                                  maxFractionDigits="0" />원
                              </td>
                
                              <td>포인트 : 0</td>
                
                              <td>기본배송</td>
                
                              <td class="count-input">
                                <a class="incr-btn" name="btn_cart_amount_change" data-action="decrease" href="#"><i
                                    class="fa fa-minus"></i></a>
                                <input class="quantity" type="text" id="cart_amount" name="cart_amount" style="width:80px"
                                  value="${cartListDTO.cart_amount }">
                                <a class="incr-btn" name="btn_cart_amount_change" data-action="increase" href="#"><i
                                    class="fa fa-plus"></i></a>
                              </td>
                
                              <td class="">
                                <fmt:formatNumber value="${cartListDTO.unitprice}" type="currency" currencySymbol="" groupingUsed="true"
                                  maxFractionDigits="0" />원
                              </td>
                
                            </tr>
                          </c:forEach>
                
                
                        </tbody>
                      </table>
                    </div>
                    <div class="updateArea">
                      <div class="input-group">
                        <a href="/" class="btn btn-primary-outlined" id="basic-addon2">이달의 추천상품 보러가기</a>
                      </div>
                      <a href="#" id="btn_cart_empty" class="float-right btn btn-secondary-outlined">장바구니 비우기</a>
                    </div>
                    <div class="row totalAmountArea">
                      <div class="col-sm-4 ml-sm-auto">
                        <ul class="list-unstyled">
                          <c:if test="${!empty cart_list}">
                            <!-- <li>총 가격 <span>$ 792.00</span></li>
                                          <li>부가세(미구현)<span>$ 18.00</span></li> -->
                            <li>총 결제금액 <span class="grandTotal">
                                <fmt:formatNumber value="${cart_tot_price}" type="number" pattern="#,##0" />원
                              </span></li>
                          </c:if>
                          <c:if test="${empty cart_list}">
                            <li>[장바구니에 담은 상품이 없습니다.]</li>
                          </c:if>
                        </ul>
                      </div>
                    </div><!-- ㅇ-->
                  </div>
                </div>

                <div class="col-md-6 col-12">
                  <div class="panel panel-default">
                    <div class="panel-heading">
                      <h4 class="panel-title">무통장 결제</h4>
                    </div>
                    <div class="panel-body">
                      <address>
                        <span>무통장 계좌 리스트(미구현)</span>
                      </address>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-12">
                  <div class="panel panel-default">
                    <div class="panel-heading">
                      <h4 class="panel-title">카카오페이 결제</h4>
                    </div>
                    <div class="panel-body">
                      <address>
                        <span>내용 무</span>
                      </address>
                    </div>
                  </div>
                </div>
                <div class="col-12">
                  <div class="btn-group" role="group" aria-label="...">
                    <button type="button" class="btn btn-default">무통장 입금</button>
                    <button type="button" class="btn btn-default">카카오페이</button>
                  </div>
                </div>
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

	<!-- 제이쿼리 시작-->
	<script>

		$(document).ready(function(){
			
			//장바구니 수량변경
			$(".incr-btn[name='btn_cart_amount_change']").on("click", function(){
				let cur_amount_change = $(this);

				let cart_code = cur_amount_change.parent().parent().find("input[name='cart_code']").val();
				let cart_amount = cur_amount_change.parent().find("input[name='cart_amount']").val();

				$.ajax({
					url : '/cart/cart_amount_change',
					type : 'post',
					data : {cart_code : cart_code, cart_amount : cart_amount},
					dataType : 'text',
					success : function(result){
						if(result = "success"){

							//주문정보 폼에서 수량변경시 새고로침후 타겟 페이지 고정
              location.reload().then(() => {
                   
                    location.href = "#cart_amount";
                });
						}
					}
				});
			});

			//장바구니 삭제
			$("button[name='btn_cart_del']").on("click", function(){
				
				let cur_amount_change = $(this);

				let cart_code = cur_amount_change.parent().parent().find("input[name='cart_code']").val();

				if(!confirm("해당 상품을 장바구니에서 삭제하겠습니까?")) return;

				$.ajax({
					url : '/cart/cart_delete',
					type : 'post',
					data : {cart_code : cart_code},
					dataType : 'text',
					success : function(result){
						if(result = "success"){
							
							location.href = "/cart/cart_list";
						}
					}
				})
			});

			//장바구니 비우기
      $("#btn_cart_empty").on("click", function(e){
          e.preventDefault(); 

          if(!confirm("장바구니를 모두 비우시겠습니까?")) return;

          //요청 새로고침
          $.ajax({
              url: '/cart/cart_empty',
              type: 'get',
              success: function(response) {

                  location.reload();
              }
          });
      });

			//주문하기 페이지
			$("#btn_order").on("click", function(e){
				e.preventDefault(); 

				location.href = "/order/order_info";
			});

		});
		

	</script>

</body>
</html>