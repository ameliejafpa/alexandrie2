package controleur.frontend;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CategorieD;
import dao.CoordonneeD;
import dao.RechercheD;
import dao.SousCategorieD;
import modele.CategorieM;
import modele.CoordonneeM;
import modele.PanierDetailsM;
import modele.PanierM;
import modele.RechercheM;
import modele.SousCategorieM;
import modele.UtilisateurM;

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
		//création session user invité
		HttpSession session = request.getSession(true);
		if (session.getAttribute("isConnected") == null) {
			session.setAttribute("userId", 1);
			session.setAttribute("userPrenom", "invité");
			session.setAttribute("userNom", "invité");
			session.setAttribute("isConnected", false);
		}
		//création session panier
		if ((PanierM)session.getAttribute("panier") == null) {
			PanierM panierTemporaire = new PanierM();
			session.setAttribute("panier", panierTemporaire);
		}
		
		//affichage catégories
		CategorieD categorieD = new CategorieD();
		ArrayList<CategorieM> listeCategories = new ArrayList<>();
		listeCategories = categorieD.read();
		request.setAttribute("listeCategories", listeCategories);
		
		//affichage sous catégories
		SousCategorieD sousCategorieD = new SousCategorieD();
		ArrayList<SousCategorieM> listeSousCategories = new ArrayList<>();
		listeSousCategories = sousCategorieD.read();
		request.setAttribute("listeSousCategories", listeSousCategories);
		
		//affichage coordeonnées
		ArrayList<CoordonneeM> listeCoordonnees = new ArrayList<>();
		CoordonneeD coordonneeD = new CoordonneeD();
		listeCoordonnees = coordonneeD.read();
		request.setAttribute("listeCoordonnees", listeCoordonnees);	
		
		//création recherche
		if (request.getParameter("btnRecherche") != null) {
			String recherche = request.getParameter("requete");
			int userId = (int) session.getAttribute("userId");
			RechercheD rechercheD = new RechercheD();
			RechercheM rechercheM = new RechercheM(new UtilisateurM(userId),recherche);
			//request.setAttribute("requete", rechercheD.create(rechercheM));
			rechercheD.create(rechercheM);
			response.sendRedirect(request.getContextPath() + "/resultatsRecherche");
		}
		
		//affichage mini panier
		PanierM panier = (PanierM) session.getAttribute("panier");
		ArrayList<PanierDetailsM> panierDetails = panier.articles;
		request.setAttribute("panierDetails", panierDetails);
		
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
