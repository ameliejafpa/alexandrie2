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
import dao.SousCategorieD;
import modele.CategorieM;
import modele.PanierM;
import modele.SousCategorieM;

/**
 * Servlet implementation class HeaderC
 */
@WebServlet("/headerC")
public class HeaderC extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HeaderC() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(true);
		if (session.getAttribute("isConnected") == null) {
			session.setAttribute("userId", 1);
			session.setAttribute("userPrenom", "invité");
			session.setAttribute("userNom", "invité");
			session.setAttribute("isConnected", false);
		}
		
		if ((PanierM)session.getAttribute("panier") == null) {
			PanierM panierTemporaire = new PanierM();
			session.setAttribute("panier", panierTemporaire);
		}
		
		
		CategorieD categorieD = new CategorieD();
		ArrayList<CategorieM> listeCategories = new ArrayList<>();
		listeCategories = categorieD.read();
		request.setAttribute("listeCategories", listeCategories);
		
		
		SousCategorieD sousCategorieD = new SousCategorieD();
		ArrayList<SousCategorieM> listeSousCategories = new ArrayList<>();
		listeSousCategories = sousCategorieD.read();
		request.setAttribute("listeSousCategories", listeSousCategories);
		
		request.getRequestDispatcher("vue/frontend/header.jsp").include(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
