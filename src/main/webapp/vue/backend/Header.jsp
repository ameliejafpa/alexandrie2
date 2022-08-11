<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" class="light-theme">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" href="vue/backend/assets/images/favicon-32x32.png" type="image/png" />
  <!--plugins-->
  <link href="vue/backend/assets/plugins/simplebar/css/simplebar.css" rel="stylesheet" />
  <link href="vue/backend/assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" />
  <link href="vue/backend/assets/plugins/metismenu/css/metisMenu.min.css" rel="stylesheet" />
  <link href="vue/backend/assets/plugins/vectormap/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
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

</head>

<body>
  
  <!-- variables-->
<c:url value="/productlistadmin" var="productList"/>
<c:url value="/listecatadmin" var="categoryList"/>
<c:url value="/userlistadmin" var="userList"/>
<c:url value="/newproductadmin" var="newProduct"/>
<c:url value="/deconnexionadmin" var="deconnexion"/>
<c:url value="/accueiladmin" var="accueil"/>
<c:url value="/teamadmin" var="equipe"/>
<c:url value="/coordonneesadmin" var="coordonnees"/>
<c:url value="/orderbyuseradmin?action=showAll" var="commandes"/>



<!--start wrapper-->
  <div class="wrapper">

     
      <!--start navigation-->
     <div class="nav-container" style="top: 0px;">
      <div class="mobile-topbar-header">
        <div>
          <img src="vue/backend/assets/images/logo-icon.png" class="logo-icon" alt="logo icon">
        </div>
        <div>
          <h4 class="logo-text">Alexandrie</h4>
        </div>
        <div class="toggle-icon ms-auto"><i class="bi bi-chevron-double-left"></i>
        </div>
      </div>
      <nav class="topbar-nav" >
        <ul class="metismenu" id="menu">
        <li>
             <div class="topbar-logo-header d-none d-xl-flex">
             <a href="${accueil }">
          <div>
            <img src="vue/backend/assets/images/logo-icon.png" class="logo-icon" alt="logo icon">
          </div>
          <div>
            <h4 class="logo-text">Alexandrie</h4>
          </div>
          </a>
        </div>
        </li>
          <li>
            <a href="javascript:;" class="has-arrow">
              <div class="parent-icon"><i class="bi bi-house-door"></i>
              </div>
              <div class="menu-title">Produits</div>
            </a>
            <ul>
              <li> <a href="${productList }"><i class="bi bi-arrow-right-short"></i>liste des produits</a>
              </li>
			  <li> <a href="${newProduct }"><i class="bi bi-arrow-right-short"></i>ajout produit</a>
              </li>
              <li> <a href="${categoryList }"><i class="bi bi-arrow-right-short"></i>Listes categories</a>
              </li>
              <li> <a href="#"><i class="bi bi-arrow-right-short"></i>stocks</a>
              </li>
              <li> <a href="#"><i class="bi bi-arrow-right-short"></i>fournisseurs</a>
              </li>
            </ul>
          </li>
          <li>
            <a href="javascript:;" class="has-arrow">
              <div class="parent-icon"><i class="bi bi-grid"></i>
              </div>
              <div class="menu-title">Commandes</div>
            </a>
            <ul>
              <li> <a href="${commandes }"><i class="bi bi-arrow-right-short"></i>Liste des commandes</a>
              </li>
              <li> <a href="${userList }"><i class="bi bi-arrow-right-short"></i>Liste des utilisateurs</a>
              </li>
            </ul>
          </li>
          <li>
            <a href="javascript:;" class="has-arrow">
              <div class="parent-icon"><i class="bi bi-grid"></i>
              </div>
              <div class="menu-title">Gestion</div>
            </a>
            <ul>
              <li> <a href="${equipe }"><i class="bi bi-arrow-right-short"></i>Equipe</a>
              </li>
              <li> <a href="${coordonnees }"><i class="bi bi-arrow-right-short"></i>Coordonnées</a>
              </li>
            </ul>       
          </li>
          
          <!-- session -->
                              <!-- parametre admin  -->
          <c:if test="${isConnected==true }"> 
          <li>
            <a href="javascript:;" class="has-arrow">
              <div class="parent-icon"><i class="bi bi-grid"></i>
              </div>
              <div class="menu-title">Profil</div>
            </a>
            <ul>
              <li> 
              	<h6 class="mb-0 dropdown-user-name">${sessionNom }</h6>
                <small class="mb-0 dropdown-user-designation text-secondary">${sessionPrivilege }</small>
              </li>
              <li>
              	<a href="${profil}"><i class="bi bi-arrow-right-short"></i>profil</a>
              </li>
              <li>
              	<a href="${deconnexion}"><i class="bi bi-arrow-right-short"></i>Deconnexion</a>
              </li>
            </ul>       
          </li>
          </c:if>
          <!-- fin if connected -->
  
        </ul>
      </nav>
    </div>
    <!--end navigation-->  
    
       <!--start content-->
     <main class="page-content" style="top: 0px;margin-top: 90px;"> 

