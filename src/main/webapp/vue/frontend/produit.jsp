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
    <div class="breadcrumbs_aree breadcrumbs_bg mb-50">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumbs_text">
                        <ul>
                            <li><a href="accueil">Accueil </a></li>
                            <li> // Produit</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- breadcrumbs area end -->

    <!-- single product section start-->
    <div class="single_product_section mb-100">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="single_product_gallery">
                        <div class="product_gallery_inner d-flex">
                            <div class="product_gallery_main_img">
                                <div class="gallery_img_list">
                                    <img data-image="${produit.image }"
                                        src="${produit.image }" alt="">
                                </div>
                                <c:forEach items="${listeImages }" var="image">
	                                <div class="gallery_img_list">
	                                    <img src="${image.url }" alt="">
	                                </div>
                                </c:forEach>
                            </div>
                            <div class="product_gallery_btn_img">
                                <a class="gallery_btn_img_list" href="javascript:void(0)"><img
                                        src="${produit.image }" alt="tab-thumb" width="100" height="100"></a>
                                <c:forEach items="${listeImages }" var="image">
                                <a class="gallery_btn_img_list" href="javascript:void(0)"><img
                                        src="${image.url }" alt="tab-thumb" width="100" height="100"></a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product_details_sidebar">
                        <h2 class="product__title">${produit.titre }</h2>
                        <div class="price_box">
                            <span class="current_price">${produit.prix } €</span>
                        </div>
                        <c:if test="${hasNoteMoyenne}">
	                        <div class="quickview__info mb-0">
	                            <p class="product_review d-flex align-items-center">
	                                <span class="review_icon d-flex">
	                                <c:forEach var="i" begin="1" end="${noteMoyenne }" step="1" varStatus ="status">
    									<i class="ion-ios-star"></i>
	                                </c:forEach>
	                                <c:forEach var="i" begin="${noteMoyenne +1}" end="5" step="1" varStatus ="status">
    									<i class="ion-android-star-outline"></i>
	                                </c:forEach>
	                                </span>
	                                <!-- <span class="review__text"> (5 reviews)</span> -->
	                            </p>
	                        </div>
                        </c:if>
                        <p class="product_details_desc">${produit.description }</p>
                        <form method="post" class="product_pro_button quantity d-flex align-items-center">
                        	
	                            <div class="pro-qty border">
	                                <input type="text" value="1" name="panierQuantite">
	                            </div>
	                            <button class="add_to_cart" type="submit" name="btnPanierAdd" >Ajouter au panier</button>
<!-- 	                        <a class="add_to_cart " href="#">add to cart</a>-->
								<c:if test="${isConnected }">
									<button class="wishlist__btn" type="submit" name="btnFavori" ><i class="pe-7s-like"></i></button>
								</c:if>
<!-- 							<a class="wishlist__btn" href="#"><i class="pe-7s-like"></i></a>
	                            <a class="serch_btn" href="#"><i class="pe-7s-search"></i></a>
 -->                            
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- product details section end-->

    <!-- product tab section start -->
    <div class="product_tab_section mb-80">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="reviews__wrapper">
	                    <h2>Commentaires</h2>
	                    <c:forEach items="${listeCommentaires }" var="commentaire">
		                    <div class="customer__reviews d-flex justify-content-between mb-20">
		                            <div class="reviews__ratting">
		                            	<p>${commentaire.note }/5 <i class="ion-ios-star"></li></i></p>
		                                <ul class="d-flex">
		                                    <li><a href="#"><i class="ion-ios-star"></i></a></li>
		                                    <li><a href="#"><i class="ion-ios-star"></i></a></li>
		                                    <li><a href="#"><i class="ion-ios-star"></i></a></li>
		                                    <li><a href="#"><i class="ion-ios-star"></i></a></li>
		                                    <li><a href="#"><i class="ion-ios-star"></i></a></li>
		                                </ul>
		                            </div>
		                            <div class="reviews__desc">
		                                <h3>${commentaire.idUtilisateur.prenom } ${commentaire.idUtilisateur.nom }</h3>
		                                <p>${commentaire.commentaire }</p>
		                            </div>
		                        
		                    </div>
	                    </c:forEach>
	                    <c:if test="${!isConnected }">
							<div class="comment__title">
                                <h2>Connexion/inscription</h2>
                                <p>Vous devez vous connecter ou vous inscrire pour laisse un commentaire
                                </p>
                                <a class="login" href="login">Connexion/Inscription</a>
                            </div>
								</c:if>
						<c:if test="${isConnected }">
							<div class="comment__title">
                                <h2>Ajouter un commentaire </h2>
                            </div>
		                    <div class="product_review_form">
		                        <form method="post">
		                            <div class="row">
		                                <div class="col-12">
		                                    <label for="review_comment">Votre commentaire</label>
		                                    <textarea class="border" name="commentaire" id="review_comment"></textarea>
		                                    <label for="reviews__ratting">Votre notation</label>
		                                	<input type="number" id=reviews__ratting" name="note" min="1" max="5"/>
		                                </div>
		                            </div>
		                            <button class="btn custom-btn text-white" data-hover="Submit"
		                                type="submit" name="btnCommentaire">Envoyer</button>
		                        </form>
		                    </div>
	                    </c:if>
	                </div>
	             </div>
            </div>
        </div>
    </div>
    <!-- product tab section end -->

    <!-- product section start -->
    <div class="product_section mb-80">
        <div class="container">
            <div class="section_title text-center mb-55">
                <h2>Produits qui pourraient vous intéresser</h2>
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
                <c:forEach items="${listeProduits }" var="produit">
	                <div class="col-lg-3">
	                    <article class="single_product">
	                        <figure>
	                            <div class="product_thumb">
	                                <a href="produit?id=${produit.id }"><img src="${produit.image }" alt=""></a>
	                                <!-- <div class="action_links">
	                                    <ul class="d-flex justify-content-center">
	                                    	<li><button class="add_to_cart" type="submit" name="padd" ><span class="pe-7s-shopbag"></span></button></li>
	                                        <li class="add_to_cart"><a href="cart.html" title="Add to cart"> <span class="pe-7s-shopbag"></span></a></li>
	                                        <li><button class="wishlist__btn" type="submit" name="pwhish" ><span class="pe-7s-like"></span></button></li>
	                                        <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><span class="pe-7s-like"></span></a></li>
	                                    </ul>
	                                </div> -->
	                            </div>
	                            <figcaption class="product_content text-center">
	                                <h4><a href="sproduit?id=${produit.id }">${produit.titre }</a></h4>
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
    <!-- product section end -->
 
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

 