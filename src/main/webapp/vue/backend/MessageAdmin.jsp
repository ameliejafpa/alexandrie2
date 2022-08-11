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

  <title>Messages de ${utilisateur.nom } ${utilisateur.prenom }</title>
  
</head>

<body>

<!--start wrapper-->
<div class="wrapper">
	<!--start content-->
	<main class="page-content">
		<h6 class="mb-0 text-uppercase">${utilisateur.nom } ${utilisateur.prenom }</h6>
	    <hr>
	    <div class="card radius-10">
	      <div class="card-body">
	        <ul class="list-unstyled">
	        	<c:forEach items="${listeMessages }" var="message">
	          <li class="d-flex align-items-center border-bottom pb-2">
	            <div class="flex-grow-1 ms-3">
	              <h5 class="mt-0 mb-1">${message.sujet }</h5>
	              <p>${message.message }</p>
	              <p>État : ${message.etat == 0 ? 'Non lu' : 'Lu'}</p>
	              <c:if test="${message.etat == 0}">
	              	<a href="messageadmin?lu&id=${message.id }&idUtilisateur=${message.idUtilisateur.id}" type="button" class="btn btn-primary px-5" >Marquer comme lu</a>
	              </c:if>
	             </div>
	          </li>
	          </c:forEach>
	        </ul>
	      </div>
	    </div>
	</main> <!--end page main-->

	<!--Start Back To Top Button-->
	<a href="javaScript:;" class="back-to-top"><i class='bx bxs-up-arrow-alt'></i></a>
	<!--End Back To Top Button-->

</div> <!--end wrapper-->

  <!-- Bootstrap bundle JS -->
  <script src="vue/backend/assets/js/bootstrap.bundle.min.js"></script>
  <!--plugins-->
  <script src="vue/backend/assets/js/jquery.min.js"></script>
  <script src="vue/backend/assets/plugins/simplebar/js/simplebar.min.js"></script>
  <script src="vue/backend/assets/plugins/metismenu/js/metisMenu.min.js"></script>
  <script src="vue/backend/assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
  <script src="vue/backend/assets/js/pace.min.js"></script>
    <script src="https://unpkg.com/feather-icons"></script>
  <script src="vue/backend/assets/js/icons-feather-icons.js"></script>
	
  <!--app-->
  <script src="vue/backend/assets/js/app.js"></script>
  
</body>
</html>
