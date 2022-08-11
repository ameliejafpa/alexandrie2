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

  <title>Detail de la commandes</title>
  
</head>

<body>

 <!--start wrapper-->
  <div class="wrapper">

       <!--start content-->
          <main class="page-content">

              <div class="card">
                <div class="card-header py-3"> 
                  <div class="row g-3 align-items-center">
                    <div class="col-12 col-lg-4 col-md-6 me-auto">
                      <h5 class="mb-1">${commande.dateC }</h5>
                      <p class="mb-0">ID commande : ${commande.id }</p>
                    </div>
                    <form method="post">
                    <div class="col-12 col-lg-3 col-6 col-md-3">
                      <select class="form-select" name="inputStatus">
                        	<c:if test="${commande.etat==0}">
                        		<option selected value=${commande.etat }>À valider</option>
                        		<option value=1>En cours de livraison</option>
                        	</c:if>
                        	<c:if test="${commande.etat==1}">
                        		<option selected value=${commande.etat }>En cours de livraison</option>
                        		<option value=2>Livrée!</option>
                        	</c:if>
                        	<c:if test="${commande.etat==2}">
                        		<option selected value=${commande.etat }>Livrée!</option>
                        	</c:if>
                      </select>
                    </div>
                    <div class="col-12 col-lg-3 col-6 col-md-3">
                       <button type="submit" class="btn btn-primary">maj statut</button>
                    </div>
                    </form>
                  </div>
                 </div>
                <div class="card-body">
                    <div class="row row-cols-1 row-cols-xl-2 row-cols-xxl-3">
                       <div class="col">
                         <div class="card border shadow-none radius-10">
                           <div class="card-body">
                            <div class="d-flex align-items-center gap-3">
                              <div class="icon-box bg-light-primary border-0">
                                <i class="bi bi-person text-primary"></i>
                              </div>
                              <div class="info">
                                 <h6 class="mb-2">Client</h6>
                                 <p class="mb-1">${commande.idUtilisateur.prenom} ${commande.idUtilisateur.nom}</p>
                                 <p class="mb-1">${commande.idUtilisateur.email}</p>
                              </div>
                           </div>
                           </div>
                         </div>
                       </div>
                      <div class="col">
                        <div class="card border shadow-none radius-10">
                          <div class="card-body">
                            <div class="d-flex align-items-center gap-3">
                              <div class="icon-box bg-light-danger border-0">
                                <i class="bi bi-geo-alt text-danger"></i>
                              </div>
                              <div class="info">
                                <h6 class="mb-2">Adresse de livraison</h6>
                                <p class="mb-1"> ${commande.idAdresse.adresse} <br>
                                <strong>${commande.idAdresse.codePostal} ${commande.idAdresse.ville} - ${commande.idAdresse.pays}</strong></p>
                              </div>
                            </div>
                          </div>
                         </div>
                    </div>
                      <div class="col">
                        <div class="card border shadow-none bg-light radius-10">
                          <div class="card-body">
                              <div class="d-flex align-items-center mb-4">
                                 <div>
                                    <h5 class="mb-0">Total de la commande</h5>
                                 </div>
                                 <div class="ms-auto">
                                    <h5 class="mb-0">${commande.total} EUR</h5>
                                </div>
                              </div>
                          </div>
                        </div>
                     </div>
                    
                    
                  </div><!--end row-->

                  <div class="row">
                      <div class="col">
                         <div class="card border shadow-none radius-10">
                           <div class="card-body">
                               <div class="table-responsive">
                                 <table class="table align-middle mb-0">
                                   <thead class="table-light">
                                     <tr>
                                       <th>Produit</th>
                                       <th>Prix unitaire</th>
                                       <th>Quantité</th>
                                       <th>Total</th>
                                     </tr>
                                   </thead>
                                   <tbody>
                                   
                                   <c:forEach items="${listeDetail }" var="detail">
                                     <tr>
                                       <td>
                                         <div class="orderlist">
                                          <a class="d-flex align-items-center gap-2" href="javascript:;">
                                            <div>
                                                <P class="mb-0 product-title">${detail.idProduit.id }</P>
                                            </div>
                                            <div class="product-box">
                                                <img src="${detail.idProduit.image }" alt="">
                                            </div>
                                            <div>
                                                <P class="mb-0 product-title">${detail.idProduit.titre }</P>
                                            </div>
                                           </a>
                                         </div>
                                       </td>
                                       <td>${detail.idProduit.prix } EUR</td>
                                       <td>${detail.quantite }</td>
                                       <td>${detail.prix } EUR</td>
                                     </tr>             
                                   </c:forEach>


                                   </tbody>
                                 </table>
                               </div>
                           </div>
                         </div>
                      </div>

                  </div><!--end row-->

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