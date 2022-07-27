

<!--offcanvas menu area start-->
    <div class="body_overlay">

    </div>
    <div class="offcanvas_menu">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="offcanvas_menu_wrapper">
                        <div class="canvas_close">
                            <a href="javascript:void(0)"><i class="ion-android-close"></i></a>
                        </div>
                        <div class="welcome_text text-center">
                            <p>Bienvenue chez Alexandrie</p>
                        </div>
                        <div id="menu" class="text-left ">
                            <ul class="offcanvas_main_menu">
                                <li><a href="accueil">Accueil</a></li>  
                                 <c:forEach items="${listeCategories}" var="categorie">
	                                	<li class="menu-item-has-children"><a href="#">${categorie.titre }</a>
	                                		<ul class="sub-menu">
	                                			<c:forEach items="${listeSousCategories}" var="sousCategorie">
	                                				<c:if test="${sousCategorie.idCategorie.id == categorie.id }">
														<li><a href="listeProduits?idSousCategorie=${sousCategorie.id }">${sousCategorie.titre }</a></li>
 	                                				</c:if>
	                                			</c:forEach>
	                                		</ul>
	                                	<li>
                                	</c:forEach> 
                                <li class="menu-item-has-children"><a href="${coordonnee }">Nous contacter</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--offcanvas menu area end-->
    
    
    <!--header area start-->
    <header class="header_section">
        <div class="header_top">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="header_top_inner d-flex justify-content-between">
                            <div class="welcome_text">
                                <p>Les instruments de musique</p>
                            </div>
                            <div class="header_top_sidebar d-flex align-items-center">
                                <ul class="d-flex">
                                    <li><i class="icofont-phone"></i> <a href="tel:0123456789">01 23 45 67 89</a>
                                    </li>
                                    <li><i class="icofont-envelope"></i> <a
                                            href="mailto:demo@example.com">contact@alexandrie.com</a></li>
                                   <c:if test="${!isConnected }">
                                        <li class="account_link">
                                                <a href="login"><span>Inscription / Connexion</span></a> 
                                        </li>
                                   </c:if>
                                   <c:if test="${isConnected }">
                                        <li class="account_link"> <i class="icofont-user-alt-7"></i><a href="#">${userPrenom} ${userNom}</a>
                                        	<ul class="dropdown_account_link">
                                        		<li><a href="#"><span>Mon compte</span></a></li>
                                        		<li><a href="deconnexion"><span>Déconnexion </span></a></li>
                                        	</ul>
                                        </li>
		                            </c:if>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="main_header d-flex justify-content-between align-items-center">
                       <div class="header_logo">
                            <a class="sticky_none" href="index.html"><img src="vue/frontend/assets/img/logo/logo_music_shop.png" alt=""></a>
                        </div>
                        <!--main menu start-->
                        <div class="main_menu d-none d-lg-block">
                            <nav>
                                <ul class="d-flex">
                                    <li><a href="accueil">Accueil</a></li>
                                    <c:forEach items="${listeCategories}" var="categorie">
	                                	<li><a href="listeProduits?idCategorie=${categorie.id }">${categorie.titre }</a>
	                                		<ul class="bucker-dropdown">
	                                			<c:forEach items="${listeSousCategories}" var="sousCategorie">
	                                				<c:if test="${sousCategorie.idCategorie.id == categorie.id }">
														<li><a href="listeProduits?idSousCategorie=${sousCategorie.id }">${sousCategorie.titre }</a></li>
 	                                				</c:if>
	                                			</c:forEach>
	                                		</ul>
	                                	<li>
                                	</c:forEach> 
                                    <li><a href="${coordonnee }">Nous contacter</a></li>
                                </ul>
                            </nav>
                        </div>
                        <!--main menu end-->
                        <div class="header_account">
                            <ul class="d-flex">
                                <li class="header_search"><a href="javascript:void(0)"><i class="pe-7s-search"></i></a></li>
                                <c:if test="${isConnected }">
                                	<li class="header_wishlist"><a href="listeFavoris?idUtilisateur=${userId }"><i class="pe-7s-like"></i></a></li>
                                </c:if>  
                                <li class="shopping_cart"><a href="javascript:void(0)"><i class="pe-7s-shopbag"></i></a>
                                    <span class="item_count">${panier.count() }</span>
                                </li>
                            </ul>
                            <div class="canvas_open">
                                <a href="javascript:void(0)"><i class="ion-navicon"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!--mini cart-->
    <div class="mini_cart">
        <div class="cart_gallery">
            <div class="cart_close">
                <div class="cart_text">
                    <h3>Panier (${panier.count()} article(s))</h3>
                </div>
                <div class="mini_cart_close">
                    <a href="javascript:void(0)"><i class="ion-android-close"></i></a>
                </div>
            </div>
            <c:forEach items="${panierDetails }" var="article">
	            <div class="cart_item">
	                <div class="cart_img">
	                    <a href="produit?id=${article.idProduit.id }"><img src="vue/frontend/assets/img/product/product1.png" alt=""></a>
	                </div>
	                <div class="cart_info">
	                    <a href="single-product.html">Primis In Faucibus</a>
	                    <p>1 x <span> $65.00 </span></p>
	                </div>
	                <div class="cart_remove">
	                    <a href="#"><i class="ion-android-close"></i></a>
	                </div>
	            </div>
            </c:forEach>
            
        </div>
        <div class="mini_cart_table">
            <div class="cart_table_border">
                <div class="cart_total">
                    <span>Sub total:</span>
                    <span class="price">$125.00</span>
                </div>
                <div class="cart_total mt-10">
                    <span>total:</span>
                    <span class="price">$125.00</span>
                </div>
            </div>
        </div>
        <div class="mini_cart_footer">
            <div class="cart_button">
                <a href="${login }">Voir le panier</a>
            </div>
            <div class="cart_button">
                <a href="checkout.html"><i class="fa fa-sign-in"></i> Payer</a>
            </div>
        </div>
    </div>
    <!--mini cart end-->

    <!-- page search box -->
    <div class="page_search_box">
        <div class="search_close">
            <i class="ion-close-round"></i>
        </div>
        <form class="border-bottom" action="#">
            <input class="border-0" placeholder="Chercher..." type="text">
            <button type="submit"><span class="pe-7s-search"></span></button>
        </form>
    </div>