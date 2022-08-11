<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" class="light-theme">
<head>

  <title>Accueil</title>

</head>
<body>

<jsp:include page="/header"/>

   <!--start content-->
     <main class="page-content"> 
        <div class="row">
          <div class="col col-lg-9 mx-auto">
            <h6 class="mb-0 text-uppercase">Alerte stock insuffisant</h6>
            <hr/>
            
            <c:forEach items="${alerteProduit }" var="produit" >
            <div class="card bg-danger">
							<div class="card-body">
                <ul class="list-group list-group-flush">
									<li class="list-group-item bg-transparent text-white">
									<a href="productdetailadmin?id=${produit.id }&action=show" style="color:white;">
									<i class="bi bi bi-exclamation-triangle-fill font-18 align-middle me-2"></i>
									id: ${produit.id} - ${produit.titre}</a>
									</li>
									<li class="list-group-item bg-transparent text-white"><i class="bi bi bi-exclamation-triangle-fill font-18 align-middle me-2"></i>
									Il reste ${produit.stock} produits pour un stock minimum de ${produit.stockMinimum}</li>
								</ul>
							</div>
						</div>
            </c:forEach>

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
  <script src="assets/js/bootstrap.bundle.min.js"></script>
  <!--plugins-->
  <script src="assets/js/jquery.min.js"></script>
  <script src="assets/plugins/simplebar/js/simplebar.min.js"></script>
  <script src="assets/plugins/metismenu/js/metisMenu.min.js"></script>
  <script src="assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
  <!--app-->
  <script src="assets/js/app.js"></script>
  <script src="assets/js/pace.min.js"></script>
  

</body>

</html>
       
 <c:import url="Footer.jsp"></c:import>   