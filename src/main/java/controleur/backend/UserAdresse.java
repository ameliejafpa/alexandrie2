package controleur.backend;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AdresseLivraisonD;
import dao.UtilisateurD;
import modele.AdresseLivraisonM;

/**
 * Servlet implementation class UserAdresse
 */
@WebServlet("/adressesadmin")
public class UserAdresse extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserAdresse() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int idUser = Integer.parseInt(request.getParameter("id"));
		UtilisateurD utilisateurD = new UtilisateurD();
		request.setAttribute("user", utilisateurD.findById(idUser));

		AdresseLivraisonD adresseLivraisonD = new AdresseLivraisonD();
		ArrayList<AdresseLivraisonM> adresseLivraisonM = new ArrayList<AdresseLivraisonM>();
		adresseLivraisonM = adresseLivraisonD.findByUserIdArray(idUser);

		// affichage des commandes
		request.setAttribute("listeAdresse", adresseLivraisonM);

		// verif connexion : si pas connect�, redirection automatique vers la page de
		// connexion
		HttpSession session = request.getSession(true);
		if (session.getAttribute("isConnected") == null || (boolean) session.getAttribute("isConnected") == false) {
			System.out.println("is false");
			response.sendRedirect("connectionadmin");
		} else {
			System.out.println(session.getAttribute("isConnected"));
			request.getRequestDispatcher("/vue/backend/UserAdresse.jsp").forward(request, response);
		}
	} // fin doGet

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
