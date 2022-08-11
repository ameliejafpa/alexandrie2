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

  <title>Equipe</title>
</head>

<body>


<div class="card">
<div class="card-header py-3">
	<h6 class="mb-0">Ajouter une catégorie / sous-catégorie</h6>
</div>
<div class="card-body">
<div class="row"> 

<!-- formulaire ajout -->  
<div class="col-12 col-lg-4 d-flex">
<div class="card border shadow-none w-100">
    <div class="card-body">
      <form class="row g-3" method="post" action="teamadmin">
        <div class="col-12">
          <label class="form-label">Nom</label>
          <input type="text" class="form-control" placeholder="nom" name="inputName" value="${showAdmin.nom }">
        </div>
        <div class="col-12">
          <label class="form-label">Email</label>
          <input type="text" class="form-control" placeholder="email" name="inputEmail" value="${showAdmin.email }" >
        </div>
        <div class="col-12">
          <label class="form-label">Privilege</label>
          <input type="text" class="form-control" placeholder="privilege" name="inputPrivilege" value="${showAdmin.privilege }">
        </div>
       <div class="col-12">
         <div class="d-grid">
           <button class="btn btn-primary" name="inputId" value="${showAdmin.id }">Ajouter / editer le membre</button>
         </div>
       </div>
      </form>                        
    </div>
  </div>
</div> <!-- fin formulaire -->
        
<!-- liste utilisateurs -->
<div class="col-12 col-lg-8 d-flex">
    <div class="card border shadow-none w-100">
      <div class="card-body">
        <div class="table-responsive">
           <table class="table align-middle">
             <thead class="table-light">
               <tr>
                 <th>id</th>
                 <th>nom</th>
                 <th>email</th>
                 <th>privilege</th>
                 <th>Action</th>
               </tr>
             </thead>
             <tbody>
             
<c:forEach items="${listeAdmin}" var ="admin">
  <tr>
      <td>${admin.id }</td>
      <td>${admin.nom }</td>
      <td>${admin.email }</td>
      <td>${admin.privilege }</td>
      <td>
          <div class="d-flex align-items-center gap-3 fs-6">
              <a href="teamadmin?updateAdmin=${admin.id }" class="text-warning" data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-original-title="Edit info" aria-label="Edit" name="updateAdmin"><i class="bi bi-pencil-fill"></i></a>
              <!-- declencheur modal suppression -->
              <a class="text-danger" data-bs-placement="bottom" data-bs-toggle="modal" data-bs-target="#deleteAdminModal${admin.id }"  data-bs-original-title="Delete" aria-label="Delete"><i class="bi bi-trash-fill"></i></a>
          </div>
      </td>
  </tr>	
  <!-- modal suppression catégorie-->
  <div class="modal fade" id="deleteAdminModal${admin.id }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
          <div class="modal-content">
              <div class="modal-body">Voulez-vous confirmer la suppression de ${admin.nom } ?</div>
              <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                  <a href="teamadmin?deleteAdmin=${admin.id }"><button type="button" class="btn btn-primary" name="deleteAdmin">Confirmer</button></a>
              </div>
          </div>
      </div>
  </div>	        
</c:forEach> <!-- fin liste categories-->
       </tbody>
   </table>
</div>
            
          </div>
        </div>
      </div>
     </div><!--end row-->
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
  <!--app-->
  <script src="vue/backend/assets/js/app.js"></script>
  
</body>
</html>
 