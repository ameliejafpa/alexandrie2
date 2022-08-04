<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inscription / Connexion</title>
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
                        <h1>Connexion | Inscription</h1>
                        <ul>
                            <li><a href="${accueil }">Accueil </a></li>
                            <li> // Connexion | Inscription</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- breadcrumbs area end -->
    <div class="login-register-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                	<form id="formConnexion" name="formConnexion" method="post">
                        <div class="login-form">
                            <h4 class="login-title">Connexion</h4>
                            <div class="row">
                                <div class="col-lg-12">
                                    <label>Adresse email*</label>
                                    <input type="email" name="connexEmail" placeholder="Adresse email">
                                </div>
                                <div class="col-lg-12">
                                    <label>Mot de passe</label>
                                    <input type="password" name="connexPassword" placeholder="Mot de passe">
                                </div>
                                <!-- <div class="col-sm-8 align-self-center">
                                    <div class="check-box">
                                        <input type="checkbox" id="remember_me">
                                        <label for="remember_me">Remember me</label>
                                    </div>
                                </div>
                                <div class="col-sm-4 pt-1 mt-md-0">
                                    <div class="forgotton-password_info">
                                        <a href="#"> Forgotten pasward?</a>
                                    </div>
                                </div> -->
                                <c:if test="${messageConnexionNo }">
			                		<div class="col-lg-12 alert alert-danger" role="alert">Adresse e-mail ou mot de passe invalide</div>
								</c:if>
                                <div class="col-lg-12">
                                    <button class="btn custom-btn md-size" type="submit" name="btnConnexion">Connexion</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-lg-6 pt-5 pt-lg-0">
                    <form id="formInscription" name="formInscription" method="post">
                        <div class="login-form">
                            <h4 class="login-title">Inscription</h4>
                            <c:if test="${messageInscriptionOk }">
                            	<div class="alert alert-success" role="alert">				  
									Votre inscription a bien été prise en compte, veuillez-vous connecter
								</div>
                            </c:if>
                            <div class="row">
                                <div class="col-md-6 col-12">
                                    <label>Nom</label>
                                    <input type="text" name="insNom" placeholder="Nom">
                                </div>
                                <div class="col-md-6 col-12">
                                    <label>Prénom</label>
                                    <input type="text" name="insPrenom" placeholder="Prénom">
                                </div>
                                <div class="col-md-12">
                                    <label>Adresse email*</label>
                                    <input type="email" name="insEmail" placeholder="Adresse email">
                                </div>
                                <div class="col-md-6">
                                    <label>Mot de passe</label>
                                    <input type="password" name="insPassword" placeholder="Mot de passe">
                                </div>
                                <!-- <div class="col-md-6">
                                    <label>Confirmer le mot de passe</label>
                                    <input type="password" name="insConfirmPassword" placeholder="Confirmer le mot de passe">
                                </div> -->
                                <div class="col-12">
                                    <button class="btn custom-btn md-size" type="submit" name="btnInscription">Inscription</button>
                                </div>
                            </div>
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