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

  <title>Ajouter un produit</title>
</head>

<body>

  <!--start wrapper-->
  <div class="wrapper">
  
          <!--Start Back To Top Button-->
        <a href="javaScript:;" class="back-to-top"><i class='bx bxs-up-arrow-alt'></i></a>
        <!--End Back To Top Button-->
        

  </div>
  <!--end wrapper-->
  
  <!--start content-->
     <main class="page-content"> 

    <div class="card">

        <div class="card-body">
            <div class="row">
            	<c:forEach items="${listeCoordonnees }" var="coordonnee">
            	<!-- images -->            
                <div class="col-12 col-lg-3 d-flex">
                    <div class="card border shadow-none w-100">
                        <div class="card-body">
                        	<div><img src="${coordonnee.logo}" alt="" height=300></div>
                        	       
                        </div>
                     </div>
                </div>
                
                <!-- info article -->
                <div class="col-12 col-lg-6">
                <form method="post" >
                <div class="card shadow-sm border-0">
                  <div class="card-body">
                     <div class="card shadow-none border">
                        <div class="card-body">
                          <div class="row g-3">
                            <div class="col-12">
                              <label class="form-label">Nom</label>
                              <input class="form-control form-control-lg mb-3" type="text" placeholder="nom" aria-label=".form-control-lg example" name="intputNom" value="${coordonnee.nom}">
                             </div>
                          </div>
                        </div>
                      </div>
                      
                      <div class="card shadow-none border">
                        <div class="card-body">
                          <div class="row g-3">
                            <div class="col-12">
                              <label class="form-label">Adresse</label>
                              <textarea class="form-control" name="inputDescr">${coordonnee.adresse}</textarea>
                             </div>
                          </div>
                        </div>
                      </div>
                      
                      <div class="card shadow-none border">
                        <div class="card-body">
                          <div class="row g-3">
                            <div class="col-12">
                              <label class="form-label">Téléphone</label>
                              <input class="form-control form-control-lg mb-3" type="text" placeholder="nom" aria-label=".form-control-lg example" name="intputNom" value="${coordonnee.telephone}">
                             </div>
                          </div>
                        </div>
                      </div>
                      
                      <div class="card shadow-none border">
                        <div class="card-body">
                          <div class="row g-3">
                            <div class="col-12">
                              <label class="form-label">Email</label>
                              <input class="form-control form-control-lg mb-3" type="text" placeholder="nom" aria-label=".form-control-lg example" name="intputNom" value="${coordonnee.email}">
                             </div>
                          </div>
                        </div>
                      </div>
                      
                      <div class="card shadow-none border">
                        <div class="card-body">
                          <div class="row g-3">
                            <div class="col-4">
                             <label class="form-label">Logo</label>
                             <input type="file" class="form-control"
                                 name="inputImage1">
                         </div>
                          </div>
                        </div>
                      </div>
                      
                      <div class="card shadow-none border">
                        <div class="card-body">
                        <div class="text-start">

                        	<button type="submit" class="btn btn-primary px-4" name="btnUpdateCoordonnee">Save Changes</button>
                        	<a href="${retourliste }"><button type="button" class="btn btn-secondary">Annuler</button></a>
                     	 </div>    
                        </div>
                      </div>

                  </div>
                </div>
                
                </form>
              </div>
              </c:forEach>
 			</div>
		</div>
	</div>
 </main>
       <!--end page main-->


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
 