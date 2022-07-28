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
                        <h1>Contact Us</h1>
                        <ul>
                            <li><a href="index.html">Home </a></li>
                            <li> // Contact Us</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- breadcrumbs area end -->

    <!-- contact section start -->
    <div class="contact_page_section mb-100">
        <div class="container">
            <div class="contact_details">
                <div class="row">
                    <div class="col-lg-7 col-md-6">
                        <div class="contact_info_content">
                            <h2>Nous sommes ici pour vous aider !</h2>
                            
                            <div class="contact_info_details mb-45">
                                <h3>Notre magasin à Paris</h3>
                                <p>Your address goes here.</p>
                                <p><a href="tel:0123456789">0123456789</a></p>
                                <p><a href="#">demo@example.com</a></p>
                                <p><a href="#">www.example.com</a></p>
                                <span>See On The Map</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-6">
                        <div class="contact_form" data-bgimg="assets/img/others/contact-form-bg-shape.png">
                            <h2>Votre demande</h2>
                            <form id="contact-form" method="post">
                                <div class="form_input">
                                    <input name="conSujet" placeholder="Sujet" type="text">
                                </div>
                                <div class="form_textarea">
                                    <textarea name="conMessage" placeholder="Votre Message"></textarea>
                                </div>
                                <div class="form_input_btn">
                                    <button type="submit" class="btn btn-link" name="btnMessage">Envoyer</button>
                                </div>
                                <p class="form-message"></p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- contact section end -->

    <!--contact map start-->
    <div class="contact_map mt-70">
        <iframe
            src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d2625.8276019638856!2d2.3886535158562716!3d48.842427009784245!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sfr!2sfr!4v1659046637143!5m2!1sfr!2sfr"
            style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
            
            
    </div>
    <!--contact map end-->
 
 
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