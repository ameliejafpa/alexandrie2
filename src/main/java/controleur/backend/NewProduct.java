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
import modele.ProduitM;
import modele.SousCategorieM;

/**
 * Servlet implementation class NewProduct
 */
@WebServlet("/newproductadmin")
public class NewProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CategorieD categorieD = new CategorieD();
	SousCategorieD sousCategorieD = new SousCategorieD();
	ProduitD produitD = new ProduitD();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NewProduct() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ArrayList<SousCategorieM> sousCategorieM = new ArrayList<SousCategorieM>();
		sousCategorieM = sousCategorieD.read();
		request.setAttribute("listeSousCategorie", sousCategorieM);

		
		// verif connexion : si pas connect�, redirection automatique vers la page de
		// connexion
		HttpSession session = request.getSession(true);
		if (session.getAttribute("isConnected") == null || (boolean) session.getAttribute("isConnected") == false) {
			System.out.println("is false");
			response.sendRedirect("connectionadmin");
		} else {
			System.out.println(session.getAttribute("isConnected"));
			request.getRequestDispatcher("/vue/backend/NewProduct.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("btnAjout") != null) {
			System.out.println("envoi formulaire");
			produitD.create(new ProduitM(request.getParameter("intputTitre"), request.getParameter("inputDescr"),
					Float.valueOf(request.getParameter("inputPrix")),
					"vue/img/produit/" + request.getParameter("inputImage"),
					new SousCategorieM(Integer.valueOf(request.getParameter("inputSousCat"))), 0, 0));
			response.sendRedirect(request.getContextPath() + "/productlistadmin");
		} else {
			doGet(request, response);
		}
	}

}