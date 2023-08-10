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
                <h2>상품목록</h2>
              </div>
            </div>
            <div class="col-md-6">
              <ol class="breadcrumb float-right">
                <li>
                  <a href="/">Home</a>
                </li>
                <li class="active">상품목록</li>
              </ol>
            </div>
          </div>
        </div>
      </section>

      <!-- MAIN CONTENT SECTION -->
<section class="mainContent clearfix productsContent">
        <div class="container">
          <div class="row">
            <div class="col-lg-3 col-md-4 sideBar">
              <div class="panel panel-default">
                <div class="panel-heading">상품 카테고리</div>
                <div class="panel-body">
                  <div class="collapse navbar-collapse navbar-ex1-collapse navbar-side-collapse">
                    <ul class="nav navbar-nav side-nav" id="accordion2" role="tablist" aria-multiselectable="true">
                      <li>
                        <div class="" role="tab" id="heading1">
                          <a href="javascript:;" data-toggle="collapse" aria-expanded="true" data-target="#TOP" aria-controls="TOP" class="">TOP <i class="fa fa-plus"></i></a>
                        </div>
                        
                        <ul id="TOP" class="collapseItem collapse show" role="tabpanel" aria-labelledby="heading1" data-parent="#accordion2" style="">
                          <li><a href="/product/pro_list/8/긴팔티"><i class="fa fa-caret-right" aria-hidden="true"></i>긴팔티</a></li>
                          <li><a href="/product/pro_list/9/니트"><i class="fa fa-caret-right" aria-hidden="true"></i>니트</a></li>
                          <li><a href="/product/pro_list/10/맨투맨"><i class="fa fa-caret-right" aria-hidden="true"></i>맨투맨 &amp; 후드티 </a></li>
                          <li><a href="/product/pro_list/11/프린팅티"><i class="fa fa-caret-right" aria-hidden="true"></i>프린팅티</a></li>
                          <li><a href="/product/pro_list/12/나시"><i class="fa fa-caret-right" aria-hidden="true"></i>나시</a></li>
                          <li><a href="/product/pro_list/13/반팔티"><i class="fa fa-caret-right" aria-hidden="true"></i>반팔티</a></li>
                        </ul>
                      </li>

                      <li>
                        <div class="" role="tab" id="heading2">
                          <a href="javascript:;" data-toggle="collapse" aria-expanded="false" data-target="#PANTS" aria-controls="PANTS">PANTS <i class="fa fa-plus"></i></a>
                        </div>
                        
                        <ul id="PANTS" class="collapse collapseItem" role="tabpanel" aria-labelledby="heading2" data-parent="#accordion2">
                          <li><a href="/product/pro_list/14/밴딩팬츠"><i class="fa fa-caret-right" aria-hidden="true"></i>밴딩팬츠</a></li>
                          <li><a href="/product/pro_list/15/청바지"><i class="fa fa-caret-right" aria-hidden="true"></i>청바지</a></li>
                          <li><a href="/product/pro_list/16/슬랙스"><i class="fa fa-caret-right" aria-hidden="true"></i>슬랙스</a></li>
                          <li><a href="/product/pro_list/17/면바지"><i class="fa fa-caret-right" aria-hidden="true"></i>면바지</a></li>
                          <li><a href="/product/pro_list/18/반바지"><i class="fa fa-caret-right" aria-hidden="true"></i>반바지</a></li>
                        </ul>
                      </li>

                      <li>
                        <div class="" role="tab" id="heading3">
                          <a href="javascript:;" data-toggle="collapse" aria-expanded="false" data-target="#SHIRTS" aria-controls="SHIRTS">SHIRTS <i class="fa fa-plus"></i></a>
                        </div>

                        <ul id="SHIRTS" class="collapse collapseItem" role="tabpanel" aria-labelledby="heading3" data-parent="#accordion2">
                          <li><a href="/product/pro_list/19/헨리넥"><i class="fa fa-caret-right" aria-hidden="true"></i>헨리넥&차이나</a></li>
                          <li><a href="/product/pro_list/20/베이직"><i class="fa fa-caret-right" aria-hidden="true"></i>베이직</a></li>
                          <li><a href="/product/pro_list/21/체크"><i class="fa fa-caret-right" aria-hidden="true"></i>체크 &amp; 패턴 </a></li>
                          <li><a href="/product/pro_list/22/청남방"><i class="fa fa-caret-right" aria-hidden="true"></i>청남방</a></li>
                          <li><a href="/product/pro_list/23/스트라이프"><i class="fa fa-caret-right" aria-hidden="true"></i>스트라이프</a></li>
                        </ul>
                      </li>

                      <li>
                        <div class="" role="tab" id="heading4">
                          <a href="javascript:;" data-toggle="collapse" aria-expanded="false" data-target="#OUTER" aria-controls="OUTER">OUTER<i class="fa fa-plus"></i></a>
                        </div>
                        
                        <ul id="OUTER" class="collapse collapseItem" role="tabpanel" aria-labelledby="heading4" data-parent="#accordion2">
                          <li><a href="/product/pro_list/24/패딩"><i class="fa fa-caret-right" aria-hidden="true"></i>패딩</a></li>
                          <li><a href="/product/pro_list/25/코트"><i class="fa fa-caret-right" aria-hidden="true"></i>코트</a></li>
                          <li><a href="/product/pro_list/26/수트"><i class="fa fa-caret-right" aria-hidden="true"></i>수트 &amp; 블레이저 </a></li>
                          <li><a href="/product/pro_list/27/자켓"><i class="fa fa-caret-right" aria-hidden="true"></i>자켓</a></li>
                          <li><a href="/product/pro_list/28/블루종"><i class="fa fa-caret-right" aria-hidden="true"></i>블루종 &amp; MA-1 </a></li>
                          <li><a href="/product/pro_list/29/가디건"><i class="fa fa-caret-right" aria-hidden="true"></i>가디건 &amp; 조끼 </a></li>
                          <li><a href="/product/pro_list/30/후드"><i class="fa fa-caret-right" aria-hidden="true"></i>후드 &amp; 집업</a></li>
                        </ul>
                      </li>

					            <li>
                        <div class="" role="tab" id="heading5">
                          <a href="javascript:;" data-toggle="collapse" aria-expanded="false" data-target="#SHOES" aria-controls="SHOES">SHOES<i class="fa fa-plus"></i></a>
                        </div>
                        
                        <ul id="SHOES" class="collapse collapseItem" role="tabpanel" aria-labelledby="heading5" data-parent="#accordion2">
                          <li><a href="/product/pro_list/31/스니커즈"><i class="fa fa-caret-right" aria-hidden="true"></i>스니커즈</a></li>
                          <li><a href="/product/pro_list/32/로퍼"><i class="fa fa-caret-right" aria-hidden="true"></i>로퍼 &amp; 구두</a></li>
                          <li><a href="/product/pro_list/33/키높이신발"><i class="fa fa-caret-right" aria-hidden="true"></i>키높이신발 &amp; 깔창</a></li>
                          <li><a href="/product/pro_list/34/슬리퍼"><i class="fa fa-caret-right" aria-hidden="true"></i>슬리퍼 &amp; 샌들</a></li>
                        </ul>
                      </li>

					            <li>
                        <div class="" role="tab" id="heading6">
                          <a href="javascript:;" data-toggle="collapse" aria-expanded="false" data-target="#BAG" aria-controls="BAG">BAG <i class="fa fa-plus"></i></a>
                        </div>
                        
                        <ul id="BAG" class="collapse collapseItem" role="tabpanel" aria-labelledby="heading6" data-parent="#accordion2">
                          <li><a href="/product/pro_list/35/백팩"><i class="fa fa-caret-right" aria-hidden="true"></i>백팩</a></li>
                          <li><a href="/product/pro_list/36/토트"><i class="fa fa-caret-right" aria-hidden="true"></i>토트 / 후드티 </a></li>
                          <li><a href="/product/pro_list/37/크로스백"><i class="fa fa-caret-right" aria-hidden="true"></i>크로스백</a></li>
                          <li><a href="/product/pro_list/38/클러치"><i class="fa fa-caret-right" aria-hidden="true"></i>클러치</a></li>
                        </ul>
                      </li>

					            <li>
                        <div class="" role="tab" id="heading6">
                          <a href="javascript:;" data-toggle="collapse" aria-expanded="false" data-target="#ACC" aria-controls="ACC">ACC <i class="fa fa-plus"></i></a>
                        </div>
                        
                        <ul id="ACC" class="collapse collapseItem" role="tabpanel" aria-labelledby="heading6" data-parent="#accordion2">
                          <li><a href="/product/pro_list/39/양말"><i class="fa fa-caret-right" aria-hidden="true"></i>양말 &amp; 넥타이 </a></li>
                          <li><a href="/product/pro_list/40/모자"><i class="fa fa-caret-right" aria-hidden="true"></i>모자</a></li>
                          <li><a href="/product/pro_list/41/머플러"><i class="fa fa-caret-right" aria-hidden="true"></i>머플러 &amp; 장갑 </a></li>
                          <li><a href="/product/pro_list/42/아이웨이"><i class="fa fa-caret-right" aria-hidden="true"></i>아이웨이</a></li>
                          <li><a href="/product/pro_list/43/벨트"><i class="fa fa-caret-right" aria-hidden="true"></i>벨트 &amp; 시계 </a></li>
                          <li><a href="/product/pro_list/44/기타"><i class="fa fa-caret-right" aria-hidden="true"></i>기타</a></li>

                        </ul>
                      </li>

                    </ul>
                  </div>
                </div>
              </div>

              <!-- 가격검색 -->

            </div>
            <div class="col-lg-9 col-md-8">
              <div class="row filterArea">
                <div class="col-12">
                  <div class="btn-group float-right" role="group">
                    <button type="button" class="btn btn-default active" onclick="window.location.href='product-grid-left-sidebar.html'"><i class="fa fa-th" aria-hidden="true"></i><span>Grid</span></button>
                    <!-- <button type="button" class="btn btn-default" onclick="window.location.href='product-list-left-sidebar.html'"><i class="fa fa-th-list" aria-hidden="true"></i><span>List</span></button> -->
                  </div>
                </div>
              </div>


              <!--리스트 출력-->
              <div class="row">
                <c:forEach items="${pro_list }" var="productVO">
                <div class="col-md-6 col-lg-4">
                  <div class="productBox">
                    <div class="productImage clearfix">
                      <img src="/product/displayImage?folderName=${productVO.pro_up_folder }&fileName=${productVO.pro_img}" style="width: 250px; height: 280px;" alt="products-img">
                      <div class="productMasking">
                        <!-- 찜, 장바구니 담기, 상세보기-->
                        <ul class="list-inline btn-group" role="group">
                          <li><a class="btn btn-default btn-wishlist"><i class="fa fa-heart-o"></i></a></li>
                          <li><a href="javascript:void(0)" name="btn_cart" class="btn btn-default" data-pro_num="${productVO.pro_num}" data-toast="" data-toast-type="success" data-toast-position="topRight" data-toast-icon="icon-circle-check" data-toast-title="상품이" data-toast-message="장바구니 담겼습니다!"><i class="fa fa-shopping-basket"></i></a></li>
                          <li><a class="btn btn-default" data-toggle="modal" data-target="#quick-view-${productVO.pro_num}"><i class="fa fa-eye"></i></a></li>
                          <input type="hidden" name='pro_num' value='pro_num'>
                        </ul>
                        <!-- END -->
                      </div>
                    </div>
                    <div class="productCaption clearfix">
                      <a class="move" href="${productVO.pro_num}">
                        <h5>${productVO.pro_name}</h5>
                      </a>
                      <h3 id="productPrice"><fmt:formatNumber type="currency" pattern="₩#,###" value="${productVO.pro_price}"/> 원</h3>
                    </div>
                  </div>
                </div>
              </c:forEach>
                <!--리스트 끝-->

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

		<!-- PORDUCT QUICK VIEW MODAL -->
    <c:forEach items="${pro_list }" var="productVO">
		<div class="modal fade quick-view" id="quick-view-${productVO.pro_num}"  tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<div class="media flex-wrap">
							<div class="media-left px-0">
								<img class="media-object" src="/product/displayImage?folderName=${productVO.pro_up_folder }&fileName=${productVO.pro_img}" alt="Image" style="width: 450px; height: 450px; object-fit: cover;">
							</div>

							<div class="media-body">
								<h2>${productVO.pro_name}</h2>
								<h3><fmt:formatNumber type="currency" pattern="₩#,###" value="${productVO.pro_price}"/> 원</h3>
								<p>${productVO.pro_content}</p>


								<div class="btn-area">
									<a href="${productVO.pro_num}"  class="btn btn-primary btn-block quick-view-detail">제품 상세보기<i class="fa fa-angle-right" aria-hidden="true"></i></a>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
  </c:forEach>


  <!-- 디테일 페이지이동 -->
  <div class="row">
    <div class="col-md-12">
      <ul class="pagination pagination-sm no-margin pull-right">
        <c:if test="${pageMaker.prev }">
          <li><a href="${pageMaker.startPage - 1}">[prev]</a></li>
        </c:if>
  
        <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
          <li ${pageMaker.cri.pageNum==pageNum ? "class='active'" : "" }><a href="${pageNum }">${pageNum }</a></li>
        </c:forEach>
  
  
        <c:if test="${pageMaker.next }">
          <li><a href="${pageMaker.endPage + 1}">[next]</a></li>
        </c:if>
      </ul>
      <!-- 페이징정보. Criteria 클래스 필드정보작업 -->
      <form id="actionForm" action="/product/pro_list" method="get">
        <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
        <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
      </form>
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

    $(document).ready(function() {

      let actionForm = $("#actionForm");

      // 장바구니 클릭
      $("a[name=btn_cart]").on("click", function() {

        $.ajax({
          url: '/cart/cart_add',
          type: 'post',
          data: {pro_num : $(this).data("pro_num"), cart_amount : 1},
          success: function(result) {
            if(result == "success") {
              //새로고침
              location.reload(false);
            }
          }
        });
      });

      //상품이름 클릭시 디테일페이지로 전환
      $("a.move").on("click", function(e) {
        e.preventDefault(); // a태그의 하이퍼링크 기능이 취소.

        let pro_num = $(this).attr("href");
        
        console.log("상품코드: " + pro_num);

        //location.href = "/board/get?bno=" + bno;
        // 목록에서 글번호 선택후, 다시 뒤로가기버튼 클릭시 나타나는 문제발생때문에 아래코드 작업이 필요.
        actionForm.find("input[name='pro_num']").remove();

        actionForm.append("<input type='hidden' name='pro_num' value='" + pro_num + "'>");
        actionForm.attr("action", "/product/pro_detail");
        actionForm.submit();

      });

      // 제품 상세보기 클릭 시 디테일 페이지로 이동
      $(".quick-view-detail").on("click", function(e) {
          e.preventDefault(); // a태그의 하이퍼링크 기능이 취소.

          let pro_num = $(this).attr("href");

          // 목록에서 글번호 선택 후, 다시 뒤로가기 버튼 클릭시 나타나는 문제발생 때문에 아래코드 작업이 필요.
          actionForm.find("input[name='pro_num']").remove();

          actionForm.append("<input type='hidden' name='pro_num' value='" + pro_num + "'>");
          actionForm.attr("action", "/product/pro_detail");
          actionForm.submit();
      });


          // jQuery UI slider
          $("#price-range").slider({
            range: true,
            min: 0,
            max: 499000,
            values: [0, 499000],
            slide: function(event, ui) {
              $("#price-amount-1").val("₩" + ui.values[0]);
              $("#price-amount-2").val("₩" + ui.values[1]);
            }
          });

          // Initialize price amount fields
          $("#price-amount-1").val("₩" + $("#price-range").slider("values", 0));
          $("#price-amount-2").val("₩" + $("#price-range").slider("values", 1));


      


    });// 제이쿼리 끝 
</script>


</body>
</html>