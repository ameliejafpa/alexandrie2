
    <!--footer area start-->
    <footer class="footer_widgets">
        <div class="container">
            <div class="main_footer">
                <div class="row">
                    <div class="col-12">
                        <div class="main_footer_inner d-flex">
                            <div class="footer_widget_list contact footer_list_width">
	                            <c:forEach items="${listeCoordonnees }" var="coordonnee">
	                                <h3>Contactez-nous</h3>
	                                <div class="footer_contact_desc">
	                                    <p>Si vous avez des questions, écrivez-nous à <a href="mailto:${coordonnee.email }">${coordonnee.email }</a></p>
	                                </div>
	                                <div class="footer_contact_info">
	                                	<div class="footer_contact_info_list d-flex align-items-center">
		                                        <div class="footer_contact_info_icon">
		                                            <span class="pe-7s-map-marker"></span>
		                                        </div>
		                                        <div class="footer_contact_info_text">
		                                            <p>${coordonnee.adresse }</p>
		                                        </div>
		                                    </div>
		                                    <div class="footer_contact_info_list d-flex align-items-center">
		                                        <div class="footer_contact_info_icon">
		                                            <span class="pe-7s-phone"></span>
		                                        </div>
		                                        <div class="footer_contact_info_text">
		                                            <ul>
		                                                <li><a href="tel:${coordonnee.telephone }">${coordonnee.telephone }</a></li>
		                                            </ul>
		                                        </div>
		                                    </div>
	                                </div>
                                </c:forEach>
                            </div>
                            <div class="footer_menu_widget footer_list_width middle d-flex">
                                <div class="footer_widget_list">
                                    <h3>Informations</h3>
                                    <div class="footer_menu">
                                        <ul>
                                        	<c:if test="${isConnected }">
                                            	<li><a href="contact">Nous contacter</a></li>
                                            </c:if>
                                            <c:forEach items="${listeCategories}" var="categorie">
	                                            <li><a href="listeProduits?idCategorie=${categorie.id }">${categorie.titre }</a></li>
	                                        </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                                <div class="footer_widget_list">
                                    <h3>Compte</h3>
                                    <div class="footer_menu">
	                                     <ul>
	                                        <c:if test="${isConnected }">
	                                            <li><a href="monCompte">Mon compte</a></li>
	                                            <li><a href="monCompte#account-orders">Mes commandes</a></li>
	                                            <li><a href="listeFavoris?idUtilisateur=${userId }">Mes favoris</a></li>
	                                        </c:if>
	                                        <c:if test="${!isConnected }">
	                                            <li><a href="login">Inscription / Connexion</a></li>
	                                        </c:if>
	                                    </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- <div class="footer_widget_list footer_list_width">
                                <h3>newsletter</h3>
                                <div class="footer_newsletter">
                                    <div class="newsletter_subscribe">
                                        <form id="mc-form">
                                            <input id="mc-email" type="email" autocomplete="off"
                                                placeholder="Adresse email">
                                            <button id="mc-submit"><i class="ion-arrow-right-c"></i></button>
                                        </form>
                                        mailchimp-alerts Start
                                        <div class="mailchimp-alerts text-centre">
                                            <div class="mailchimp-submitting"></div>
                                            mailchimp-submitting end
                                            <div class="mailchimp-success"></div>
                                            mailchimp-success end
                                            <div class="mailchimp-error"></div>
                                            mailchimp-error end
                                        </div>mailchimp-alerts end
                                    </div>
                                </div>
                            </div> -->
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer_bottom">
                <div class="copyright_right text-center">
                    <p> © 2022 <a href="accueil"> ${coordonnee.nom }</a> Made with <i class="ion-heart"></i> by
                        <a href="https://themeforest.net/user/codecarnival/portfolio">Amélie & Guillaume</a>
                    </p>
                </div>
            </div>
        </div>
    </footer>
    <!--footer area end-->
    
    
    