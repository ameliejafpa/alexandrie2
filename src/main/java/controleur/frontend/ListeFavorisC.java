package controleur.frontend;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FavoriD;
import dao.ProduitD;
import dao.UtilisateurD;

/**
 * Servlet implementation class FavoriC
 */
@WebServlet("/listeFavoris")
public class ListeFavorisC extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListeFavorisC() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		FavoriD favoriD = new FavoriD();
//		ArrayList<ProduitM> listeFavoris = new ArrayList<>();
//		listeFavoris = favoriD.read();
		request.setAttribute("listeFavoris", favoriD.read());
		ProduitD produitD = new ProduitD();
		request.setAttribute("listeProduits", produitD.read());
		UtilisateurD utilisateurD = new UtilisateurD();
		request.setAttribute("listeUtilisateurs", utilisateurD.read());

		System.out.println(favoriD.read());
		request.getRequestDispatcher("vue/frontend/listeFavoris.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
