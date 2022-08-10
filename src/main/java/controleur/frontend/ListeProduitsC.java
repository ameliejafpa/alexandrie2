package controleur.frontend;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CategorieD;
import dao.FavoriD;
import dao.ProduitD;
import dao.SousCategorieD;
import modele.CategorieM;
import modele.FavoriM;
import modele.PanierDetailsM;
import modele.PanierM;
import modele.ProduitM;
import modele.SousCategorieM;
import modele.UtilisateurM;

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
		
		if (request.getParameter("idProduit") != null) {
			ProduitM produit = new ProduitM();
			int idProduit = Integer.parseInt(request.getParameter("idProduit"));
			HttpSession session = request.getSession(true);
			int userId = (int) session.getAttribute("userId");
			//ajout au panier
			if (request.getParameter("action").equalsIgnoreCase("addToCart")) {
				int quantite = 1;
				produit = produitD.findById(idProduit);
				PanierDetailsM panierAdd = new PanierDetailsM(produit, quantite);
				PanierM panier = (PanierM) session.getAttribute("panier");
				panier.add(panierAdd);
				session.setAttribute("panier", panier);

			}
			//déjà favori ?
			FavoriD favoriD= new FavoriD();
			boolean dejaFavori = false;
			if (dejaFavori == favoriD.isFavori(idProduit, userId)) {
				request.setAttribute("dejaFavori", dejaFavori);
			}
			//ajout aux favoris
			if (request.getParameter("action").equalsIgnoreCase("addWhishlist")) {
				UtilisateurM utilisateur = new UtilisateurM();
				utilisateur.setId(userId);
				produit.setId(idProduit);
				favoriD.create(new FavoriM(produit,utilisateur));
			}
		}
		
		
		request.setAttribute("listeProduits", listeProduits);
		
		CategorieD categorieD = new CategorieD();
		ArrayList<CategorieM> listeCategories = new ArrayList<>();
		listeCategories = categorieD.read();
		request.setAttribute("listeCategories", listeCategories);
		
//		ProduitD produitD = new ProduitD();
//		int total = produitD.totalParCategorie(id);
//		request.setAttribute("total", total);
		
		
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
