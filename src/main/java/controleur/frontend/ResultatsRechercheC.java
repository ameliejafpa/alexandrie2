package controleur.frontend;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProduitD;
import modele.ProduitM;

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
		String requete = request.getParameter("requete");
		ProduitD produitD = new ProduitD();
		ArrayList<ProduitM> listeProduits = new ArrayList<>();
		listeProduits = produitD.search(requete);
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
