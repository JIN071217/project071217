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
				<h2>장바구니</h2>
				</div>
			</div>
			<div class="col-md-6">
				<ol class="breadcrumb float-right">
				<li>
					<a href="/">Home</a>
				</li>
				<li class="active">장바구니</li>
				</ol>
			</div>
			</div>
		</div>
	  </section>
		
	  <!-- MAIN CONTENT SECTION -->
	  <section class="mainContent clearfix cartListWrapper">
        <div class="container">
          <div class="row">
            <div class="col-12">
              <div class="cartListInner">
                <form action="#">
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
							
							<a class="move" href="/product/pro_detail?pageNum=${pageNum}&amp;amount=${amount}&amp;pro_num=${cartListDTO.pro_num}">
								<span><img style="width: 80px;" src="/cart/displayImage?folderName=${cartListDTO.pro_up_folder }&fileName=s_${cartListDTO.pro_img}" /></span>
							</a>
						</td>

						  <td>
						    <a class="move" style="color: black;" href="${cartListDTO.pro_num }"><c:out value="${cartListDTO.pro_name }" ></c:out></a>
							<input type="hidden" name="cart_code" value="${cartListDTO.cart_code }">
						  </td>

                          <td class="">
							<fmt:formatNumber value="${cartListDTO.pro_price}" type="currency" currencySymbol="" groupingUsed="true"  maxFractionDigits="0"/>원
						  </td>
						  
						  <td>포인트 : 0</td>

						  <td>기본배송</td>
						  
						  <td class="count-input">
							<a class="incr-btn" name="btn_cart_amount_change" data-action="decrease" href="#"><i class="fa fa-minus"></i></a>
							<input class="quantity" type="text" name="cart_amount" style="width:80px" value="${cartListDTO.cart_amount }">
							<a class="incr-btn" name="btn_cart_amount_change" data-action="increase" href="#"><i class="fa fa-plus"></i></a>
						</td>

						<td class="">
							<fmt:formatNumber value="${cartListDTO.unitprice}" type="currency" currencySymbol="" groupingUsed="true"  maxFractionDigits="0"/>원
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
                        <li>총 결제금액 <span class="grandTotal"><fmt:formatNumber value="${cart_tot_price}" type="number" pattern="#,##0" />원</span></li>
					</c:if>	
					<c:if test="${empty cart_list}">
						<li>[장바구니에 담은 상품이 없습니다.]</li>
					</c:if>
					</ul>
                    </div>
                  </div>
                  <div class="checkBtnArea">
                    <a href=""  id="btn_order" class="btn btn-primary btn-default">주문하기<i class="fa fa-arrow-circle-right" aria-hidden="true"></i></a>
                  </div>
                </form>
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

							//수량변경시 새로고침
							location.href = "/cart/cart_list";
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

				location.href = "/cart/cart_empty";
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