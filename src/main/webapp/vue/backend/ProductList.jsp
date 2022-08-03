<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" class="light-theme">

<jsp:include page="/header"/>

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" href="vue/backend/assets/images/favicon-32x32.png" type="image/png" />
  <!--plugins-->
  <link href="vue/backend/assets/plugins/simplebar/css/simplebar.css" rel="stylesheet" />
  <link href="vue/backend/assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" />
  <link href="vue/backend/assets/plugins/metismenu/css/metisMenu.min.css" rel="stylesheet" />
  <!-- Bootstrap CSS -->
  <link href="vue/backend/assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="vue/backend/assets/css/bootstrap-extended.css" rel="stylesheet" />
  <link href="vue/backend/assets/css/style.css" rel="stylesheet" />
  <link href="vue/backend/assets/css/icons.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
  <!-- loader-->
	<link href="vue/backend/assets/css/pace.min.css" rel="stylesheet" />
  <!--Theme Styles-->
  <link href="vue/backend/assets/css/dark-theme.css" rel="stylesheet" />
  <link href="vue/backend/assets/css/light-theme.css" rel="stylesheet" />
  <link href="vue/backend/assets/css/semi-dark.css" rel="stylesheet" />
  <link href="vue/backend/assets/css/header-colors.css" rel="stylesheet" />

  <title>Liste des produits</title>
  
</head>

<body>
<c:url value="/newproductadmin" var="newproduct"/>


  <!--start wrapper-->
  <div class="wrapper">

    <!--start content-->
     <main class="page-content"> 

    <div class="card">
    	<!--  header contenu -->
        <div class="card-header py-3">
            <div class="row align-items-center m-0">
	            <div class="col-md-3 col-12 me-auto mb-md-0 mb-3">
	            	<h6 class="mb-0">Liste des produits</h6>
	            </div>
                <!-- filtre categories -->
                <div class="col-md-3 col-12 me-auto mb-md-0 mb-3">
                    <div class="accordion accordion-flush" id="accordionFlushExample">
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="flush-headingOne">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#flush-collapseOne" aria-expanded="false"
                                    aria-controls="flush-collapseOne">
                                    filtrer par categorie
                                </button>
                            </h2>
                            <div id="flush-collapseOne" class="accordion-collapse collapse"
                                aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                                <div class="accordion-body">
                                    <ul>
                                        <c:forEach items="${listeCategorie }" var="categorie">
                                            <li> <a href="productlistadmin?sortCategorie=${categorie.id }"
                                                    name="sortCategorie">${categorie.titre }</a>
                                            </li>
                                        </c:forEach>
                                        <li> <a href="productlistadmin">Tous</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- filtre sous-categories -->
                <div class="col-md-3 col-12 me-auto mb-md-0 mb-3">
                    <div class="accordion accordion-flush" id="accordionFlushExample">
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="flush-headingOne">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#flush-collapseOne" aria-expanded="false"
                                    aria-controls="flush-collapseOne">
                                    filtrer par sous categorie
                                </button>
                            </h2>
                            <div id="flush-collapseOne" class="accordion-collapse collapse"
                                aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                                <div class="accordion-body">
                                    <ul>
                                        <c:forEach items="${listeSousCategorie }" var="sousCategorie">
                                            <li> <a href="productlistadmin?sortSousCategorie=${sousCategorie.id }"
                                                    name="sortSousCategorie">${sousCategorie.titre }</a>
                                            </li>
                                        </c:forEach>
                                        <li> <a href="productlistadmin">Tous</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- bouton ajout -->
                <div class="col-md-3 col-12 me-auto mb-md-0 mb-3">
                <a href="${newproduct }"><button type="button" class="btn btn-primary">Ajouter un produit</button></a>
                </div>
            </div>

        </div>
        <!-- fin header contenu -->

        <div class="card-body">
            <div class="row">
                <!-- table produits-->
                <div class="col-12 col-lg-12 d-flex">
                    <div class="card border shadow-none w-100">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table align-middle table-striped">
                                    <thead class="table-light">
                                        <tr>
                                            <th>Id</th>
                                            <th></th>
                                            <th>Produit</th>
                                            <th>Prix</th>
                                            <th>Stock</th>
                                            <th>Cat</th>
                                            <th>Sous-cat</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listeProduits }" var="produit">
                                            <tr>
                                                <td><span>${produit.id }</span></td>
                                                <td><img src="${produit.image }" alt="" width="40" height="50"></td>
                                                <td><span>${produit.titre }</span></td>
                                                <td><span>${produit.prix } EUR</span></td>
                                                <td><span>${produit.stock }</span></td>
                                                <td><span>${produit.idSousCategorie.idCategorie.titre }</span></td>
                                                <td><span>${produit.idSousCategorie.titre }</span></td>
                                                <td>
                                                    <div class="d-flex align-items-center gap-3 fs-6">
                                                        <a href="productdetailadmin?id=${produit.id }&action=show" class="text-primary"
                                                            data-bs-toggle="tooltip" data-bs-placement="bottom"
                                                            data-bs-original-title="View detail" aria-label="Views"><i
                                                                class="bi bi-eye-fill"></i></a>
                                                        <a class="text-danger" data-bs-toggle="modal"
                                                            data-bs-target="#deleteproduitModal${produit.id }"
                                                            data-bs-placement="bottom"
                                                            data-bs-original-title="Delete" aria-label="Delete"><i
                                                                class="bi bi-trash-fill"></i></a>
                                                    </div>
                                                </td>
                                            </tr>
                                            <!-- modal suppression catégorie-->
                                            <div class="modal fade" id="deleteproduitModal${produit.id }" tabindex="-1"
                                                aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-body">Voulez-vous confirmer la suppression de
                                                            ${produit.titre } ?</div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary"
                                                                data-bs-dismiss="modal">Annuler</button>
                                                            <a href="productlistadmin?deleteProduit=${produit.id }"><button
                                                                    type="button" class="btn btn-primary"
                                                                    name="deleteProduit">Confirmer</button></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
 	 </div>
  </div>
</div>

			</div>
		</div>
	</div>
 </main>
       <!--end page main-->




        <!--Start Back To Top Button-->
        <a href="javaScript:;" class="back-to-top"><i class='bx bxs-up-arrow-alt'></i></a>
        <!--End Back To Top Button-->
        
       

  </div>
  <!--end wrapper-->


  <!-- Bootstrap bundle JS -->
  <script src="vue/backend/assets/js/bootstrap.bundle.min.js"></script>
  <!--plugins-->
  <script src="vue/backend/assets/js/jquery.min.js"></script>
  <script src="vue/backend/assets/plugins/simplebar/js/simplebar.min.js"></script>
  <script src="vue/backend/assets/plugins/metismenu/js/metisMenu.min.js"></script>
  <script src="vue/backend/assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
  <script src="vue/backend/assets/js/pace.min.js"></script>
  <!--app-->
  <script src="vue/backend/assets/js/app.js"></script>
  

</body>

</html>
 
