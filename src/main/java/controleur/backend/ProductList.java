package controleur.backend;

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
 * Servlet implementation class ProductList
 */
@WebServlet("/productlistadmin")
public class ProductList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//CategorieD categorieD = new CategorieD();
	CategorieD categorieD = new CategorieD();	
	SousCategorieD sousCategorieD = new SousCategorieD();
	ProduitD produitD = new ProduitD();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		if(request.getParameter("delete")!=null ) {
			sousCategorieD.delete(Integer.valueOf(request.getParameter("delete")));
		}
		 */
		ArrayList<CategorieM> categorieM = new ArrayList<CategorieM>();
		categorieM=categorieD.read();
		request.setAttribute("listeCategorie", categorieM);
		
		ArrayList<SousCategorieM> sousCategorieM = new ArrayList<SousCategorieM>();
		sousCategorieM=sousCategorieD.read();
		request.setAttribute("listeSousCategorie", sousCategorieM);
		
		ArrayList<ProduitM> produitM = new ArrayList<ProduitM>();
		produitM=produitD.read();
		request.setAttribute("listeProduits", produitM);
				
		request.getRequestDispatcher("/vue/backend/ProductList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
