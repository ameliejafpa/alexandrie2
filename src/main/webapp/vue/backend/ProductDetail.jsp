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

  <title>${produit.titre }</title>
</head>

<body>
<c:url value="/productlistadmin" var="retourliste"/>

  <!--start wrapper-->
  <div class="wrapper">

    <!--start content-->
     <main class="page-content"> 

    <div class="card">

        <div class="card-body">
            <div class="row">
            
            	<!-- images -->            
                <div class="col-12 col-lg-3 d-flex">
                    <div class="card border shadow-none w-100">
                        <div class="card-body">
                        	<div><img src="${produit.image}" alt="" height=300></div>
                        	<c:forEach items="${listeImages }" var="image">
                        	
                        		<div value="${image.id }" name="image"><img src="${image.url }" alt="" height=300></div>
                        	</c:forEach>          
                        </div>
                     </div>
                </div>
                
                <!-- info article -->
                <div class="col-12 col-lg-6">
                <form method="post" >
                <div class="card shadow-sm border-0">
                  <div class="card-body">
                     <div class="row g-3">
                      <div class="card shadow-none border">
                        <div class="card-header">
                          <input class="form-control form-control-lg mb-3" type="text" placeholder="nom article" aria-label=".form-control-lg example" name="intputTitre" value="${produit.titre}">
                        </div>
                      </div>
                      </div>
                      
                 <div class="card shadow-none border">
                  <div class="card-body">
                     <div class="row g-3">
                         <div class="col-3">
                            <label class="form-label">Prix</label>
                            <input type="number" step="0.01" class="form-control" placeholder="prix"
                                name="inputPrix" value="${produit.prix }">
                        </div>           
						<div class="col-5">
                            <label class="form-label">Sous-catégorie</label>
                            <select class="form-select" name="inputSousCat">
                              <option selected value="${produit.idSousCategorie.id }">${produit.idSousCategorie.titre }</option>
                              <c:forEach items="${listeSousCategorie}" var="sousCategorie">
								<option value="${sousCategorie.id }"> ${sousCategorie.titre }</option>
							</c:forEach> 
                            </select> 
                          </div>
                          <div class="col-3">
                            <label class="form-label">alerte stock</label>
                            <input type="number" step="1" class="form-control" placeholder="prix"
                                name="inputStockMin" value="${produit.stockMinimum }">
                        </div>     
                       </div>
                   </div>
                </div>

                      <div class="card shadow-none border">
                        <div class="card-body">
                          <div class="row g-3">
                            <div class="col-12">
                              <label class="form-label">Description du produit</label>
                              <textarea class="form-control" name="inputDescr">${produit.description}</textarea>
                             </div>
                          </div>
                        </div>
                      </div>
                      
                      <div class="card shadow-none border">
                        <div class="card-body">
                          <div class="row g-3">
                            <div class="col-4">
                             <label class="form-label">Image 1</label>
                             <input type="file" class="form-control"
                                 name="inputImage1">
                         </div>
                           <div class="col-4">
                             <label class="form-label">Image 2</label>
                             <input type="file" class="form-control" placeholder="chemin de l'image"
                                 name="inputImage2">
                           </div>
                        <div class="col-4">
                             <label class="form-label">Image 3</label>
                             <input type="file" class="form-control" placeholder="chemin de l'image"
                                 name="inputImage3">
                         </div>
                          </div>
                        </div>
                      </div>
                      
                      <div class="card shadow-none border">
                        <div class="card-body">
                        <div class="text-start">

                        	<button type="submit" class="btn btn-primary px-4" name="btnUpdateProduit">Save Changes</button>
                        	<a href="${retourliste }"><button type="button" class="btn btn-secondary">Annuler</button></a>
                     	 </div>    
                        </div>
                      </div>

                  </div>
                </div>
                
                </form>
              </div>
              
              <!-- modif stock -->
              
              <div class="col-12 col-lg-3">
                <div class="card shadow-sm border-0">
                  <div class="card-body">

                     <form class="row g-3"  method="post">
                        <!-- stock actuel -->
			        <div class="col-12">
                           <label class="form-label">Stock actuel</label>
                           <input type="number" class="form-control" name="stockInit" value="${produit.stock }" readonly>
                       </div>   
						
                    <!-- selection fournisseur -->
                        <div class="col-12">
                          <label class="form-label">fournisseur</label>
                          <select class="form-select" name="inputFournisseur">
                            <c:forEach items="${listeFournisseurs}" var="fournisseur">
						<option value="${fournisseur.id }"> ${fournisseur.nom }</option>
					</c:forEach> 
                          </select> 
                        </div>                      
                        <!-- selection quantite -->
			        <div class="col-12">
                           <label class="form-label">Stock</label>
                           <input type="number" step="1" class="form-control" placeholder="quantité reçue"
                               name="inputStock">
                       </div>      
   
                       <!-- date d'entrée en stock --> 
                       <div class="mb-3">
						<label class="form-label">Date:</label>
						<input type="date" class="form-control" name="inputDate">
					</div>			
					<div class="text-start">
                        <a href="${retourliste }"><button type="button" class="btn btn-secondary">Annuler</button></a>
						<button type="submit" class="btn btn-primary" name="btnUpdateStock">Confirmer</button>
					</div>
                    </form>
                  </div>
                </div>
              
              <!-- affiche commentaires -->
                <div class="card shadow-sm border-0">
                  <div class="card-body">
                     <a class="text-danger" data-bs-toggle="modal" data-bs-target="#commentproduitModal${produit.id }" data-bs-placement="bottom">
                     	<button class="btn btn-primary">voir les commentaires</button>
                     </a>
                     <a href="orderbyuseradmin?id=${produit.id }&action=showByProduct" class="text-primary" data-bs-toggle="tooltip" data-bs-placement="bottom" 
                   data-bs-original-title="Voir les commandes"><button class="btn btn-primary">voir les commandes liées</button></a> 

                     
       <!-- modal commentaire -->
       <div class="modal fade" id="commentproduitModal${produit.id }" tabindex="-1"
        aria-labelledby="exampleModalLabel" aria-hidden="true">
	        <div class="modal-dialog">
	            <div class="modal-content">
     				<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Liste des commentaires</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
	                <div class="modal-body">
	                	<table class="table align-middle table-striped">
                                    <thead class="table-light">
                                        <tr>
                                            <th>User</th>
                                            <th>Note</th>
                                            <th>Commentaire</th>
                                            <th>Supprimer</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listeCommentaires }" var="commentaire">
                                            <tr>
                                                <td><span>${commentaire.idUtilisateur.nom }</span></td>
                                                <td><span>${commentaire.note }</span></td>
                                                <td><span>${commentaire.commentaire }</span></td>
                                                <td>
                                                    <div class="d-flex align-items-center gap-3 fs-6">   
                                                        <a href="productdetailadmin?id=${produit.id }&action=deleteComment"
                                                        class="text-danger" data-bs-toggle="tooltip" data-bs-placement="bottom" name="deleteComment">
                                                            <i class="bi bi-trash-fill"></i></a>
                                                    </div>
                                                </td>
                                            </tr>

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
 
