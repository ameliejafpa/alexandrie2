<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alexandrie - Panier</title>
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
    <div class="breadcrumbs_aree breadcrumbs_bg mb-110" data-bgimg="assets/img/others/breadcrumbs-bg.png">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumbs_text">
                        <h1>Panier</h1>
                        <ul>
                            <li><a href="index.html">Accueil</a></li>
                            <li> // Panier</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- breadcrumbs area end -->
    <div class="cart-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                	<c:choose>
                		<c:when test="${panier.count() == 0 }">
                			<div class="alert alert-light" role="alert">
							  Votre panier est vide.
							</div>
                		</c:when>
                		<c:otherwise>
                			<form action="#">
		                        <div class="table-content table-responsive">
		                            <table class="table">
		                                <thead>
		                                    <tr>
		                                        <th class="product-thumbnail">images</th>
		                                        <th class="cart-product-name">Produit</th>
		                                        <th class="product-price">Prix unitaire</th>
		                                        <th class="product-quantity">Quantité</th>
		                                        <th class="product-subtotal">Total</th>
		                                        <th class="product_remove">supprimer</th>
		                                    </tr>
		                                </thead>
		                                <tbody>
		                                	<c:forEach items="${panierDetails }" var="article" varStatus="loop">
		                                    <tr>
		                                        <td class="product-thumbnail">
		                                            <a href="produit?id=${article.produit.id }">
		                                                <img src="${article.produit.image }"
		                                                    alt="Cart Thumbnail">
		                                            </a>
		                                        </td>
		                                        <td class="product-name"><a href="produit?id=${article.produit.id }">${article.produit.titre }</a>
		                                        </td>
		                                        <td class="product-price"><span class="amount">${article.produit.prix } &euro;</span></td>
		                                        <td class="product_pro_button quantity">
		                                            <input type="hidden" value="${article.produit.id }" name="idProduit${loop.index }">
		                                            <div class="pro-qty border">
		                                                <input type="text" value="${article.quantite }" name="quantiteProduit${loop.index }">
		                                            </div>
		                                        </td>
		                                        <td class="product-subtotal"><span class="amount">${article.quantite*article.produit.prix } &euro;</span></td>
		                                        <td class="product_remove">
		                                            <a href="monPanier?action=delete&id=${article.produit.id }">
		                                                <i class="pe-7s-close" title="Supprimer"></i>
		                                            </a>
		                                        </td>
		                                     </tr>
		                                     </c:forEach>
		                                </tbody>
		                            </table>
		                        </div>
		                        <div class="row">
		                            <div class="col-12">
		                                <div class="coupon-all">
		                                    <div class="coupon">
		                                        <input class="button" name="btnUpdateCart" value="Mettre à jour le panier" type="submit">
		                                    </div>
		                                    <div class="coupon2">
		                                        <input class="button" name="btnEmptyCart" value="Vider le panier" type="submit">
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        <div class="row">
		                            <div class="col-md-5 ml-auto">
		                                <div class="cart-page-total">
		                                    <h2>Total</h2>
		                                    <ul>
		                                        <li>Total <span>${panier.prixTotal() } &euro;</span></li>
		                                    </ul>
		                                    <a href="paiement">Payer</a>
		                                </div>
		                            </div>
		                        </div>
		                    </form>
                		</c:otherwise>
                	</c:choose>
                </div>
            </div>
        </div>
    </div>

 
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