package controleur.frontend;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ContactD;
import dao.CoordonneeD;
import modele.ContactM;
import modele.CoordonneeM;
import modele.UtilisateurM;

/**
 * Servlet implementation class ContactC
 */
@WebServlet("/contact")
public class ContactC extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ContactC() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// récupération du message
		HttpSession session = request.getSession(true);
		int userId = (int) session.getAttribute("userId");
		ContactD contactD = new ContactD();
		String message;
		if (request.getParameter("btnMessage") != null) {
			String email = null;
			if ((boolean) session.getAttribute("isConnected") == false) {
				message = request.getParameter("conEmail") + " - " + request.getParameter("conMessage");
			} else {
				message = request.getParameter("conEmail") + " - " + request.getParameter("conMessage");

			}
			String sujet = request.getParameter("conSujet");
			contactD.create(new ContactM(new UtilisateurM(userId), sujet, message, 0));
		}

		// Affichage des coordonnées
		ArrayList<CoordonneeM> listeCoordonnees = new ArrayList<>();
		CoordonneeD coordonneeD = new CoordonneeD();
		listeCoordonnees = coordonneeD.read();
		request.setAttribute("listeCoordonnees", listeCoordonnees);

		request.getRequestDispatcher("vue/frontend/contact.jsp").forward(request, response);
	}

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
