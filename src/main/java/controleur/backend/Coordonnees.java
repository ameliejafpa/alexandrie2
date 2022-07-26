package controleur.backend;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CoordonneeD;
import modele.CoordonneeM;

/**
 * Servlet implementation class Coordonnees
 */
@WebServlet("/coordonneesadmin")
public class Coordonnees extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CoordonneeD coordonneeD = new CoordonneeD();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Coordonnees() {
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
		ArrayList<CoordonneeM> listeCoordonnees = new ArrayList<>();
		listeCoordonnees = coordonneeD.read();
		request.setAttribute("listeCoordonnees", listeCoordonnees);

		// verif connexion : si pas connect�, redirection automatique vers la page de
		// connexion
		HttpSession session = request.getSession(true);
		if (session.getAttribute("isConnected") == null || (boolean) session.getAttribute("isConnected") == false) {
			System.out.println("is false");
			response.sendRedirect("connectionadmin");
		} else {
			System.out.println(session.getAttribute("isConnected"));
			request.getRequestDispatcher("/vue/backend/Coordonnees.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (request.getParameter("btnUpdateCoordonnee") != null) {
			int id = Integer.parseInt(request.getParameter("inputId"));
			String nom = String.valueOf(request.getParameter("inputNom"));
			String adresse = String.valueOf(request.getParameter("inputAdresse"));
			String telephone = String.valueOf(request.getParameter("inputTelephone"));
			String email = String.valueOf(request.getParameter("inputEmail"));
			String logo = null;
			if (request.getParameter("inputLogo").isEmpty() == true) {
				logo = String.valueOf(request.getParameter("inputLogo"));

			} else {
				logo = "vue/img/" + request.getParameter("inputLogo");
			}
			
			coordonneeD.update(new CoordonneeM(nom, adresse, telephone, email, logo), id);
		}
		doGet(request, response);
	}

}
