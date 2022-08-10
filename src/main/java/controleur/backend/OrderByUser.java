package controleur.backend;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommandeD;
import dao.UtilisateurD;
import modele.CommandeM;

/**
 * Servlet implementation class OrderByUser
 */
@WebServlet("/orderbyuseradmin")
public class OrderByUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderByUser() {
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

		CommandeD commandeD = new CommandeD();
		ArrayList<CommandeM> commandeM = new ArrayList<CommandeM>();

		// affichage tous les utilisateurs
		commandeM = commandeD.findByUserId(idUser);
		request.setAttribute("listeCommande", commandeM);

		request.getRequestDispatcher("/vue/backend/OrderByUser.jsp").forward(request, response);
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
