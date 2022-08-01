package controleur.frontend;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategorieD;
import dao.ProduitD;
import dao.SousCategorieD;
import modele.CategorieM;
import modele.ProduitM;
import modele.SousCategorieM;

/**
 * Servlet implementation class ListeProduitsC
 */
@WebServlet("/listeProduits")
public class ListeProduitsC extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListeProduitsC() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ProduitD produitD = new ProduitD();
		int total = produitD.totalParCategorie();
		request.setAttribute("total", total);
		
		ArrayList<ProduitM> listeProduits = new ArrayList<>();
		if (request.getParameter("idCategorie") != null) {
			int idCategorie = Integer.parseInt(request.getParameter("idCategorie"));
			listeProduits = produitD.readByCategory(idCategorie);
			
			//affichage titre catégorie
			CategorieD categorieD = new CategorieD();
			CategorieM categorie = categorieD.findById(idCategorie);
			request.setAttribute("categorie", categorie);

		} else if (request.getParameter("idSousCategorie") != null) {
			int idSousCategorie = Integer.parseInt(request.getParameter("idSousCategorie"));
			listeProduits = produitD.readBySubCategory(idSousCategorie);
			
			//affichage titre sous catégorie
			SousCategorieD sousCategorieD = new SousCategorieD();
			SousCategorieM sousCategorie = sousCategorieD.findById(idSousCategorie);
			request.setAttribute("sousCategorie", sousCategorie);
		} else {
			listeProduits = produitD.read();
		}
		
		
		request.setAttribute("listeProduits", listeProduits);
		
		CategorieD categorieD = new CategorieD();
		ArrayList<CategorieM> listeCategories = new ArrayList<>();
		listeCategories = categorieD.read();
		request.setAttribute("listeCategories", listeCategories);
		
		request.getRequestDispatcher("vue/frontend/listeProduits.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
