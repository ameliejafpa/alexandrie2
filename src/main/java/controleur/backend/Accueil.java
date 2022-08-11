package controleur.backend;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProduitD;

/**
 * Servlet implementation class Accueil
 */
@WebServlet("/accueiladmin")
public class Accueil extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Accueil() {
		super();

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// alerte stock
		ProduitD produitD = new ProduitD();
		request.setAttribute("alerteProduit", produitD.alerteStock());

		// verif connexion : si pas connecté, redirection automatique vers la page de
		// connexion
		HttpSession session = request.getSession(true);
		if (session.getAttribute("isConnected") == null || (boolean) session.getAttribute("isConnected") == false) {
			System.out.println("is false");
			response.sendRedirect("connectionadmin");
		} else {
			System.out.println(session.getAttribute("isConnected"));
			request.getRequestDispatcher("/vue/backend/Accueil.jsp").forward(request, response);
		}

	} // fin doGet

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}// fin doPost

}
