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
                            <li><a href="index.html">Home</a></li>
                            <li> // Mes favoris</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- breadcrumbs area end -->
    <div class="wishlist-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <form action="#">
                        <div class="table-content table-responsive">
                        	<c:choose>
                        		<c:when test="${empty listeFavoris }">
                        			<h2>Votre liste de favoris est vide !</h2>
                        		</c:when>
                        		<c:otherwise>
		                            <table class="table">
		                                <thead>
		                                    <tr>
		                                        <th class="product_remove">Supprimer</th>
		                                        <th class="product-thumbnail">Images</th>
		                                        <th class="cart-product-name">Produit</th>
		                                        <th class="product-price">Prix unitaire</th>
		                                        <th class="product-stock-status">État du Stock</th>
		                                        <th class="cart_btn">Ajouter au panier</th>
		                                    </tr>
		                                </thead>
		                                <tbody>
		                                	<c:forEach items="${listeFavoris }" var="favori">
		                                    <tr>
		                                        <td class="product_remove">
		                                            <a href="listeFavoris?idUtilisateur=${favori.idUtilisateur.id }&action=delete&id=${favori.idProduit.id}">
		                                                <i class="pe-7s-close" title="Supprimer"></i>
		                                            </a>
		                                        </td>
		                                        <td class="product-thumbnail">
		                                            <a href="produit?id=${favori.idProduit.id }"><img src="${favori.idProduit.image }" alt="" width="100"></a>
		                                        </td>
		                                        <td class="product-name"><a href="produit?id=${favori.idProduit.id }">${favori.idProduit.titre }</a></td>
		                                        <td class="product-price"><span class="amount">${favori.idProduit.prix }</span></td>
		                                        	<c:choose>
		                                        		<c:when test="${favori.idProduit.stock > 0 }">
		                                        		<td class="product-stock-status">
		                                        			<span class="in-stock">En stock</span>
		                                        		</td>
		                                        		<td class="cart_btn"><a href="listeFavoris?idUtilisateur=${favori.idUtilisateur.id }&action=addToCart&id=${favori.idProduit.id}">Ajouter au panier</a></td>
		                                        		</c:when>
		                                        		<c:otherwise>
		                                        		<td class="product-stock-status">
		                                        			<span class="in-stock text-danger">en restockage</span>
		                                        		</td>
		                                        		<td class="cart_btn out_of_stock"><a href="#" disabled data-toggle="tooltip" data-placement="top" title="Produit en rupture de stock">Ajouter au panier</a></td>
		                                        		</c:otherwise>
		                                        	</c:choose>
		                                    </tr>
		                                    </c:forEach>
		                                    
		                                </tbody>
		                            </table>
                            	</c:otherwise>
                        	</c:choose>
                        </div>
                    </form>
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
 