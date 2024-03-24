<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="zxx">
   <head>
      <title>Online Banking System</title>
      <!--meta tags -->
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="keywords" content="Financial Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
         SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
      <script>
         addEventListener("load", function () {
         	setTimeout(hideURLbar, 0);
         }, false);
         
         function hideURLbar() {
         	window.scrollTo(0, 1);
         }
      </script>
      <!--//meta tags ends here-->
      <!--booststrap-->
      <link href="<c:url value='/template/home/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css" media="all">
      <!--//booststrap end-->
      <!-- font-awesome icons -->
      <link href="<c:url value='/template/home/css/fontawesome-all.min.css'/>" rel="stylesheet" type="text/css" media="all">
      <!-- //font-awesome icons -->
      <!-- Owl Stylesheets -->
      <link rel="stylesheet" href="<c:url value='/template/home/css/owl.carousel.min.css'/>">
      <link rel="stylesheet" href="<c:url value='/template/home/css/owl.theme.default.min.css'/>">
      <!--stylesheets-->
      <link href="<c:url value='/template/home/css/style.css'/>" rel='stylesheet' type='text/css' media="all">
      <!--//stylesheets-->
      <link href="<c:url value='//fonts.googleapis.com/css?family=Montserrat:300,400,500'/>" rel="stylesheet">
      <link href="<c:url value='//fonts.googleapis.com/css?family=Merriweather:300,400,700,900'/>" rel="stylesheet">
   </head>
   <body>
      <div class="header-outs" id="header">
         <div class="header-w3layouts">
            <div class="container-fluid">
               <div class="row headder-contact">
                  <div class="col-lg-6 col-md-5 col-sm-5 icons px-0">
                     <ul>
                        <li><a href="#"><span class="fab fa-facebook-f"></span></a></li>
                        <li><a href="#"><span class="fas fa-envelope"></span></a></li>
                        <li><a href="#"><span class="fab fa-twitter"></span></a></li>
                     </ul>
                  </div>
                  <div class="col-lg-6 col-md-7 col-sm-7 info-contact-agile">
                     <ul>
                        <li>
                           <span class="fas fa-phone-volume"></span>
                           <p>+(000)123 4565 32</p>
                        </li>
                        <li>
                           <span class="fas fa-envelope"></span>
                           <p><a href="mailto:info@example.com">group2ebanking@gmail.com</a></p>
                        </li>
                        <li>
                        </li>
                     </ul>
                  </div>
               </div>
               <!--//navigation section -->
               <nav class="navbar navbar-expand-lg navbar-light">
                  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                  </button>
                  <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
                     <ul class="navbar-nav ">
                        <li class="nav-item active">
                           <a class="nav-link" href="<c:url value='/home'/>">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                           <a href="#about" class="nav-link scroll">About</a>
                        </li>
                        <li class="nav-item">
                           <a href="#service" class="nav-link scroll">Partners</a>
                        </li>
                        <li class="nav-item">
                           <a href="#stats" class="nav-link scroll">Stats</a>
                        </li>
                        <li class="nav-item">
                           <a href="#testimonials" class="nav-link scroll">Clients</a>
                        </li>
                        <li class="nav-link">
                           <a href="<c:url value='/register'/>" class="nav-link">Register</a>
                        </li>
                        
                     </ul>
                  </div>
               </nav>
               <div class="hedder-up">
                  <h1><a class="navlink-brand" href="<c:url value='/login'/>">LOGIN</a></h1>
               </div>
               <!--//navigation section -->
               <div class="clearfix"> </div>
            </div>
         </div>
         <!--banner -->
         <!-- Slideshow 4 -->
         <div class="slider">
            <div class="callbacks_container">
               <ul class="rslides" id="slider4">
                  <li>
                     <div class="slider-img one-img">
                        <div class="container">
                           <div class="slider-info text-center">
                              <h4>Personal Finance Services</h4>
                              <h5>Saving Loan </h5>
                              <p>Funding for buying your new house, house construction, renovation and 
                                 repair with attractive incentives, flexible options.
                              </p>
                              <!-- <div class="outs_more-buttn">
                                 <a href="#contact" class="scroll">Book Now</a>
                                 </div> -->
                           </div>
                        </div>
                     </div>
                  </li>
                  <li>
                     <div class="slider-img two-img">
                        <div class="container">
                           <div class="slider-info text-center">
                              <h4>Making Easy For You</h4>
                              <h5>Payment and Transfer</h5>
                              <p>Send and receive money domestically through E-Banking system.
                                 Conduct international inward and outward remittance through banking system in a fast, safe and convenient manner.
                                 Multi – utility payment services allow customers to pay service bills via different payment channels of E-Banking.
                              </p>
                              <!-- <div class="outs_more-buttn">
                                 <a href="#contact" class="scroll">Book Now</a>
                                 </div> -->
                           </div>
                        </div>
                     </div>
                  </li>
                  
               </ul>
            </div>
            <!-- This is here just to demonstrate the callbacks -->
            <!-- <ul class="events">
               <li>Example 4 callback events</li>
               </ul>-->
         </div>
         <div class="clearfix"></div>
      </div>
      <!-- //banner -->
      <!-- About-one -->
      <section class="about py-lg-4 py-md-3 py-sm-3 py-3" id="about">
         <div class="container py-lg-5 py-md-5 py-sm-4 py-3">
            <div class="title-sub text-left mb-lg-5 mb-md-4 mb-sm-4 mb-3">
               <h3 class="title mb-md-4 mb-sm-3 mb-3">Scope</h3>
               <p>Our mission is to offer most effective banking & finance<br> solutions to our customers, especially the young and active segment.<br>
                   Based on our advanced technological infrastructure and specialized management, E-Banking has always been pioneering in setting trends in modern banking services, aiming to become the leading digital bank in Vietnam. </p>
            </div>
            <div class="row abt-colm pb-lg-4 pb-md-3 pb-3">
               <div class="col-lg-5 agile-info-img">
                  <img src="<c:url value='/template/home/images/ab1.jpg'/>" class="img-fluid" alt="">
               </div>
               <div class="col-lg-5 agile-abt-info about-grid">
                  <div class="info-sub-w3">
                  	<h4>SAVINGS</h4>
                     <h5>Regular Term Savings - Interest Paid Periodically
                     </h5>
                  </div>           
                  <div class="info-sub-w3">
                     <p>You can make wise savings decisions with E-Banking's fixed term savings accounts.
                         Lock your money in a secure savings account that will earn some of the highest 
                        interest rates for the amount of time you 
                        are most comfortable with and watch your future grow.
                     </p>
                  </div>
                  <div class="outs-about-buttn mt-lg-4 mt-md-3 mt-3">
                     <a href="#" data-toggle="modal" data-target="#exampleModalLive">Read More</a>
                  </div>
               </div>
            </div>
            <div class="row abt-colm my-lg-5 my-md-4 my-3">
               <div class="offset-md-2 col-lg-5 agile-abt-info text-right">
                  <div class="info-sub-w3">
                  	<h4>Loan</h4>
                     <h5>We offer some of the lowest rates compared to other banks
                     </h5>
                  </div>                  
                  <div class="info-sub-w3">
                     <p>Are you in need of a loan to expand your business or start a business today? 
                        E-Banking supports your business plan quickly, simple procedures with flexible incentives 
                        to help you achieve your business goals.
                  </div>
                  <div class="outs-about-buttn mt-lg-4 mt-md-3 mt-3">
                     <a href="#" data-toggle="modal" data-target="#exampleModalLive">Read More</a>
                  </div>
               </div>
               <div class="col-lg-5 agile-info-img about-grid">
                  <img src="<c:url value='/template/home/images/ab2.jpg'/>" class="img-fluid" alt="">
               </div>
            </div>
            <div class="row abt-colm pt-lg-4 pt-md-3 pt-3">
               <div class="col-lg-5 agile-info-img">
                  <img src="<c:url value='/template/home/images/ab3.jpg'/>" class="img-fluid" alt="">
               </div>
               <div class="col-lg-5 agile-abt-info about-grid">
                  <div class="info-sub-w3">
                  	<h4>Deposit</h4>
                     <h5>We corporate customer places and 
                        performs deposit transaction through E-Banking </h5>
                  </div>                  
                  <div class="info-sub-w3">
                     <p>Deposit shall be made and terminated systematically, physical visit at the Bank’s counter is not necessary.
                        Flexible deposit tenor. High deposit interest rate
                     </p>
                  </div>
                  <div class="outs-about-buttn mt-lg-4 mt-md-3 mt-3">
                     <a href="#" data-toggle="modal" data-target="#exampleModalLive">Read More</a>
                  </div>
               </div>
            </div>
            <!-- //About-one -->
         </div>
      </section>
      <!--states -->
      <section class="stats py-lg-4 py-md-3 py-sm-3 py-3 " id="stats">
         <div class="container py-lg-5 py-md-5 py-sm-4 py-3">
            <div class="jst-must-info text-center">
               <div class="row stats-info">
                  <div class="col-md-3 col-sm-6 col-6 stats-grid-1">
                     <div class=" stats-grid">
                        <div class="counter">2</div> 
                        <div class="stat-info">
                           <h5 class="pt-2">Experience Year</h5>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-3 col-sm-6 col-6 stats-grid-2">
                     <div class=" stats-grid">
                        <div class="counter">35.000</div>
                        <div class="stat-info">
                           <h5 class="pt-2"> Staffs</h5>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-3 col-sm-6 col-6 stats-grid-3">
                     <div class=" stats-grid">
                        <div class="counter">648.700</div>
                        <div class="stat-info">
                           <h5 class="pt-2">Accounts</h5>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-3 col-sm-6 col-6 stats-grid-4">
                     <div class=" stats-grid">
                        <div class="counter">1.572.769</div>
                        <div class="stat-info">
                           <h5 class="pt-2"> Transactions </h5>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!--//states -->
      <!--service-->	
      <section class="service py-lg-4 py-md-3 py-sm-3 py-3" id="service">
         <div class="container py-lg-5 py-md-5 py-sm-4 py-3">
            <div class="title-sub text-right mb-lg-5 mb-md-4 mb-sm-4 mb-3">
               <h3 class="title mb-md-4 mb-sm-3 mb-3">Our Partners</h3>
               <p>E-Banking has created many breakthrough products such as LiveBank - 24/7 automatic banking model, 
                  <br>Savy – Versatile saving application, QuickPay - payment by QR code, e-banking, digital Wallet etc
               </p>
            </div>
            <div class="row">
               <div class="col-lg-3 col-md-3 col-sm-6 col-6 ser-icon text-center">
                  <span  class="fas fa-audio-description"></span >
               </div>
               <div class="col-lg-3 col-md-3 col-sm-6 col-6 ser-icon text-center">
                  <span  class="fab fa-cc-paypal"></span >
               </div>
               <div class="col-lg-3 col-md-3 col-sm-6 col-6 ser-icon text-center">
                  <span  class="fab fa-creative-commons"></span >
               </div>
               <div class="col-lg-3 col-md-3 col-sm-6 col-6 ser-icon text-center">
                  <span class="fab fa-behance-square"></span >
               </div>
            </div>
         </div>
      </section>
      <!--//service-->
      <!-- clients -->
      <section class="clients py-lg-4 py-md-3 py-sm-3 py-3" id="testimonials">
         <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
            <div class="title-sub text-left mb-lg-5 mb-md-4 mb-sm-4 mb-3">
               <h3 class="title clr mb-md-4 mb-sm-3 mb-3">What People Says</h3>
               <p class="text-white">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod <br>tempor incididunt ut labore et</p>
            </div>
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
               <div class="carousel-inner">
                  <div class="carousel-item active">
                     <div class="row">
                        <div class="col-lg-3 col-md-4 col-sm-5 px-0 clients-w3layouts-row text-center">
                           <img src="<c:url value='/template/home/images/c1.jpg'/>" alt="" class="image-fluid">
                        </div>
                        <div class="col-lg-9 col-md-8 col-sm-7 news-agile-text ">
                           <p>
                              Such a good service, it help me a lot with various utilities.
                           </p>
                           <h4 class="mt-3">Milky Deo 
                           </h4>
                        </div>
                     </div>
                  </div>
                  <div class="carousel-item">
                     <div class="row">
                        <div class="col-lg-3 col-md-4 col-sm-5 px-0 clients-w3layouts-row text-center">
                           <img src="<c:url value='/template/home/images/c2.jpg'/>" alt="" class="image-fluid">
                        </div>
                        <div class="col-lg-9 col-md-8 col-sm-7 news-agile-text ">
                           <p>With strong development momentum, E-Bank identified their strategic objectives from now until 2020 is to become one of the top 15 banks in Vietnam,
                               a leading bank with transparency, sustainability, safety and effectiveness .
                           </p>
                           <h4 class="mt-3">Trang Pham
                           </h4>
                        </div>
                     </div>
                  </div>
                  <div class="carousel-item">
                     <div class="row">
                        <div class="col-lg-3 col-md-4 col-sm-5 px-0 clients-w3layouts-row text-center">
                           <img src="<c:url value='/template/home/images/c3.jpg'/>" alt="" class="image-fluid">
                        </div>
                        <div class="col-lg-9 col-md-8 col-sm-7 news-agile-text ">
                           <p>” I am honored to become a very lucky customer of bank. Although I am currently using banking 
                              services of many other banks, bank especially gave me a feeling of friendliness, young and dynamic that always takes care and understands customers’ demand, 
                              providing most convenient services for clients. 
                           </p>
                           <h4 class="mt-3"> Hoang Thi Thuong Huyen
                           </h4>
                        </div>
                     </div>
                  </div>
               </div>
               <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
               <span class="carousel-control-prev-icon" aria-hidden="true"></span>
               <span class="sr-only">Previous</span>
               </a>
               <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
               <span class="carousel-control-next-icon" aria-hidden="true"></span>
               <span class="sr-only">Next</span>
               </a>
            </div>
         </div>
      </section>
      <!--//clients -->
      
      
  
      <footer class="buttom-footer py-lg-4 py-md-3 py-sm-3 py-3">
         <section >
            <div class="container py-lg-5 py-md-5 py-sm-4 py-4">
               <div class="">
                  <div class="row footer-agile-grids ">                    
                     <div class="wthree-left-right col-lg-12 col-md-12 col-sm-12">
                        <h4 class="pb-lg-3 pb-3">Contact</h4>
                        <div class="bottom-para pb-12">
                           <p>410 C Hanoi University Km9 Nguyen Trai- Nam Tu liem -  Hanoi</p>
                        </div>
                        <div class="bottom-para">
                           <p>+(000) 123 4565 32 <br>+(010) 123 4565 354</p>
                        </div>
                        <div class="bottom-para pt-3">
                           <p><a href="mailto:info@example.com">group2ebanking@gmail.com </a> 
                              <br><a href="mailto:info@example.com">1801040055@s.hanu.edu.vn</a>
                           </p>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </section>
         
      </footer>
      <!-- //footer -->
      <!--model-->
      <div id="exampleModalLive" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLiveLabel" aria-hidden="true">
         <div class="modal-dialog" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <h4 class="modal-title" id="exampleModalLiveLabel">Financial</h4>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                  </button>
               </div>
               <div class="modal-body">
                  <img src="<c:url value='/template/home/images/b2.jpg'/>" alt="" class="img-fluid">
                  <p>You can now use a E-Banking savings account to generate immediate extra cash 
                     from your existing funds and gain additional credit worthiness. You can 
                     select the amount of time you are comfortable to lock away your money and 
                     take advantage of a secure savings account that offers a competitive interest rate.
                     E-Banking supports small individual and family businesses by offering competitive business loans to
                      those who want to increase their working capital, invest in new premises or equipment, or expand their busines


                  </p>
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  <button type="button" class="btn btn-primary">Save changes</button>
               </div>
            </div>
         </div>
      </div>
      <!--//model-->
      <!--js working-->
      <script src='<c:url value='/template/home/js/jquery-2.2.3.min.js'/>'></script>
      <!--//js working--> 
      <!--responsiveslides banner-->
      <script src="<c:url value='/template/home/js/responsiveslides.min.js'/>"></script>
      <script>
         // You can also use "$(window).load(function() {"
         $(function () {
         	// Slideshow 4
         	$("#slider4").responsiveSlides({
         		auto: true,
         		pager:false,
         		nav:true ,
         		speed: 900,
         		namespace: "callbacks",
         		before: function () {
         			$('.events').append("<li>before event fired.</li>");
         		},
         		after: function () {
         			$('.events').append("<li>after event fired.</li>");
         		}
         	});
         
         });
      </script>
      <!--// responsiveslides banner-->		  
      <!--About OnScroll-Number-Increase-JavaScript -->
      <script src="<c:url value='/template/home/js/jquery.waypoints.min.js'/>"></script>
      <script src="<c:url value='/template/home/js/jquery.countup.js'/>"></script>
      <script>
         $('.counter').countUp();
      </script>
      <!-- //OnScroll-Number-Increase-JavaScript -->
      <!--Owl slider blog -->
      <script src="<c:url value='/template/home/js/owl.carousel.js'/>"></script>
      <script>
         $(document).ready(function() {
           $('.owl-carousel').owlCarousel({
             loop: true,
             margin: 10,
             responsiveClass: true,
             responsive: {
               0: {
                 items: 1,
                 nav: true
               },
         991: {
                 items: 2,
                 nav:true,
               },
               600: {
                 items: 2,
                 nav: true,
               },
               1000: {
                 items: 3,
                 nav: true,
                 loop: false,
                 margin: 15
               }
             }
           })
         })
      </script>
      <!--// Owl slider blog -->
      <!-- start-smoth-scrolling -->
      <script src="<c:url value='/template/home/js/move-top.js'/>"></script>
      <script src="<c:url value='/template/home/js/easing.js'/>"></script>
      <script>
         jQuery(document).ready(function ($) {
         	$(".scroll").click(function (event) {
         		event.preventDefault();
         		$('html,body').animate({
         			scrollTop: $(this.hash).offset().top
         		}, 900);
         	});
         });
      </script>
      <!-- start-smoth-scrolling -->
      <!-- here stars scrolling icon -->
      <script>
         $(document).ready(function () {
         
         	var defaults = {
         		containerID: 'toTop', // fading element id
         		containerHoverID: 'toTopHover', // fading element hover id
         		scrollSpeed: 1200,
         		easingType: 'linear'
         	};
         
         
         	$().UItoTop({
         		easingType: 'easeOutQuart'
         	});
         
         });
      </script>
      <!-- //here ends scrolling icon -->
      <!--bootstrap working-->
      <script src="<c:url value='/template/home/js/bootstrap.min.js'/>"></script>
      <!-- //bootstrap working-->
   </body>
</html>