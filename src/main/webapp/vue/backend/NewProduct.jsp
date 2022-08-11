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

  <!--Theme Styles-->
  <link href="vue/backend/assets/css/dark-theme.css" rel="stylesheet" />
  <link href="vue/backend/assets/css/light-theme.css" rel="stylesheet" />
  <link href="vue/backend/assets/css/semi-dark.css" rel="stylesheet" />
  <link href="vue/backend/assets/css/header-colors.css" rel="stylesheet" />

  <title>Ajouter un produit</title>
</head>

<body>

<c:url value="/productlistadmin" var="retourliste"/>

         <form method="post" action="newproductadmin">
              <div class="row">
                 <div class="col-lg-12 mx-auto">
                  <div class="card">
                    <div class="card-header py-3 bg-transparent"> 
                      <div class="d-sm-flex align-items-center">
                        <h5 class="mb-2 mb-sm-0">Nouveau produit</h5>
                      </div>
                     </div>
                    <div class="card-body">       
                       <div class="row g-3"> 
                         <div class="col-12 col-lg-8">
                            <div class="card shadow-none bg-light border">
                              <div class="card-body">
                                <div class="row g-3">
                                  <div class="col-12">
                                    <label class="form-label">Nom du produit</label>
                                    <input type="text" class="form-control" placeholder="Product title" name="intputTitre">
                                  </div>
                                  <div class="col-12">
                                    <label class="form-label">Description du produit</label>
                                    <textarea class="form-control" placeholder="Full description" rows="4" cols="4" style="height: 287px;" name="inputDescr"></textarea>
                                  </div>
                                </div>
                              </div>
                            </div>
                         </div>

                         <div class="col-12 col-lg-4">
                            <div class="card shadow-none bg-light border">
                              <div class="card-body">
                                  <div class="row g-3">
								<div class="col-12">
		                            <label class="form-label">Sous-catégorie</label>
		                            <select class="form-select" name="inputSousCat">
		                              <c:forEach items="${listeSousCategorie}" var="sousCategorie">
										<option value="${sousCategorie.id }"> ${sousCategorie.titre }</option>
									</c:forEach> 
		                            </select> 
		                          </div>
                                    <div class="col-12">
                                      <label class="form-label">Prix</label>
                                      <input type="text" class="form-control" placeholder="Price" name="inputPrix">
                                    </div>
                                  <div class="col-12">
                                    <label class="form-label">Image principale</label>
                                    <input class="form-control" type="file" name="inputImage">
                                  </div>  
                                  <div class="col-12">
                                  <a href="${retourliste }"><button type="button" class="btn btn-secondary">Annuler</button></a>
                                  <button class="btn btn-primary" type="submit" name="btnAjout">Ajouter le produit</button>                           
                                  </div>        
                                  </div><!--end row-->
                              </div>
                            </div>  
                        </div>
                       </div><!--end row-->
                     </div>
                    </div>
                 </div>
              </div><!--end row-->
			 </form>
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
 
