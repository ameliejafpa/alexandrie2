package controleur.backend;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CategorieD;
import dao.ProduitD;
import dao.SousCategorieD;
import modele.CategorieM;
import modele.ProduitM;
import modele.SousCategorieM;

/**
 * Servlet implementation class ProductList
 */
@WebServlet("/productlistadmin")
public class ProductList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CategorieD categorieD = new CategorieD();
	SousCategorieD sousCategorieD = new SousCategorieD();
	ProduitD produitD = new ProduitD();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductList() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("deleteProduit") != null) {
			produitD.delete(Integer.valueOf(request.getParameter("deleteProduit")));
		}

		ArrayList<CategorieM> categorieM = new ArrayList<CategorieM>();
		categorieM = categorieD.read();
		request.setAttribute("listeCategorie", categorieM);

		ArrayList<SousCategorieM> sousCategorieM = new ArrayList<SousCategorieM>();
		sousCategorieM = sousCategorieD.read();
		request.setAttribute("listeSousCategorie", sousCategorieM);

		ArrayList<ProduitM> produitM = new ArrayList<ProduitM>();

		// update
		if (request.getParameter("updateProduit") != null) {
			request.setAttribute("showProduit",
					produitD.findById(Integer.valueOf(request.getParameter("updateProduit"))));
		}

		// affichages produits d'une sous categorie
		if (request.getParameter("sortSousCategorie") != null) {
			produitM = produitD.readBySubCategory(Integer.valueOf(request.getParameter("sortSousCategorie")));
			request.setAttribute("listeProduits", produitM);
		}
		// affichage produits cat�gorie
		else if (request.getParameter("sortCategorie") != null) {
			produitM = produitD.readByCategory(Integer.valueOf(request.getParameter("sortCategorie")));
			request.setAttribute("listeProduits", produitM);
		}
		// affichage tous les produits
		else {
			produitM = produitD.read();
			request.setAttribute("listeProduits", produitM);
		}

		// verif connexion : si pas connect�, redirection automatique vers la page de
		// connexion
		HttpSession session = request.getSession(true);
		if (session.getAttribute("isConnected") == null || (boolean) session.getAttribute("isConnected") == false) {
			System.out.println("is false");
			response.sendRedirect("connectionadmin");
		} else {
			System.out.println(session.getAttribute("isConnected"));
			request.getRequestDispatcher("/vue/backend/ProductList.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// ajout
		produitD.create(new ProduitM(request.getParameter("intputTitre"), request.getParameter("inputDescr"),
				Float.valueOf(request.getParameter("inputPrix")),
				"vue/img/produit/" + request.getParameter("inputImage"),
				new SousCategorieM(Integer.valueOf(request.getParameter("inputSousCat"))),
				Integer.valueOf(request.getParameter("inputStock")),
				Integer.valueOf(request.getParameter("inputStockMin"))));

		doGet(request, response);
	}

}
