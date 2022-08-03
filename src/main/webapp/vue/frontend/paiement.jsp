<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alexandrie - Paiement</title>
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
                        <h1>Paiement</h1>
                        <ul>
                            <li><a href="accueil">Accueil</a></li>
                            <li> // Paiement</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- breadcrumbs area end -->
    <div class="checkout-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-12">
		                   <h3>détails de facturation</h3>
		                   <div class="row">
		                       <div class="col-md-12">
		                       	<c:if test="${isConnected }">
		       						<p>${userPrenom } ${userNom }</p>
		       						
		          			<address>
		                      	${adresseLivraison.adresse }<br>${adresseLivraison.codePostal } ${adresseLivraison.ville }<br>${adresseLivraison.pays }
		                      </address>
		          		</c:if>
		          	</div>
		          </div>
		        		<c:if test="${!isConnected }">
		        		<div class="coupon-accordion">
		        		<h3>Déjà client ? <span id="showlogin">Cliquez ici pour vous connecter</span></h3>
                        <div id="checkout-login" class="coupon-content">
                            <div class="coupon-info">
                                <form id="formConnexion" name="formConnexion" method="post">
                                    <p class="form-row-first">
                                        <label class="mb-1">Adresse email <span class="required">*</span></label>
                                        <input type="email" name="connexEmail">
                                    </p>
                                    <p class="form-row-last">
                                        <label>Mot de passe <span class="required">*</span></label>
                                        <input type="password" name="connexPassword">
                                    </p>
                                    <p>
                                    	<button class="btn custom-btn md-size" type="submit" name="btnConnexion">Connexion</button>
                                    </p>
                                    <!-- <p class="form-row">
                                        <input type="checkbox" id="remember_me">
                                        <label for="remember_me">Remember me</label>
                                    </p>
                                    <p class="lost-password"><a href="#">Lost your password?</a></p> -->
                                </form>
                            </div>
                        </div>
		        		<h3>Pas encore client ? <span id="showcoupon">Cliquez ici pour vous inscrire</span></h3>
                        <div id="checkout_coupon" class="coupon-content">
                            <div class="coupon-info">
                                <form id="formInscription" name="formInscription" method="post">
                                    <p class="form-row-first">
                                        <label>Prénom<span class="required">*</span></label>
		                                 <input  name="insNom" type="text">
                                    </p>
                                    <p class="form-row-first">
                                        <label>Nom<span class="required">*</span></label>
		                                 <input name="insPrenom" type="text">
                                    </p>
                                    <p class="form-row-first">
                                        <label>Adresse <span class="required">*</span></label>
		                                 <input  name="adresse" type="text">
                                    </p>
                                    <p class="form-row-first">
                                        <label>Code postal<span class="required">*</span></label>
		                                 <input placeholder="" type="text" name="codePostal">
                                    </p>
                                    <p class="form-row-first">
                                        <label>Ville<span class="required">*</span></label>
		                                 <input type="text" name="ville">
                                    </p>
                                    <p class="form-row-first">
                                        <label>Pays<span class="required">*</span></label>
		                                <input type="text" name="pays" value="France">
                                    </p>
                                    <p class="form-row-first">
		                                 <label>Adresse email<span class="required">*</span></label>
		                                 <input type="email" name="insEmail" >
                                    </p>
                                    <p class="form-row-first">
                                        <label>Téléphone<span class="required">*</span></label>
		                                 <input type="text">
                                    </p>
                                    <p class="form-row-last">
                                        <label>Mot de passe <span class="required">*</span></label>
                                        <input type="password" name="insPassword" >
                                    </p>
                                    <p>
                                    	<button class="btn custom-btn md-size" type="submit" name="btnInscription">Inscription</button>
                                    </p>
                                    <!-- <p class="form-row">
                                        <input type="checkbox" id="remember_me">
                                        <label for="remember_me">Remember me</label>
                                    </p>
                                    <p class="lost-password"><a href="#">Lost your password?</a></p> -->
                                </form>
                            </div>
                        </div>
		            </div>
		            <c:if test="${messageInscriptionOk }">
                         	<div class="alert alert-success" role="alert">Votre inscription a bien été prise en compte, veuillez-vous connecter</div>
                    </c:if>
		           </c:if>
                </div>
                <div class="col-lg-6 col-12">
                    <div class="your-order">
                        <h3>Votre commande</h3>
                        <div class="your-order-table table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class="cart-product-name">Produits</th>
                                        <th class="cart-product-total">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${panierDetails }" var="article" varStatus="loop">
                                    <tr class="cart-item">
                                        <td class="cart-product-name">${article.produit.titre }<strong
                                                class="product-quantity">
                                                × ${article.quantite }</strong></td>
                                        <td class="cart-product-total"><span class="amount">${article.quantite*article.produit.prix } &euro;</span></td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                                <tfoot>
                                    <tr class="order-total">
                                        <th>Total de la commande</th>
                                        <td><strong><span class="amount">${panier.prixTotal() } &euro;</span></strong></td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                        <div class="payment-method">
                            <div class="payment-accordion">
                                <div class="order-button-payment">
                                    <input value="Passer la commande" type="submit" <c:if test="${!isConnected }">disabled</c:if>>
                                </div>
                                <!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#order" <c:if test="${!isConnected }">disabled</c:if>>
  Passer la commande
</button>

<!-- Modal -->
<div class="modal fade" id="order" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
                                
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