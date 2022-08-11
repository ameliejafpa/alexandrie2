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

  <title>Liste des adresses</title>
  
</head>

<body>

<c:url value="/userlistadmin" var="utlisateurs"/>

    <div class="card">
    	<!--  header contenu -->
        <div class="card-header py-3">
            <div class="row align-items-center m-0">
	            <div class="col-md-3 col-12 me-auto mb-md-0 mb-3">
	            	<h6 class="mb-0">Liste des adresses de ${user.prenom } ${user.nom } </h6>
	            </div>
                      <!-- bouton retour -->
                <div class="col-md-3 col-12 me-auto mb-md-0 mb-3">
                <a href="${utlisateurs }"><button type="button" class="btn btn-primary">Retour</button></a>
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
                                            <th>adresse</th>
                                            <th>codePostal</th>
                                            <th>ville</th>
                                            <th>pays</th>                                 
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listeAdresse }" var="adresse">
                                            <tr>
                                                <td><span>${adresse.adresse }</span></td>
                                                <td><span>${adresse.codePostal }</span></td>
                                                <td><span>${adresse.ville}</span></td>
                                                <td><span>${adresse.pays}</span></td>
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
 
