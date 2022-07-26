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

  <!-- loader-->
	<link href="vue/backend/assets/css/pace.min.css" rel="stylesheet" />
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
<c:url value="/deconnexionadmin" var="deconnexion"/>
<c:url value="/accueiladmin" var="accueil"/>

<!--start wrapper-->
  <div class="wrapper">
    <!--start top header-->
    <header class="top-header">        
      <nav class="navbar navbar-expand">
        <div class="topbar-logo-header d-none d-xl-flex">
          <div>
            <img src="vue/backend/assets/images/logo-icon.png" class="logo-icon" alt="logo icon">
          </div>
          <div>
            <h4 class="logo-text">Alexandrie</h4>
          </div>
        </div>
        <div class="mobile-toggle-icon d-xl-none">
            <i class="bi bi-list"></i>
          </div>
          <div class="top-navbar d-none d-xl-block ms-3">
          <ul class="navbar-nav align-items-center">
            <li class="nav-item">
            <a class="nav-link" href="${accueil }">Accueil</a>
            </li>      
            <li class="nav-item">
            <a class="nav-link" href="javascript:;">Produits</a>
            </li>       
            <li class="nav-item">
            <a class="nav-link" href="javascript:;">Commandes</a>
            </li>       
            <li class="nav-item">
            <a class="nav-link" href="javascript:;">Equipe</a>
            </li>       
          </ul>  
          </div>
          
          <div class="search-toggle-icon d-xl-none ms-auto">
            <i class="bi bi-search"></i>
          </div>
          <form class="searchbar d-none d-xl-flex ms-auto">
              <div class="position-absolute top-50 translate-middle-y search-icon ms-3"><i class="bi bi-search"></i></div>
              <input class="form-control" type="text" placeholder="Type here to search">
              <div class="position-absolute top-50 translate-middle-y d-block d-xl-none search-close-icon"><i class="bi bi-x-lg"></i></div>
          </form>
          
          <!-- parametre admin  -->
          <c:if test="${isConnected==true }">        
          <div class="top-navbar-right ms-3">
            <ul class="navbar-nav align-items-center">
            <li class="nav-item dropdown dropdown-large">
              <a class="nav-link dropdown-toggle dropdown-toggle-nocaret" href="#" data-bs-toggle="dropdown">
                <div class="user-setting d-flex align-items-center gap-1">
                  <div class="apps-icon-box mb-1 text-white bg-danger bg-gradient messages">${sessionNom.charAt(0) }</div>
                </div>
              </a>
              <ul class="dropdown-menu dropdown-menu-end">
                <li>
                   <a class="dropdown-item" href="#">
                     <div class="d-flex align-items-center">
                        <div class="ms-3">
                          <h6 class="mb-0 dropdown-user-name">${sessionNom }</h6>
                          <small class="mb-0 dropdown-user-designation text-secondary">${sessionPrivilege }</small>
                        </div>
                     </div>
                   </a>
                 </li>
                 <li><hr class="dropdown-divider"></li>
                 <li>
                    <a class="dropdown-item" href="#">
                       <div class="d-flex align-items-center">
                         <div class="setting-icon"><i class="bi bi-person-fill"></i></div>
                         <div class="setting-text ms-3"><span>Profil</span></div>
                       </div>
                     </a>
                  </li>
                  <li><hr class="dropdown-divider"></li>
                  <li>
                    <a class="dropdown-item" href="${deconnexion }">
                       <div class="d-flex align-items-center">
                         <div class="setting-icon"><i class="bi bi-lock-fill"></i></div>
                         <div class="setting-text ms-3"><span>Deconnexion</span></div>
                       </div>
                     </a>
                  </li>
              </ul>
            </li>
          </c:if>
          <!-- fin if connected -->


            <li class="nav-item dropdown dropdown-large">
              <a class="nav-link dropdown-toggle dropdown-toggle-nocaret" href="#" data-bs-toggle="dropdown">
                <div class="messages">
                  <span class="notify-badge">5</span>
                  <i class="bi bi-messenger"></i>
                </div>
              </a>
              <div class="dropdown-menu dropdown-menu-end p-0">
                <div class="p-2 border-bottom m-2">
                    <h5 class="h5 mb-0">Messages</h5>
                </div>
               <div class="header-message-list p-2">
                  <div class="dropdown-item bg-light radius-10 mb-1">
                    <form class="dropdown-searchbar position-relative">
                      <div class="position-absolute top-50 start-0 translate-middle-y px-3 search-icon"><i class="bi bi-search"></i></div>
                      <input class="form-control" type="search" placeholder="Search Messages">
                    </form>
                  </div>
                   <a class="dropdown-item" href="#">
                     <div class="d-flex align-items-center">
                        <img src="vue/backend/assets/images/avatars/avatar-1.png" alt="" class="rounded-circle" width="52" height="52">
                        <div class="ms-3 flex-grow-1">
                          <h6 class="mb-0 dropdown-msg-user">Amelio Joly <span class="msg-time float-end text-secondary">1 m</span></h6>
                          <small class="mb-0 dropdown-msg-text text-secondary d-flex align-items-center">The standard chunk of lorem...</small>
                        </div>
                     </div>
                   </a>
                  <a class="dropdown-item" href="#">
                    <div class="d-flex align-items-center">
                       <img src="vue/backend/assets/images/avatars/avatar-2.png" alt="" class="rounded-circle" width="52" height="52">
                       <div class="ms-3 flex-grow-1">
                         <h6 class="mb-0 dropdown-msg-user">Althea Cabardo <span class="msg-time float-end text-secondary">7 m</span></h6>
                         <small class="mb-0 dropdown-msg-text text-secondary d-flex align-items-center">Many desktop publishing</small>
                       </div>
                    </div>
                  </a>
              </div>
              <div class="p-2">
                <div><hr class="dropdown-divider"></div>
                  <a class="dropdown-item" href="#">
                    <div class="text-center">View All Messages</div>
                  </a>
              </div>
             </div>
            </li>
            <li class="nav-item dropdown dropdown-large d-none d-sm-block">
              <a class="nav-link dropdown-toggle dropdown-toggle-nocaret" href="#" data-bs-toggle="dropdown">
                <div class="notifications">
                  <span class="notify-badge">8</span>
                  <i class="bi bi-bell-fill"></i>
                </div>
              </a>
              <div class="dropdown-menu dropdown-menu-end p-0">
                <div class="p-2 border-bottom m-2">
                    <h5 class="h5 mb-0">Notifications</h5>
                </div>
                <div class="header-notifications-list p-2">
                   <div class="dropdown-item bg-light radius-10 mb-1">
                    <form class="dropdown-searchbar position-relative">
                      <div class="position-absolute top-50 start-0 translate-middle-y px-3 search-icon"><i class="bi bi-search"></i></div>
                      <input class="form-control" type="search" placeholder="Search Messages">
                    </form>
                    </div>
                    <a class="dropdown-item" href="#">
                      <div class="d-flex align-items-center">
                         <div class="notification-box"><i class="bi bi-basket2-fill"></i></div>
                         <div class="ms-3 flex-grow-1">
                           <h6 class="mb-0 dropdown-msg-user">New Orders <span class="msg-time float-end text-secondary">1 m</span></h6>
                           <small class="mb-0 dropdown-msg-text text-secondary d-flex align-items-center">You have recived new orders</small>
                         </div>
                      </div>
                    </a>
                   <a class="dropdown-item" href="#">
                     <div class="d-flex align-items-center">
                      <div class="notification-box"><i class="bi bi-people-fill"></i></div>
                        <div class="ms-3 flex-grow-1">
                          <h6 class="mb-0 dropdown-msg-user">New Customers <span class="msg-time float-end text-secondary">7 m</span></h6>
                          <small class="mb-0 dropdown-msg-text text-secondary d-flex align-items-center">5 new user registered</small>
                        </div>
                     </div>
                   </a>

               </div>
               <div class="p-2">
                 <div><hr class="dropdown-divider"></div>
                   <a class="dropdown-item" href="#">
                     <div class="text-center">View All Notifications</div>
                   </a>
               </div>
              </div>
            </li>
            </ul>
            </div>
      </nav>
    </header>
     <!--end top header-->
     
      <!--start navigation-->
     <div class="nav-container">
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
      <nav class="topbar-nav">
        <ul class="metismenu" id="menu">
          <li>
            <a href="javascript:;" class="has-arrow">
              <div class="parent-icon"><i class="bi bi-house-door"></i>
              </div>
              <div class="menu-title">Produits</div>
            </a>
            <ul>
              <li> <a href="${productList }"><i class="bi bi-arrow-right-short"></i>liste des produits</a>
              </li>
			  <li> <a href="#"><i class="bi bi-arrow-right-short"></i>ajout produit</a>
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
              <li> <a href="#"><i class="bi bi-arrow-right-short"></i>Liste des commandes</a>
              </li>
              <li> <a href="#"><i class="bi bi-arrow-right-short"></i>Liste des utilisateurs</a>
              </li>
            </ul>
          </li>
          <li>
            <a href="javascript:;" class="has-arrow">
              <div class="parent-icon"><i class="bi bi-grid"></i>
              </div>
              <div class="menu-title">Equipe</div>
            </a>
          </li>
        </ul>
      </nav>
    </div>
    <!--end navigation-->  

