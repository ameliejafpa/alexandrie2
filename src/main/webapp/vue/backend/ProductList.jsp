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


  <!--start wrapper-->
  <div class="wrapper">

    <!--start content-->
     <main class="page-content"> 
           <!--breadcrumb-->
            <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
              <div class="breadcrumb-title pe-3">eCommerce</div>
              <div class="ps-3">
                <nav aria-label="breadcrumb">
                  <ol class="breadcrumb mb-0 p-0">
                    <li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">Products List</li>
                  </ol>
                </nav>
              </div>
              <div class="ms-auto">
                <div class="btn-group">
                  <button type="button" class="btn btn-primary">Settings</button>
                  <button type="button" class="btn btn-primary split-bg-primary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown">	<span class="visually-hidden">Toggle Dropdown</span>
                  </button>
                  <div class="dropdown-menu dropdown-menu-right dropdown-menu-lg-end">	<a class="dropdown-item" href="javascript:;">Action</a>
                    <a class="dropdown-item" href="javascript:;">Another action</a>
                    <a class="dropdown-item" href="javascript:;">Something else here</a>
                    <div class="dropdown-divider"></div>	<a class="dropdown-item" href="javascript:;">Separated link</a>
                  </div>
                </div>
              </div>
            </div>
            <!--end breadcrumb-->

              <div class="card">
                <div class="card-header py-3">
                  <div class="row align-items-center m-0">
                    <div class="col-md-3 col-12 me-auto mb-md-0 mb-3">
                        <select class="form-select">
                            <option selected value=0>Toutes les catégories</option>
                            <c:forEach var="i" begin="0" end="${listeCategorie.size() }">
								<c:if test=" ${listeCategorie[i].id==Null }">
								</c:if>
								<c:if test="${listeCategorie[i].id!=Null }">
									<option 
									value="${listeCategorie[i].id }">
									${listeCategorie[i].titre }</option>
								</c:if>
							</c:forEach>
                        </select>
                    </div>>
                 </div>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table align-middle table-striped">
                      <thead class="table-light">
                        <tr>			
                          <th></th>
                          <th>Id</th>
                          <th>Produit</th>
                          <th>Prix</th>
                          <th>Stock</th>
                          <th>Sous-categorie</th>
                          <th>Categorie</th>
                          <th>Action</th>
                        </tr>
                      </thead>                    
                      <tbody>
                       <c:forEach var="i" begin="0" end="${listeProduits.size() }">
									<c:if test=" ${listeProduits[i].id==Null }">
									</c:if>
									<c:if test="${listeProduits[i].id!=Null }">	
				                        <tr>
				                          <td>
				                            <div class="form-check">
				                              <input class="form-check-input" type="checkbox">
				                            </div>
				                          </td>
				                          <td><span>${listeProduits[i].id }</span></td>
				                          <td class="productlist">
				                            <a class="d-flex align-items-center gap-2" href="#">
				                              <div class="product-box">
				                                  <img src="${listeProduits[i].image }" alt=""  width="40" height="50">
				                              </div>
				                              <div>
				                                  <h6 class="mb-0 product-title">${listeProduits[i].titre }</h6>
				                              </div>
				                             </a>
				                          </td>
				                          <td><span>${listeProduits[i].prix } EUR</span></td>
				                          <td><span>${listeProduits[i].stock }</span></td>
				                          <td><span>${listeProduits[i].idSousCategorie.titre }</span></td>
				                          <td><span>${listeProduits[i].idSousCategorie.idCategorie.titre }</span></td>
				                          <td>
				                            <div class="d-flex align-items-center gap-3 fs-6">
				                              <a href="javascript:;" class="text-primary" data-bs-toggle="tooltip" data-bs-placement="bottom" title="" data-bs-original-title="View detail" aria-label="Views"><i class="bi bi-eye-fill"></i></a>
				                              <a href="javascript:;" class="text-warning" data-bs-toggle="tooltip" data-bs-placement="bottom" title="" data-bs-original-title="Edit info" aria-label="Edit"><i class="bi bi-pencil-fill"></i></a>
				                              <a href="javascript:;" class="text-danger" data-bs-toggle="tooltip" data-bs-placement="bottom" title="" data-bs-original-title="Delete" aria-label="Delete"><i class="bi bi-trash-fill"></i></a>
				                            </div>
				                          </td>
				                        </tr>								
									</c:if>
								</c:forEach>
                        </tbody>
                    </table>
                  </div>

            <nav class="float-end mt-4" aria-label="Page navigation">
              <ul class="pagination">
                <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
              </ul>
            </nav>

  </div>
</div>

 </main>
       <!--end page main-->


       <!--start overlay-->
        <div class="overlay nav-toggle-icon"></div>
       <!--end overlay-->

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
 
