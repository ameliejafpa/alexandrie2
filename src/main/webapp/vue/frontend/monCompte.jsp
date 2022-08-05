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
                        <h1>Mon compte</h1>
                        <ul>
                            <li><a href="accueil">Accueil </a></li>
                            <li> // Mon compte</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- breadcrumbs area end -->
    <div class="account-page-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <ul class="nav myaccount-tab-trigger" id="account-page-tab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="account-dashboard-tab" data-bs-toggle="tab"
                                href="#account-dashboard" role="tab" aria-controls="account-dashboard"
                                aria-selected="true">Tableau de bord</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="account-orders-tab" data-bs-toggle="tab" href="#account-orders"
                                role="tab" aria-controls="account-orders" aria-selected="false">Commandes</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="account-address-tab" data-bs-toggle="tab" href="#account-address"
                                role="tab" aria-controls="account-address" aria-selected="false">Adresse</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="account-details-tab" data-bs-toggle="tab" href="#account-details"
                                role="tab" aria-controls="account-details" aria-selected="false">Détails du compte</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="account-logout-tab" href="deconnexion" role="tab"
                                aria-selected="false">Déconnexion</a>
                        </li>
                    </ul>
                </div>
                <div class="col-lg-9">
                    <div class="tab-content myaccount-tab-content" id="account-page-tab-content">
                        <div class="tab-pane fade show active" id="account-dashboard" role="tabpanel"
                            aria-labelledby="account-dashboard-tab">
                            <div class="myaccount-dashboard">
                                <p>Bonjour <b>${userPrenom} ${userNom}</b> (vous n'êtes pas ${userPrenom} ${userNom} ? <a href="deconnexion">Déconnexion</a>)</p>
                                <p>À partir du tableau de bord de votre compte, vous pouvez consulter vos commandes récentes, gérer voter adresse d’expédition et modifier votre mot de passe et les détails de votre compte.</p>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="account-orders" role="tabpanel"
                            aria-labelledby="account-orders-tab">
                            <div class="myaccount-orders">
                                <h4 class="small-title">Mes commandes</h4>
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover">
                                        <tbody>
                                            <tr>
                                                <th>Commande</th>
                                                <th>Date</th>
                                                <th>Statut</th>
                                                <th>Total</th>
                                                <th></th>
                                            </tr>
                                            <c:forEach items="${commandes }" var="commande">
                                            <tr>
                                                <td><a class="account-order-id" href="javascript:void(0)">#${commande.id }</a></td>
                                                <td>${commande.dateC }</td>
                                                <td>
	                                                <c:choose>
	                                                	<c:when test="${commande.etat == 0}">En traitement</c:when>
	                                                	<c:when test="${commande.etat == 1}">En cours de livraison</c:when>
	                                                	<c:when test="${commande.etat == 2}">Livrée</c:when>
	                                                	<c:otherwise>Erreur</c:otherwise>
	                                                </c:choose>
                                                </td>
                                                <td>${commande.total }&nbsp;&euro;</td>
                                                <td>
                                                	<!-- Button trigger modal -->
													<button type="button" class="btn btn-secondary btn-primary-hover" data-bs-toggle="modal" data-bs-target="#voirCommande${commande.id }">Voir</button>
													
													<!-- Modal -->
													<div class="modal fade" id="voirCommande${commande.id }" tabindex="-1" aria-labelledby="voirCommande${commande.id }" aria-hidden="true">
													  <div class="modal-dialog modal-lg modal-fullscreen-sm-down">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h5 class="modal-title" id="exampleModalLabel">Commande #${commande.id }</h5>
													        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
													      </div>
													      <div class="modal-body">
													        <div class="table-content table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class="product-thumbnail">images</th>
                                        <th class="cart-product-name">Produit</th>
                                        <th class="product-price">Prix unitaire</th>
                                        <th class="product-quantity">Quantité</th>
                                        <th class="product-subtotal">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${listeDetailsCommandes }" var="detailsCommande">
                                		
                                			<c:if test="${commande.id == detailsCommande.idCommande.id}">
		                                    <tr>
		                                        <td class="product-thumbnail">
		                                            <a href="produit?id=${detailsCommande.idProduit.id }">
		                                                <img src="${detailsCommande.idProduit.image }" alt="Cart Thumbnail">
		                                            </a>
		                                        </td>
		                                        <td class="product-name">
		                                        	<a href="produit?id=${detailsCommande.idProduit.id }">${detailsCommande.idProduit.titre }</a> 
		                                        </td>
		                                        <td class="product-price">
		                                        	<span class="amount">${detailsCommande.idProduit.prix }&nbsp;&euro;</span>
		                                        </td>
		                                        <td class="product_pro_button quantity">
		                                            ${detailsCommande.quantite }
		                                        </td>
		                                        <td class="product-subtotal">
		                                        	<span class="amount">${detailsCommande.quantite*detailsCommande.idProduit.prix }&nbsp;&euro;</span>
		                                        </td>
		                                        
		                                     </tr>
		                                     </c:if>
	                                     
                                     </c:forEach>
                                </tbody>
                            </table>
                        </div>
													      </div>
													      <div class="modal-footer">
													        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
													      </div>
													    </div>
													  </div>
													</div>
                                                </td>
                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="account-address" role="tabpanel"
                            aria-labelledby="account-address-tab">
                            <div class="myaccount-address">
                                <p>L'adresse suivante sera utilisée par défaut sur la page de paiement.</p>
                                <div class="row">
                                    <div class="col=12">
                                        <h4 class="small-title">Votre adresse de livraison</h4>
                                        <address>
                                            ${adresseLivraison.adresse }<br>${adresseLivraison.codePostal } ${adresseLivraison.ville }<br>${adresseLivraison.pays }
                                        </address>
                                    </div>
                                    <div class="col-12">
                                    	<h4 class="small-title">Modifier votre adresse de livraison</h4>
                                    	<form method="post" class="myaccount-form">
                                    <div class="myaccount-form-inner">
                                        <div class="single-input">
                                            <label>Adresse</label>
                                            <input type="text" name="adresse">
                                        </div>
                                        <div class="single-input single-input-half">
                                            <label>Code postal</label>
                                            <input type="text" name="codePostal">
                                        </div>
                                        <div class="single-input single-input-half">
                                            <label>Ville</label>
                                            <input type="text" name="ville">
                                        </div>
                                        <div class="single-input single-input-half">
                                            <label>Pays</label>
                                            <input type="text" name="pays" value="France">
                                        </div>
                                        <div class="single-input">
                                            <button class="btn custom-btn" type="submit" name="btnAdresse">
                                                <span>Enregistrer</span>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="account-details" role="tabpanel"
                            aria-labelledby="account-details-tab">
                            <div class="myaccount-details">
                            	<h4 class="small-title">Modifier vos informations</h4>
                                <form method="post" class="myaccount-form">
                                    <div class="myaccount-form-inner">
                                        <div class="single-input single-input-half">
                                            <label>Prénom*</label>
                                            <input type="text" name="upPrenom">
                                        </div>
                                        <div class="single-input single-input-half">
                                            <label>Nom*</label>
                                            <input type="text" name="upNom">
                                        </div>
                                        <div class="single-input">
                                            <label>Email*</label>
                                            <input type="email" name="upEmail">
                                        </div>
                                        <div class="single-input">
                                            <label>Mot de passe actuel(laisser vide pour ne pas le modifier)</label>
                                            <input type="password" name="password">
                                        </div>
                                        <div class="single-input">
                                            <label>Nouveau mot de passe (laisser vide pour ne pas le modifier)</label>
                                            <input type="password" name="upPassword">
                                        </div>
                                        <div class="single-input">
                                            <button class="btn custom-btn" type="submit" name="btnUpdate">
                                                <span>Enregistrer</span>
                                            </button>
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
 