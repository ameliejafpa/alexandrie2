<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="fr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Liste des produits</title>
    <meta name="description"
        content="Magasin d'instruments de musique" />
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Add site Favicon -->
    <link rel="icon" href="https://hasthemes.com/wp-content/uploads/2019/04/cropped-favicon-32x32.png" sizes="32x32" />
    <link rel="icon" href="https://hasthemes.com/wp-content/uploads/2019/04/cropped-favicon-192x192.png"
        sizes="192x192" />
    <link rel="apple-touch-icon" href="https://hasthemes.com/wp-content/uploads/2019/04/cropped-favicon-180x180.png" />
    <meta name="msapplication-TileImage"
        content="https://hasthemes.com/wp-content/uploads/2019/04/cropped-favicon-270x270.png" />

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
                    <c:if test="${idCategorie != null}">
                    	<h1>${categorie.titre }</h1>
                    </c:if>
                    <c:if test="${idSousCategorie != null}">
                    	<h1>${sousCategorie.titre }</h1>
                    </c:if>
                    <c:if test="${idCategorie == null && idSousCategorie == null}">
                    	<h1>Tous les instruments</h1>
                    </c:if>
                        <ul>
                            <li><a href="/accueil">Accueil </a></li>
                            <li> // Liste des instruments</li>
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
                <div class="col-lg-3 order-2 order-lg-1">
                    <div class="product_sidebar product_widget">
                        <!-- <div class="widget__list widget_filter wow fadeInUp" data-wow-delay="0.1s"
                            data-wow-duration="1.1s">
                            <h3>Filtres</h3>
                            
                            <div class="widget_filter_list">
                                <h4>Filtrer par prix</h4>

                                <div id="slider-range"></div>
                                <div class="filter_price d-flex align-items-center">
                                    <span>Prix: </span>
                                    <input type="text" id="amount">
                                </div>

                            </div>
                        </div> -->
                        <div class="widget__list category wow fadeInUp" data-wow-delay="0.2s" data-wow-duration="1.2s">
                            <h3>Catégories</h3>
                            <div class="widget_category">
                                <ul>
                                	
                                    <li><a href="listeProduits">Tous <%-- <span>(${total })</span> --%></a></li>
                                    <c:forEach items="${listeCategories}" var="categorie">
                                    <li class="menu-item-has-children">
                                    	<a href="listeProduits?idCategorie=${categorie.id }">${categorie.titre } <%-- <span>(${total })</span> --%></a>
                                    	<%-- <ul class="sub-menu">
                                			<c:forEach items="${listeSousCategories}" var="sousCategorie">
                                				<c:if test="${sousCategorie.idCategorie.id == categorie.id }">
													<li><a href="listeProduits?idSousCategorie=${sousCategorie.id }">${sousCategorie.titre }</a></li>
	                                				</c:if>
                                			</c:forEach>
                                		</ul> --%>
                                    </li>
                                    </c:forEach>
                                    
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 order-1 order-lg-2">
                    <div class="product_page_wrapper">
                        <!--shop toolbar area start-->
                        <div class="product_sidebar_header mb-60 d-flex justify-content-between align-items-center">
                            
                            <div class="product_header_right d-flex align-items-center">
                                <!-- <div class="sorting__by d-flex align-items-center">
                                    <span>Trier par : </span>
                                    <form class="select_option" method="post">
                                        <select name="orderby" id="short">
                                            <option selected value="1">Par défault</option>
                                            <option value="2">Tri par popularité</option>
                                            <option value="3">Tri par nouveauté</option>
                                            <option value="4">Du moins cher au plus cher</option>
                                            <option value="5">Du plus cher au moins cher</option>
                                        </select>
                                    </form>
                                </div> -->
                                <div class="product__toolbar__btn">
                                    <ul class="nav" role="tablist">
                                        <li class="nav-item">
                                            <a data-bs-toggle="tab" href="#grid" role="tab" aria-controls="grid"
                                                aria-selected="true"><i class="ion-grid"></i></a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="active" data-bs-toggle="tab" href="#list" aria-controls="list"
                                                role="tab" aria-selected="false"><i class="ion-ios-list"></i></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!--shop toolbar area end-->


                        <!--shop gallery start-->
                        <div class="product_page_gallery">
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade" id="grid">
                                    <div class="row grid__product">
                                    	<c:forEach items="${listeProduits }" var="produit">
	                                        <div class="col-lg-4 col-md-4 col-sm-6">
	                                            <article class="single_product wow fadeInUp" data-wow-delay="0.1s"
	                                                data-wow-duration="1.1s">
	                                                <figure>
	                                                    <div class="product_thumb">
	                                                        <a href="produit?id=${produit.id }"><img
	                                                                src="${produit.image }" alt=""></a>
	                                                        <c:if test="${isConnected }">
	                                                        <div class="action_links">
	                                                            <ul class="d-flex justify-content-center">
	                                                                <li class="add_to_cart"><a href="listeProduits?action=addToCart&idProduit=${produit.id }"
	                                                                        title="Ajouter au panier">
	                                                                        <span class="pe-7s-shopbag"></span></a></li>
	                                                                <li class="wishlist"><a href="listeProduits?action=addWhishlist&idProduit=${produit.id }"
	                                                                        title="Ajouter aux favoris"><span
	                                                                            class="pe-7s-like"></span></a></li>
	                                                            </ul>
	                                                        </div>
	                                                        </c:if>
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
                                <div class="tab-pane fade show active" id="list">
                                    <div class="list__product">
                                        <c:forEach items="${listeProduits }" var="produit">
	                                        <article class="product_list_items border-bottom">
	                                            <figure class="product_list_flex d-flex align-items-center">
	                                                <div class="product_thumb">
	                                                    <a href="produit?id=${produit.id }"><img
	                                                            src="${produit.image }" alt=""></a>
	                                                </div>
	                                                <figcaption class="product_list_content">
	                                                    <h4><a href="produit?id=${produit.id }">${produit.titre }</a></h4>
	                                                    <!-- <div class="product__ratting">
	                                                        <ul class="d-flex">
	                                                            <li><a href="#"><i class="ion-ios-star"></i></a></li>
	                                                            <li><a href="#"><i class="ion-ios-star"></i></a></li>
	                                                            <li><a href="#"><i class="ion-ios-star"></i></a></li>
	                                                            <li><a href="#"><i class="ion-ios-star"></i></a></li>
	                                                            <li><a href="#"><i class="ion-android-star-outline"></i></a>
	                                                            </li>
	                                                        </ul>
	                                                    </div> -->
	                                                    <div class="price_box">
	                                                        <span class="current_price">${produit.prix } €</span>
	                                                    </div>
	                                                    <div class="product__desc">
	                                                        <p>${produit.description }</p>
	                                                    </div>
	                                                    <c:if test="${isConnected }">
	                                                    <div class="action_links product_list_action">
	                                                        <ul class="d-flex">
	                                                            <li class="add_to_cart"><a href="listeProduits?action=addToCart&idProduit=${produit.id }"
	                                                                    title="Ajouter au panier">
	                                                                    <span class="pe-7s-shopbag"></span></a></li>
	                                                            <li class="wishlist"><a href="listeProduits?action=addWhishlist&idProduit=${produit.id }"
	                                                                    title="Ajouter aux favoris"><span
	                                                                        class="pe-7s-like"></span></a></li>
	                                                        </ul>
	                                                    </div>
	                                                    </c:if>
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

