package controleur.frontend;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProduitD;
import dao.RechercheD;
import modele.ProduitM;
import modele.RechercheM;
import modele.UtilisateurM;

/**
 * Servlet implementation class ResultatsRechercheC
 */
@WebServlet("/resultatsRecherche")
public class ResultatsRechercheC extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResultatsRechercheC() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(true);

		//Enregistrement de la recherche
		String recherche = request.getParameter("requete");
		int userId = (int) session.getAttribute("userId");
		RechercheD rechercheD = new RechercheD();
		RechercheM rechercheM = new RechercheM(new UtilisateurM(userId),recherche);
		rechercheD.create(rechercheM);
		
		//Affichage résultats de la recherche
		String requete = request.getParameter("requete");
		//String[] mots = requete.split(" ");
		ProduitD produitD = new ProduitD();
		ArrayList<ProduitM> listeProduits = new ArrayList<>();
		//for (String mot : mots) {
			listeProduits = produitD.search(requete);
		//}
		request.setAttribute("listeProduits", listeProduits);

		request.getRequestDispatcher("vue/frontend/resultatsRecherche.jsp").forward(request, response);	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
