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
                <h2>상품설명</h2>
              </div>
            </div>
            <div class="col-md-6">
              <ol class="breadcrumb float-right">
                <li>
                  <a href="/">Home</a>
                </li>
                <li class="active">상품설명</li>
              </ol>
            </div>
          </div>
        </div>
      </section>

      <!-- MAIN CONTENT SECTION -->
      <section class="mainContent clearfix">
        <div class="container">
          <div class="row singleProduct">
            <div class="col-md-12">
              <div class="media flex-wrap mb-5">
                <div class="media-left productSlider">
                  <div id="carousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner SingleProductItem">


                      <div class="" data-thumb="0" >
                        <img style="width:100%" src="/product/displayImage?folderName=${productVO.pro_up_folder }&fileName=${productVO.pro_img}">
                        <a data-fancybox="images" href="/product/displayImage?folderName=${productVO.pro_up_folder }&fileName=${productVO.pro_img}" class="product-content">
                          <div class="MaskingIcon"><i class="fa fa-plus"></i></div>
                        </a>
                      </div>

                    </div>
                  </div>
                  
                </div>
                <div class="media-body">
                  <ul class="list-inline">
                    <li class="mb-4 mb-md-0">
                      <a href="/"><i class="fa fa-reply" aria-hidden="true"></i>
                        홈페이지 돌아가기
                      </a>
                    </li>

                    <li class="share-all mr-0">
                      <!-- <a class="social-link" href="javascript:void(0)"><i class="fa fa-plus" aria-hidden="true"></i>
                          공유하기(미구현)
                      </a> -->

                      <span class="all-link">
                        <a class="SingleSocialIcon" href="javascript:void(0)">
                          <i class="fa fa-facebook" aria-hidden="true"></i>
                        </a>

                        <a class="SingleSocialIcon" href="javascript:void(0)">
                          <i class="fa fa-twitter" aria-hidden="true"></i>
                        </a>

                        <a class="SingleSocialIcon" href="javascript:void(0)">
                          <i class="fa fa-instagram" aria-hidden="true"></i>
                        </a>

                        <a class="SingleSocialIcon" href="javascript:void(0)">
                          <i class="fa fa-google-plus" aria-hidden="true"></i>
                        </a>
                      </span>
                    </li>
                  </ul>

                  <h2>${productVO.pro_name}</h2>
                  <h3><fmt:formatNumber type="currency" pattern="₩#,###" value="${productVO.pro_price}"/>원</h3>
                  <p>${productVO.pro_content}</p>
                  <div class="row">

                    <div class="col-12">
                      <div class="d-flex align-items-center mb-5 pt-3">
                        <h5 class="mr-4">수량</h5>
                        <div class="SingleCartListInner cartListInner pl-1">
                          <form action="#">
                            <div class="table-responsive">
                              <table class="table">
                                <tbody>
                                  <tr class="border-0">
                                    <td class="count-input border-0 p-0">
                                      <a class="incr-btn" data-action="decrease" href="#"><i class="fa fa-minus"></i></a>
                                      <input class="quantity" id="pro_amount" type="text" value="1">
                                      <a class="incr-btn" data-action="increase" href="#"><i class="fa fa-plus"></i></a>
                                    </td>
                                  </tr>
                                </tbody>
                              </table>
                            </div>
                          </form>
                        </div>
                      </div>
                    </div>
                  </div>
                 
                  <div class="btn-area mb-0">
                    <!-- <a href="cart-page.html" class="btn btn-primary-outlined btn-default">장바구니 담기1234</a>
                    <a href="cart-page.html" class="btn btn-primary-outlined btn-default">제품 구매하기123<i class="fa fa-angle-right" aria-hidden="true"></i></a> -->
                    <button type="button" class="btn btn-primary btn-default" name="btn_cart"  data-pro_num="${productVO.pro_num}">장바구니 담기</button>
                    <button type="button" class="btn btn-primary btn-default" name="btn_order" data-pro_num="${productVO.pro_num}">구매하기<i class="fa fa-angle-right" aria-hidden="true"></i></button>
                  </div>

                </div>
              </div>
            </div>
          </div>

          <!-- 댓글 구현 예정 
          <div class="row singleProduct singleProductTab">
            <div class="col-12">
              <div class="media mb-4">
                <div class="media-body">
                  <div class="tabArea">
                    <ul class="nav nav-tabs bar-tabs">
                      <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#Reviews">상품리뷰</a></li>
                    </ul>
                    <div class="tab-content">

                      <div id="Reviews" class="tab-pane fade show active">
                        <div class="media mb-5">
                          <img class="mr-4 rounded rounded-circle" src="assets/img/blog/blog-small2-01.jpg" alt="Generic placeholder image">
                          <div class="media-body">
                            <h4 class="mt-0 mb-2">Lorem ipsum dolor</h4>

                            <ul class="text-warning d-flex mb-1">
                              <li class="mr-1"><i class="fa fa-star" aria-hidden="true"></i></li>
                              <li class="mr-1"><i class="fa fa-star" aria-hidden="true"></i></li>
                              <li class="mr-1"><i class="fa fa-star" aria-hidden="true"></i></li>
                              <li class="mr-1"><i class="fa fa-star" aria-hidden="true"></i></li>
                              <li class=""><i class="fa fa-star-half-o" aria-hidden="true"></i></li>
                            </ul>

                            <p class="mt-0 mb-3">Lorem ipsum dolor sit amet consectetur adipisicing elit. Distinctio dolorum quasi magni mollitia suscipit blanditiis nihil id autem? Voluptates, minima expedita doloremque amet consequuntur quam aliquid repellat architecto accusamus fuga.</p>
                            <h6 class="mt-0"><em>Rodney Artichoke</em></h6>
                          </div>
                        </div>

                        <div class="media mb-5">
                          <img class="mr-4 rounded rounded-circle" src="assets/img/blog/blog-small-02.jpg" alt="Generic placeholder image">
                          <div class="media-body">
                            <h4 class="mt-0 mb-2">Feugiat primis</h4>

                            <ul class="text-warning d-flex mb-1">
                              <li class="mr-1"><i class="fa fa-star" aria-hidden="true"></i></li>
                              <li class="mr-1"><i class="fa fa-star" aria-hidden="true"></i></li>
                              <li class="mr-1"><i class="fa fa-star" aria-hidden="true"></i></li>
                              <li class="mr-1"><i class="fa fa-star" aria-hidden="true"></i></li>
                              <li class=""><i class="fa fa-star-o" aria-hidden="true"></i></li>
                            </ul>

                            <p class="mt-0 mb-3">Feugiat primis reprehenderit proident cumque nec diam eligendi, qui iure, torquent quod sequi, taciti! Tempus leo
                            architecto accusantium cillum, taciti nascetur? Iusto facilisi dolores adipisci eros fuga, laoreet culpa molestie, arcu
                            lectus felis sunt accusantium alias mollitia eius anim eget. voluptatibus facilisi.</p>
                            <h6 class="mt-0"><em>Samanta Doe</em></h6>
                          </div>
                        </div>

                        <div class="media mb-0">
                          <img class="mr-4 rounded rounded-circle" src="assets/img/blog/blog-small-03.jpg" alt="Generic placeholder image">
                          <div class="media-body">
                            <h4 class="mt-0 mb-2">Auctor vitae egestas</h4>

                            <ul class="text-warning d-flex mb-1">
                              <li class="mr-1"><i class="fa fa-star" aria-hidden="true"></i></li>
                              <li class="mr-1"><i class="fa fa-star" aria-hidden="true"></i></li>
                              <li class="mr-1"><i class="fa fa-star" aria-hidden="true"></i></li>
                              <li class="mr-1"><i class="fa fa-star" aria-hidden="true"></i></li>
                              <li class=""><i class="fa fa-star" aria-hidden="true"></i></li>
                            </ul>

                            <p class="mt-0 mb-2">Auctor vitae egestas et. Accumsan quis nunc. Duis leo justo. Condimentum at purus eu. Amana sed dolor sem. Etiam massa
                            libero. massa libero, auctor vitae egestas et, accumsan quis nunc. Dous leou justi, condimentam at purus eus actor.
                            Auctor vitae egestas et duis Condimentum at purus eu. Aemean sed dolor sem. Etiam massa libero.</p>
                            <h6 class="mt-0"><em>Amanda Smith</em></h6>
                          </div>
                        </div>

                        <div class="mt-5 mb-2 border p-4 p-md-5">
                          <form>
                            <div class="media flex-column flex-md-row mb-0">
                              <img class="m-auto m-md-0 mr-md-4 rounded rounded-circle" src="assets/img/blog/profile-image.jpg" alt="Generic placeholder image">
                              
                              <div class="media-body mt-4 mt-md-0">
                                <h6 class="text-center text-md-left text-capitalize mt-0"><em>Rodney samp</em></h6>
                                <h6 class="text-center text-md-left ReviewsPost mt-0">Posting publicly</h6>
                            
                                <div class="rating-view mb-4">
                                  <span class="add-rating-large pl-0 m-auto m-md-0 jq-ry-container" style="width: 120px;"><div class="jq-ry-group-wrapper"><div class="jq-ry-normal-group jq-ry-group"><svg xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" viewBox="0 0 24 24" fill="#969696"><path d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" viewBox="0 0 24 24" fill="#969696" style="margin-left: 5px;"><path d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" viewBox="0 0 24 24" fill="#969696" style="margin-left: 5px;"><path d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" viewBox="0 0 24 24" fill="#969696" style="margin-left: 5px;"><path d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" viewBox="0 0 24 24" fill="#969696" style="margin-left: 5px;"><path d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z"></path></svg></div><div class="jq-ry-rated-group jq-ry-group" style="width: 0%;"><svg xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" viewBox="0 0 24 24" fill="#fec701"><path d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" viewBox="0 0 24 24" fill="#fec701" style="margin-left: 5px;"><path d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" viewBox="0 0 24 24" fill="#fec701" style="margin-left: 5px;"><path d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" viewBox="0 0 24 24" fill="#fec701" style="margin-left: 5px;"><path d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" viewBox="0 0 24 24" fill="#fec701" style="margin-left: 5px;"><path d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z"></path></svg></div></div></span>
                                </div>

                                <div class="row">
                                  <div class="form-group col-md-12">
                                    <input type="text" class="form-control" id="exampleInputPhone" placeholder="Subject" required="">
                                  </div>

                                  <div class="form-group col-md-12">
                                    <textarea class="form-control" id="exampleTextarea" rows="5" placeholder="Review"></textarea>
                                  </div>
                                </div>

                                <div class="text-center text-md-left">
                                  <button type="submit" class="btn btn-default btn-primary custom-btn">Submit Review</button>
                                </div>
                              </div>
                            </div>
                          </form>
                        </div>
                      </div>

                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          -->
          
        </div>
      </section>

    <!-- FOOTER -->
    <%@include file="/WEB-INF/views/include/footer.jsp" %>
		</div>

		<!-- 관리자 로그인 -->
		<%@include file="/WEB-INF/views/admin/adLogin.jsp" %>

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

      var isLoggedIn = <%=(session.getAttribute("loginStatus") != null) ? "true" : "false"%>;


      // 장바구니 클릭
      $("button[name=btn_cart]").on("click", function() {
          if(!isLoggedIn) {
              alert("로그인이 필요합니다.");
              location.href = "/member/login";
          } else {
              console.log("장바구니");

              $.ajax({
                  url: '/cart/cart_add',
                  type: 'post',
                  data: {pro_num : $(this).data("pro_num"), cart_amount : $("#pro_amount").val()},
                  success: function(result) {
                      if(result == "success") {
                          alert("장바구니에 추가됨");
                          if(confirm("장바구니로 이동하겠읍니까?")) {
                              location.href = "/cart/cart_list";
                          } else {
                              //아니요 클릭시, 페이지 타켓 새로고침
                              location.reload().then(() => {
                                  location.href = false;
                              });
                          }
                      }
                  }
              });
          }
      });

      //주문하기 클릭
      $("button[name=btn_order]").on("click", function() {
        
        if(!isLoggedIn) {
              alert("로그인이 필요합니다.");
              location.href = "/member/login";
        } else {
		
          $.ajax({
            url: '/cart/cart_add',
            type: 'post',
            data: {pro_num : $(this).data("pro_num"), cart_amount : $("#pro_amount").val()},
            success: function(result) {
              if(result == "success") {
                  location.href = "/order/order_info";
              }
            }
          });
        }
      });


    });// 제이쿼리 끝 
</script>
</body>
</html>