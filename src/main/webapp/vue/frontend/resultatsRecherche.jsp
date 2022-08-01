<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Résultats de la recherche</title>
	<!-- CSS 
	    ========================= -->
	    <link rel="stylesheet" href="vue/frontend/assets/css/vendor/bootstrap.min.css">
	    <link rel="stylesheet" href="vue/frontend/assets/css/slick.css">
	    <link rel="stylesheet" href="vue/frontend/assets/css/owl.carousel.min.css">
	    <link rel="stylesheet" href="vue/frontend/assets/css/ionicons.min.css">
	    <link rel="stylesheet" href="vue/frontend/assets/css/pe-icon-7-stroke.css">
	    <link rel="stylesheet" href="vue/frontend/assets/css/animate.css">
	    <link rel="stylesheet" href="vue/frontend/assets/css/nice-select.css">
	    <link rel="stylesheet" href="vue/frontend/assets/css/magnific-popup.css">
	    <link rel="stylesheet" href="vue/frontend/assets/css/jquery-ui.min.css">
	    <!-- Main Style CSS -->
	    <link rel="stylesheet" href="vue/frontend/assets/css/style.css">    
	    <link rel="stylesheet" href="vue/frontend/assets/css/my_style.css">
	
	    <!--modernizr min js here-->
	    <script src="vue/frontend/assets/js/vendor/modernizr-3.11.2.min.js"></script>
	</head>
	<body>
	 <jsp:include page="/headerC" />
	 
    <!-- breadcrumbs area start -->
    <div class="breadcrumbs_aree breadcrumbs_bg mb-100" data-bgimg="assets/img/others/breadcrumbs-bg.png">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumbs_text">
                        <h1>Recherche : "${param.requete }"</h1>
                        <ul>
                            <li><a href="accueil">Accueil </a></li>
                            <li> // Recherche</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- breadcrumbs area end -->

    <!-- product page section start -->
    <div class="product_page_section mb-100">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="product_page_wrapper">
                        <!--shop toolbar area start-->
                        <div class="product_sidebar_header mb-60 d-flex justify-content-between align-items-center">
                            <!-- <div class="page__amount border">
                                <p><span>12</span> Product Found of <span>30</span></p>
                            </div> -->
                            <div class="product_header_right d-flex align-items-center">
                               <!--  <div class="sorting__by d-flex align-items-center">
                                    <span>Sort By : </span>
                                    <form class="select_option" action="#">
                                        <select name="orderby" id="short">
                                            <option selected value="1">Default</option>
                                            <option value="2">Sort by popularity</option>
                                            <option value="3">Sort by newness</option>
                                            <option value="4"> low to high</option>
                                            <option value="5"> high to low</option>
                                            <option value="6">Product Name: Z</option>
                                        </select>
                                    </form>
                                </div> -->
                                <div class="product__toolbar__btn">
                                    <ul class="nav" role="tablist">
                                        <li class="nav-item">
                                            <a class="active" data-bs-toggle="tab" href="#grid" role="tab"
                                                aria-controls="grid" aria-selected="true"><i class="ion-grid"></i></a>
                                        </li>
                                        <li class="nav-item">
                                            <a data-bs-toggle="tab" href="#list" aria-controls="list" role="tab"
                                                aria-selected="false"><i class="ion-ios-list"></i></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!--shop toolbar area end-->


                        <!--shop gallery start-->
                        <div class="product_page_gallery">
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="grid">
                                    <div class="row grid__product">
                                    	<c:forEach items="${listeProduits }" var="produit">
	                                        <div class="col-xl-3 col-md-4 col-sm-6">
	                                            <article class="single_product wow fadeInUp" data-wow-delay="0.1s"
	                                                data-wow-duration="1.1s">
	                                                <figure>
	                                                    <div class="product_thumb">
	                                                        <a href="produit?id=${produit.id }"><img
	                                                                src="${produit.image }" alt=""></a>
	                                                        <!-- <div class="action_links">
	                                                            <ul class="d-flex justify-content-center">
	                                                                <li class="add_to_cart"><a href="cart.html"
	                                                                        title="Add to cart">
	                                                                        <span class="pe-7s-shopbag"></span></a></li>
	                                                                <li class="wishlist"><a href="#"
	                                                                        title="Add to Wishlist"><span
	                                                                            class="pe-7s-like"></span></a></li>
	                                                                <li class="quick_button"><a href="#" title="Quick View"
	                                                                        data-bs-toggle="modal"
	                                                                        data-bs-target="#modal_box"> <span
	                                                                            class="pe-7s-look"></span></a></li>
	                                                            </ul>
	                                                        </div> -->
	                                                    </div>
	                                                    <figcaption class="product_content text-center">
	                                                        <h4><a href="produit?id=${produit.id }">${produit.titre }</a></h4>
	                                                        <div class="price_box">
	                                                            <span class="current_price">${produit.prix } €</span>
	                                                        </div>
	                                                    </figcaption>
	                                                </figure>
	                                            </article>
	                                        </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="list">
                                    <div class="list__product">
	                                    <c:forEach items="${listeProduits }" var="produit">
	                                        <article class="product_list_items border-bottom">
	                                            <figure class="product_list_flex d-flex align-items-center">
	                                                <div class="product_thumb">
	                                                    <a href="produit?id=${produit.id }"><img
	                                                            src="${produit.image }" alt=""></a>
	                                                    <!-- <div class="action_links">
	                                                        <ul class="d-flex justify-content-center">
	                                                            <li class="add_to_cart"><a href="cart.html"
	                                                                    title="Add to cart">
	                                                                    <span class="pe-7s-shopbag"></span></a></li>
	                                                            <li class="wishlist"><a href="#"
	                                                                    title="Add to Wishlist"><span
	                                                                        class="pe-7s-like"></span></a></li>
	                                                            <li class="quick_button"><a href="#" title="Quick View"
	                                                                    data-bs-toggle="modal" data-bs-target="#modal_box">
	                                                                    <span class="pe-7s-look"></span></a></li>
	                                                        </ul>
	                                                    </div> -->
	                                                </div>
	                                                <figcaption class="product_list_content">
	                                                    <h4><a href="produit?id=${produit.id }">${produit.titre }</a></h4>
	                                                    <div class="product__ratting">
	                                                        <ul class="d-flex">
	                                                            <li><a href="#"><i class="ion-ios-star"></i></a></li>
	                                                            <li><a href="#"><i class="ion-ios-star"></i></a></li>
	                                                            <li><a href="#"><i class="ion-ios-star"></i></a></li>
	                                                            <li><a href="#"><i class="ion-ios-star"></i></a></li>
	                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a>
	                                                            </li>
	                                                        </ul>
	                                                    </div>
	                                                    <div class="price_box">
	                                                        <span class="current_price">${produit.prix } €</span>
	                                                    </div>
	                                                    <div class="product__desc">
	                                                        <p>${produit.description }</p>
	                                                    </div>
	                                                    <!-- <div class="action_links product_list_action">
	                                                        <ul class="d-flex">
	                                                            <li class="add_to_cart"><a href="cart.html"
	                                                                    title="Add to cart">
	                                                                    <span class="pe-7s-shopbag"></span></a></li>
	                                                            <li class="wishlist"><a href="#"
	                                                                    title="Add to Wishlist"><span
	                                                                        class="pe-7s-like"></span></a></li>
	                                                            <li class="quick_button"><a href="#" title="Quick View"
	                                                                    data-bs-toggle="modal" data-bs-target="#modal_box">
	                                                                    <span class="pe-7s-look"></span></a></li>
	                                                        </ul>
	                                                    </div> -->
	                                                </figcaption>
	                                            </figure>
	                                        </article>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!--shop gallery end-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- product page section end -->

	 
	 <c:import url="footer.jsp"></c:import>
	
	<!-- JS
	============================================ -->
	
	    <script src="vue/frontend/assets/js/vendor/jquery-3.6.0.min.js"></script>
	    <script src="vue/frontend/assets/js/vendor/jquery-migrate-3.3.2.min.js"></script>
	    <script src="vue/frontend/assets/js/vendor/bootstrap.bundle.min.js"></script>
	    <script src="vue/frontend/assets/js/slick.min.js"></script>
	    <script src="vue/frontend/assets/js/owl.carousel.min.js"></script>
	    <script src="vue/frontend/assets/js/wow.min.js"></script>
	    <script src="vue/frontend/assets/js/jquery.scrollup.min.js"></script>
	    <script src="vue/frontend/assets/js/jquery.nice-select.js"></script>
	    <script src="vue/frontend/assets/js/jquery.magnific-popup.min.js"></script>
	    <script src="vue/frontend/assets/js/mailchimp-ajax.js"></script>
	    <script src="vue/frontend/assets/js/jquery-ui.min.js"></script>
	    <script src="vue/frontend/assets/js/jquery.zoom.min.js"></script>
	
	    <!-- Main JS -->
	    <script src="vue/frontend/assets/js/main.js"></script>
	
	</body>
</html>