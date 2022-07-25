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

  <title>Catégories et sous-catégories</title>
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
                    <li class="breadcrumb-item active" aria-current="page">Categories</li>
                  </ol>
                </nav>
              </div>
            </div>
            <!--end breadcrumb-->

              <div class="card">
                <div class="card-header py-3">
                  <h6 class="mb-0">Ajouter une catégorie / sous-catégorie</h6>
                </div>
                <div class="card-body">
                   <div class="row">
                     <div class="col-12 col-lg-4 d-flex">
                       <div class="card border shadow-none w-100">
                         <div class="card-body">

                           <form class="row g-3" method="post" action="listecatadmin">
                             <div class="col-12">
                               <label class="form-label">Nom</label>
                               <input type="text" class="form-control" placeholder="Category name" name="inputName">
                             </div>
                             <div class="col-12">
                                <label class="form-label">Type</label>
                                <select class="form-select" name="inputType">
                                  <option value="1">categorie</option>
                                  <option value="2">sous-categorie</option>
                                </select> 
                              </div>
                            <div class="col-12">
                              <label class="form-label">Categorie parent</label>
                              <select class="form-select" name="inputCatParent">
                                <option selected>aucune</option>
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
                            </div>
                            <div class="col-12">
                              <div class="d-grid">
                                <button class="btn btn-primary">Add Category</button>
                              </div>
                            </div>
                           </form>
                         </div>
                       </div>
                     </div>
                      
                     <div class="col-12 col-lg-8 d-flex">
                      <div class="card border shadow-none w-100">
                        <div class="card-body">
                          <div class="table-responsive">
                             <table class="table align-middle">
                               <thead class="table-light">
                                 <tr>
                                   <th><input class="form-check-input" type="checkbox"></th>
                                   <th>Categorie</th>
                                   <th>Sous-categorie</th>
                                   <th>Action</th>
                                 </tr>
                               </thead>
                               <tbody>
                                  <c:forEach var="i" begin="0" end="${listeSousCategorie.size() }">
									<c:if test=" ${listeSousCategorie[i].id==Null }">
									</c:if>
									<c:if test="${listeSousCategorie[i].id!=Null }">	
										<tr>
		                                   <td><input class="form-check-input" type="checkbox"></td>
		                                   <td>${listeSousCategorie[i].idCategorie.titre }</td>
		                                   <td>${listeSousCategorie[i].titre }</td>
		                                   <td>
		                                    <div class="d-flex align-items-center gap-3 fs-6">
		                                      <a href="javascript:;" class="text-warning" data-bs-toggle="tooltip" data-bs-placement="bottom" title="" data-bs-original-title="Edit info" aria-label="Edit"><i class="bi bi-pencil-fill"></i></a>
		                                      <a href="listecatadmin?delete=${listeSousCategorie[i].id }" class="text-danger" data-bs-toggle="tooltip" data-bs-placement="bottom" title="" data-bs-original-title="Delete" aria-label="Delete"><i class="bi bi-trash-fill" name="delete"></i></a>
		                                    </div>
		                                   </td>
		                                 </tr>																	
									</c:if>
								</c:forEach>
                               </tbody>
                             </table>
                          </div>
                          <nav class="float-end mt-0" aria-label="Page navigation">
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
                    </div>
                   </div><!--end row-->
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
 