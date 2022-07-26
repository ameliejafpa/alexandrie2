package controleur.frontend;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ImageD;
import dao.ProduitD;
import modele.ImageM;
import modele.ProduitM;
import modele.SousCategorieM;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ProduitD produitD = new ProduitD();
		int idProduit = Integer.parseInt(request.getParameter("id"));
		ProduitM produit = new ProduitM();
		produit = produitD.findById(idProduit);
		request.setAttribute("produit", produit);
		
		ImageD imageD = new ImageD();
		ArrayList<ImageM> listeImages = new ArrayList<>();
		listeImages = imageD.findByIdProduct(idProduit);
		
		
		SousCategorieM sousCategorie = new SousCategorieM();
		sousCategorieD sousCategorieD = new sousCategorieD();
		sousCategorie = produitD.getSubCategory(idProduit);
		ArrayList<ProduitM> listeProduits = new ArrayList<>();
		listeProduits = sousCategorieD.findById(sousCategorie);
		request.setAttribute("listeImages", listeImages);
		
		request.getRequestDispatcher("vue/frontend/produit.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
