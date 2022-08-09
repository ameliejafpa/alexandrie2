package controleur.frontend;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommentaireD;
import dao.FavoriD;
import dao.ImageD;
import dao.ProduitD;
import dao.UtilisateurD;
import dao.VisiteD;
import modele.CommentaireM;
import modele.FavoriM;
import modele.ImageM;
import modele.PanierDetailsM;
import modele.PanierM;
import modele.ProduitM;
import modele.UtilisateurM;
import modele.VisiteM;

/**
 * Servlet implementation class ProduitC
 */
@WebServlet("/produit")
public class ProduitC extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProduitC() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// afichage du produit
		ProduitD produitD = new ProduitD();
		int idProduit = Integer.parseInt(request.getParameter("id"));
		ProduitM produit = new ProduitM();
		produit = produitD.findById(idProduit);
		request.setAttribute("produit", produit);

		// affichage des images du produit
		ImageD imageD = new ImageD();
		ArrayList<ImageM> listeImages = new ArrayList<>();
		listeImages = imageD.findByIdProduct(idProduit);
		request.setAttribute("listeImages", listeImages);

		// affichage des produits en relation
		int idSousCategorie = produit.getIdSousCategorie().getId();
		ArrayList<ProduitM> listeProduits = new ArrayList<>();
		listeProduits = produitD.readBySubCategory(idSousCategorie);
		listeProduits.removeIf(prod -> prod.getId() == idProduit);
		request.setAttribute("listeProduits", listeProduits);

		// insertion visite
		HttpSession session = request.getSession(true);
		int userId = (int) session.getAttribute("userId");
		produit.setId(idProduit);
		UtilisateurM utilisateur = new UtilisateurM();
		utilisateur.setId(userId);
		VisiteM visiteM = new VisiteM();
		visiteM.setIdProduit(produit);
		visiteM.setIdUtilisateur(utilisateur);
		VisiteD visiteD = new VisiteD();
		visiteD.create(visiteM);

		
		//déjà favori ?
		FavoriD favoriD= new FavoriD();
		boolean dejaFavori = false;
		if (dejaFavori == favoriD.isFavori(idProduit, userId)) {
			request.setAttribute("dejaFavori", dejaFavori);
		}
		
		//ajout favori
		if (request.getParameter("btnFavori") != null) {
			favoriD.create(new FavoriM(produit,utilisateur));
		}

		// ajout commentaire
		if (request.getParameter("btnCommentaire") != null) {
			String commentaire = request.getParameter("commentaire");
			int note = Integer.valueOf(request.getParameter("note"));
			request.setAttribute("listeProduits", produitD.read());
			UtilisateurD utilisateurD = new UtilisateurD();
			request.setAttribute("listeUtilisateurs", utilisateurD.read());
			CommentaireD comentaireD = new CommentaireD();
			comentaireD.create(new CommentaireM(commentaire, note, produit, utilisateur));
		}

		// affichage des commentaires
		CommentaireD commentaireD = new CommentaireD();
		ArrayList<CommentaireM> listeCommentaires = new ArrayList<>();
		listeCommentaires = commentaireD.findByIdProduct(idProduit);
		request.setAttribute("listeCommentaires", listeCommentaires);

		
		//affichage note moyenne
		double noteMoyenne = 0;
		
		int nbrCommentaires = commentaireD.nbreComments(idProduit);
		System.out.println(nbrCommentaires);
		noteMoyenne = commentaireD.noteMoyenne(idProduit);
		request.setAttribute("noteMoyenne", noteMoyenne);
		request.setAttribute("nbrCommentaires", nbrCommentaires);
		
		//récupération du stock
		int nbrEnStock = produitD.nbrInStock(idProduit);
		session.setAttribute("nbrEnStock", nbrEnStock);
		
		//ajout panier
		if (request.getParameter("btnPanierAdd") != null) {
			int quantite = Integer.valueOf(request.getParameter("panierQuantite"));
			PanierDetailsM panierAdd = new PanierDetailsM(produit, quantite);
			PanierM panier = (PanierM) session.getAttribute("panier");
			panier.add(panierAdd);
			session.setAttribute("panier", panier);
		}
		

		request.getRequestDispatcher("vue/frontend/produit.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
