<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alexandrie - Accueil</title>
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

    <!--modernizr min js here-->
    <script src="vue/frontend/assets/js/vendor/modernizr-3.11.2.min.js"></script>
</head>
<body>
 <jsp:include page="/headerC" />
 
 

    <!-- product section start -->
    <div class="product_section mb-80 wow fadeInUp" data-wow-delay="0.1s" data-wow-duration="1.1s">
        <div class="container">
            <div class="section_title text-center mb-55">
                <h2>Best Seller</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod <br> tempor
                    incididunt ut
                    labore et dolore magna</p>
            </div>
            <div class="row product_slick slick_navigation slick__activation" data-slick='{
                "slidesToShow": 4,
                "slidesToScroll": 1,
                "arrows": true,
                "dots": false,
                "autoplay": false,
                "speed": 300,
                "infinite": true ,  
                "responsive":[ 
                  {"breakpoint":992, "settings": { "slidesToShow": 3 } }, 
                  {"breakpoint":768, "settings": { "slidesToShow": 2 } }, 
                  {"breakpoint":500, "settings": { "slidesToShow": 1 } }  
                 ]                                                     
            }'>
                <div class="col-lg-3">
                    <article class="single_product">
                        <figure>
                            <div class="product_thumb">
                                <a href="single-product.html"><img src="assets/img/product/product1.png" alt=""></a>
                                <div class="action_links">
                                    <ul class="d-flex justify-content-center">
                                        <li class="add_to_cart"><a href="cart.html" title="Add to cart"> <span
                                                    class="pe-7s-shopbag"></span></a></li>
                                        <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><span
                                                    class="pe-7s-like"></span></a></li>
                                        <li class="quick_button"><a href="#" title="Quick View" data-bs-toggle="modal"
                                                data-bs-target="#modal_box">
                                                <span class="pe-7s-look"></span></a></li>
                                    </ul>
                                </div>
                            </div>
                            <figcaption class="product_content text-center">
                                <h4><a href="single-product.html">Products Name Here</a></h4>
                                <div class="price_box">
                                    <span class="current_price">$22.00</span>
                                </div>
                            </figcaption>
                        </figure>
                    </article>
                </div>
                <div class="col-lg-3">
                    <article class="single_product">
                        <figure>
                            <div class="product_thumb">
                                <a href="single-product.html"><img src="assets/img/product/product2.png" alt=""></a>
                                <div class="action_links">
                                    <ul class="d-flex justify-content-center">
                                        <li class="add_to_cart"><a href="cart.html" title="Add to cart"> <span
                                                    class="pe-7s-shopbag"></span></a></li>
                                        <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><span
                                                    class="pe-7s-like"></span></a></li>
                                        <li class="quick_button"><a href="#" title="Quick View" data-bs-toggle="modal"
                                                data-bs-target="#modal_box">
                                                <span class="pe-7s-look"></span></a></li>
                                    </ul>
                                </div>
                            </div>
                            <figcaption class="product_content text-center">
                                <h4><a href="single-product.html">Lorem, ipsum dolor.</a></h4>
                                <div class="price_box">
                                    <span class="current_price">$24.00</span>
                                </div>
                            </figcaption>
                        </figure>
                    </article>
                </div>
                <div class="col-lg-3">
                    <article class="single_product">
                        <figure>
                            <div class="product_thumb">
                                <a href="single-product.html"><img src="assets/img/product/product3.png" alt=""></a>
                                <div class="action_links">
                                    <ul class="d-flex justify-content-center">
                                        <li class="add_to_cart"><a href="cart.html" title="Add to cart"> <span
                                                    class="pe-7s-shopbag"></span></a></li>
                                        <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><span
                                                    class="pe-7s-like"></span></a></li>
                                        <li class="quick_button"><a href="#" title="Quick View" data-bs-toggle="modal"
                                                data-bs-target="#modal_box">
                                                <span class="pe-7s-look"></span></a></li>
                                    </ul>
                                </div>
                            </div>
                            <figcaption class="product_content text-center">
                                <h4><a href="single-product.html">Praesentium vero nesciu.</a></h4>
                                <div class="price_box">
                                    <span class="current_price">$28.00</span>
                                </div>
                            </figcaption>
                        </figure>
                    </article>
                </div>
                <div class="col-lg-3">
                    <article class="single_product">
                        <figure>
                            <div class="product_thumb">
                                <a href="single-product.html"><img src="assets/img/product/product4.png" alt=""></a>
                                <div class="action_links">
                                    <ul class="d-flex justify-content-center">
                                        <li class="add_to_cart"><a href="cart.html" title="Add to cart"> <span
                                                    class="pe-7s-shopbag"></span></a></li>
                                        <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><span
                                                    class="pe-7s-like"></span></a></li>
                                        <li class="quick_button"><a href="#" title="Quick View" data-bs-toggle="modal"
                                                data-bs-target="#modal_box">
                                                <span class="pe-7s-look"></span></a></li>
                                    </ul>
                                </div>
                            </div>
                            <figcaption class="product_content text-center">
                                <h4><a href="single-product.html">Sit amet consectetur elit.</a></h4>
                                <div class="price_box">
                                    <span class="current_price">$32.00</span>
                                </div>
                            </figcaption>
                        </figure>
                    </article>
                </div>
                <div class="col-lg-3">
                    <article class="single_product">
                        <figure>
                            <div class="product_thumb">
                                <a href="single-product.html"><img src="assets/img/product/product5.png" alt=""></a>
                                <div class="action_links">
                                    <ul class="d-flex justify-content-center">
                                        <li class="add_to_cart"><a href="cart.html" title="Add to cart"> <span
                                                    class="pe-7s-shopbag"></span></a></li>
                                        <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><span
                                                    class="pe-7s-like"></span></a></li>
                                        <li class="quick_button"><a href="#" title="Quick View" data-bs-toggle="modal"
                                                data-bs-target="#modal_box">
                                                <span class="pe-7s-look"></span></a></li>
                                    </ul>
                                </div>
                            </div>
                            <figcaption class="product_content text-center">
                                <h4><a href="single-product.html">Atque earum ullam non.</a></h4>
                                <div class="price_box">
                                    <span class="current_price">$35.00</span>
                                </div>
                            </figcaption>
                        </figure>
                    </article>
                </div>
                <div class="col-lg-3">
                    <article class="single_product">
                        <figure>
                            <div class="product_thumb">
                                <a href="single-product.html"><img src="assets/img/product/product6.png" alt=""></a>
                                <div class="action_links">
                                    <ul class="d-flex justify-content-center">
                                        <li class="add_to_cart"><a href="cart.html" title="Add to cart"> <span
                                                    class="pe-7s-shopbag"></span></a></li>
                                        <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><span
                                                    class="pe-7s-like"></span></a></li>
                                        <li class="quick_button"><a href="#" title="Quick View" data-bs-toggle="modal"
                                                data-bs-target="#modal_box">
                                                <span class="pe-7s-look"></span></a></li>
                                    </ul>
                                </div>
                            </div>
                            <figcaption class="product_content text-center">
                                <h4><a href="single-product.html">Modi excepturi ut ipsam.</a></h4>
                                <div class="price_box">
                                    <span class="current_price">$38.00</span>
                                </div>
                            </figcaption>
                        </figure>
                    </article>
                </div>
                <div class="col-lg-3">
                    <article class="single_product">
                        <figure>
                            <div class="product_thumb">
                                <a href="single-product.html"><img src="assets/img/product/product7.png" alt=""></a>
                                <div class="action_links">
                                    <ul class="d-flex justify-content-center">
                                        <li class="add_to_cart"><a href="cart.html" title="Add to cart"> <span
                                                    class="pe-7s-shopbag"></span></a></li>
                                        <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><span
                                                    class="pe-7s-like"></span></a></li>
                                        <li class="quick_button"><a href="#" title="Quick View" data-bs-toggle="modal"
                                                data-bs-target="#modal_box">
                                                <span class="pe-7s-look"></span></a></li>
                                    </ul>
                                </div>
                            </div>
                            <figcaption class="product_content text-center">
                                <h4><a href="single-product.html">Provident odio, are Unde.</a></h4>
                                <div class="price_box">
                                    <span class="current_price">$28.00</span>
                                </div>
                            </figcaption>
                        </figure>
                    </article>
                </div>
                <div class="col-lg-3">
                    <article class="single_product">
                        <figure>
                            <div class="product_thumb">
                                <a href="single-product.html"><img src="assets/img/product/product1.png" alt=""></a>
                                <div class="action_links">
                                    <ul class="d-flex justify-content-center">
                                        <li class="add_to_cart"><a href="cart.html" title="Add to cart"> <span
                                                    class="pe-7s-shopbag"></span></a></li>
                                        <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><span
                                                    class="pe-7s-like"></span></a></li>
                                        <li class="quick_button"><a href="#" title="Quick View" data-bs-toggle="modal"
                                                data-bs-target="#modal_box">
                                                <span class="pe-7s-look"></span></a></li>
                                    </ul>
                                </div>
                            </div>
                            <figcaption class="product_content text-center">
                                <h4><a href="single-product.html">Products Name Here</a></h4>
                                <div class="price_box">
                                    <span class="current_price">$22.00</span>
                                </div>
                            </figcaption>
                        </figure>
                    </article>
                </div>
            </div>
        </div>
    </div>
    <!-- product section end -->
    
    <!-- product section start -->
    <div class="product_section mb-80 wow fadeInUp" data-wow-delay="0.1s" data-wow-duration="1.1s">
        <div class="container">
            <div class="product_header">
                <div class="section_title text-center">
                    <h2>Tous nos instruments</h2>
                </div>
                <div class="product_tab_button">
                    <ul class="nav justify-content-center" role="tablist" id="nav-tab">
                    	<li>
                            <a data-toggle="tab" href="#tous" role="tab" aria-controls="tous" aria-selected="false">Tous</a>
                        </li>
                    	<c:forEach items="${listeCategories}" var="categorie">
	                        <li>
	                            <a data-toggle="tab" href="#${categorie.titre }" role="tab" aria-controls="cordes" aria-selected="false">${categorie.titre }</a>
	                        </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="tab-content product_container">
            	<div class="tab-pane fade show active" id="tous" role="tabpanel">
	                    <div class="product_gallery">
	         	               <div class="row">
	                        	<c:forEach items="${listeProduits }" var="produit">
			                            <div class="col-lg-3 col-md-4 col-sm-6">
			                                <article class="single_product">
			                                    <figure>
			                                        <div class="product_thumb">
			                                            <a href="produit?id=${produit.id }"><img src="${produit.image }" alt=""></a>
			                                            <div class="action_links">
			                                                <ul class="d-flex justify-content-center">
			                                                    <li class="add_to_cart"><a href="cart.html" title="Add to cart">
			                                                            <span class="pe-7s-shopbag"></span></a></li>
			                                                    <li class="wishlist"><a href="wishlist.html"
			                                                            title="Add to Wishlist"><span class="pe-7s-like"></span></a>
			                                                    </li>
			                                                    
			                                                </ul>
			                                            </div>
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
	                </div>
            	<c:forEach items="${listeCategories}" var="categorie">
	                <div class="tab-pane fade" id="${categorie.titre }" role="tabpanel">
	                    <div class="product_gallery">
	         	               <div class="row">
	                        	<c:forEach items="${listeProduits }" var="produit">
	                        		<c:if test="${produit.idSousCategorie.idCategorie.id == categorie.id }">
			                            <div class="col-lg-3 col-md-4 col-sm-6">
			                                <article class="single_product">
			                                    <figure>
			                                        <div class="product_thumb">
			                                            <a href="produit?id=${produit.id }"><img src="${produit.image }" alt=""></a>
			                                            <div class="action_links">
			                                                <ul class="d-flex justify-content-center">
			                                                    <li class="add_to_cart"><a href="cart.html" title="Add to cart">
			                                                            <span class="pe-7s-shopbag"></span></a></li>
			                                                    <li class="wishlist"><a href="wishlist.html"
			                                                            title="Add to Wishlist"><span class="pe-7s-like"></span></a>
			                                                    </li>
			                                                    
			                                                </ul>
			                                            </div>
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
		                            </c:if>
	                            </c:forEach>
	                        </div>
	                    </div>
	                </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <!-- product section end -->
    
    <!-- service section start-->
    <div class="service_section services_style2 service_container mb-86">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="services_section_inner d-flex justify-content-between">
                        <div class="single_services one text-center wow fadeInUp" data-wow-delay="0.1s"
                            data-wow-duration="1.1s">
                            <div class="services_thumb">
                                <img src="assets/img/others/services5.png" alt="">
                            </div>
                            <div class="services_content">
                                <h3><a href="shop-left-sidebar.html">Pastry</a></h3>
                                <p>Lorem ipsum dolor sit ametgtol consecr adipiscing elit.</p>
                            </div>
                        </div>
                        <div class="single_services two text-center wow fadeInUp" data-wow-delay="0.2s"
                            data-wow-duration="1.2s">
                            <div class="services_thumb">
                                <img src="assets/img/others/services6.png" alt="">
                            </div>
                            <div class="services_content">
                                <h3><a href="shop-left-sidebar.html">Breakfast</a></h3>
                                <p>Lorem ipsum dolor sit ametgtol consecr adipiscing elit.</p>
                            </div>
                        </div>
                        <div class="single_services three text-center wow fadeInUp" data-wow-delay="0.3s"
                            data-wow-duration="1.3s">
                            <div class="services_thumb">
                                <img src="assets/img/others/services7.png" alt="">
                            </div>
                            <div class="services_content">
                                <h3><a href="shop-left-sidebar.html">Cofee Cake</a></h3>
                                <p>Lorem ipsum dolor sit ametgtol consecr adipiscing elit.</p>
                            </div>
                        </div>
                        <div class="single_services four text-center wow fadeInUp" data-wow-delay="0.4s"
                            data-wow-duration="1.4s">
                            <div class="services_thumb">
                                <img src="assets/img/others/services8.png" alt="">
                            </div>
                            <div class="services_content">
                                <h3><a href="shop-left-sidebar.html">Bake Tost</a></h3>
                                <p>Lorem ipsum dolor sit ametgtol consecr adipiscing elit.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- service section end-->

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