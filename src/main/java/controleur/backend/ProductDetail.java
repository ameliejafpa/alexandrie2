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
import dao.CommentaireD;
import dao.EntreeEnStockD;
import dao.FournisseurD;
import dao.ImageD;
import dao.ProduitD;
import dao.SousCategorieD;
import modele.CommentaireM;
import modele.EntreeEnStockM;
import modele.FournisseurM;
import modele.ImageM;
import modele.ProduitM;
import modele.SousCategorieM;

/**
 * Servlet implementation class ProductDetail
 */
@WebServlet("/productdetailadmin")
public class ProductDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CategorieD categorieD = new CategorieD();
	SousCategorieD sousCategorieD = new SousCategorieD();
	ProduitD produitD = new ProduitD();
	int idProduit;
	ProduitM produit = new ProduitM();
	ImageD imageD = new ImageD();
	FournisseurD fournisseurD = new FournisseurD();
	EntreeEnStockD entreeEnStockD = new EntreeEnStockD();
	CommentaireD commentaireD = new CommentaireD();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductDetail() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//suppression d'un commentaire
		if (request.getParameter("deleteComment") != null) {
			commentaireD.delete(Integer.valueOf(request.getParameter("idComment")));
		}
		
		// afichage du produit
		ProduitD produitD = new ProduitD();
		idProduit = Integer.parseInt(request.getParameter("id"));
		produit = produitD.findById(idProduit);
		request.setAttribute("produit", produit);

		ArrayList<SousCategorieM> sousCategorieM = new ArrayList<SousCategorieM>();
		sousCategorieM = sousCategorieD.read();
		request.setAttribute("listeSousCategorie", sousCategorieM);

		// affichage des images du produit
		ArrayList<ImageM> listeImages = new ArrayList<>();
		listeImages = imageD.findByIdProduct(idProduit);
		request.setAttribute("listeImages", listeImages);

		// liste fournisseurs
		ArrayList<FournisseurM> listeFournisseurs = new ArrayList<>();
		listeFournisseurs = fournisseurD.read();
		request.setAttribute("listeFournisseurs", listeFournisseurs);

		// liste commentaires
		ArrayList<CommentaireM> listeCommentaires = new ArrayList<>();
		listeCommentaires = commentaireD.findByIdProduct(idProduit);
		request.setAttribute("listeCommentaires", listeCommentaires);

		
		// verif connexion : si pas connect�, redirection automatique vers la page de
		// connexion
		HttpSession session = request.getSession(true);
		if (session.getAttribute("isConnected") == null || (boolean) session.getAttribute("isConnected") == false) {
			System.out.println("is false");
			response.sendRedirect("connectionadmin");
		} else {
			System.out.println(session.getAttribute("isConnected"));
			request.getRequestDispatcher("/vue/backend/ProductDetail.jsp").forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// update stock
		if (request.getParameter("btnUpdateStock") != null) {
			System.out.println("date: " + request.getParameter("inputDate"));
			System.out.println("fournisseur: " + request.getParameter("inputFournisseur"));
			FournisseurM fM = new FournisseurM();
			fM.setId(Integer.parseInt(request.getParameter("inputFournisseur")));

			entreeEnStockD.create(new EntreeEnStockM(fM, produit, request.getParameter("inputDate"),
					Integer.parseInt(request.getParameter("inputStock"))));
			int newStock = produit.getStock() + Integer.parseInt(request.getParameter("inputStock"));
			System.out.println(newStock);
			produitD.updateStock(newStock, idProduit);
		}

		if (request.getParameter("btnUpdateProduit") != null) {
			ProduitM produitUp = new ProduitM();
			produitUp.setTitre(request.getParameter("intputTitre"));
			produitUp.setDescription(request.getParameter("inputDescr"));
			produitUp.setPrix(Float.valueOf(request.getParameter("inputPrix")));
			produitUp.setStockMinimum(Integer.valueOf(request.getParameter("inputStockMin")));
			produitUp.setIdSousCategorie(new SousCategorieM(Integer.valueOf(request.getParameter("inputSousCat"))));
			if (request.getParameter("inputImage1").isEmpty() == true) {
				produitUp.setImage(produit.getImage());

			} else {
				produitUp.setImage("vue/img/produit/" + request.getParameter("inputImage1"));
			}
			produitD.update(produitUp, idProduit); // update images

		}
		
		// if (request.getParameter("inputImage2") != null) {
		// imageD.update(null, idProduit);
		// produitUp.setImage("vue/img/produit/" + request.getParameter("inputImage"));
		// }

		doGet(request, response);
	}

}
