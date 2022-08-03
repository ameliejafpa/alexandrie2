package controleur.backend;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UtilisateurD;
import modele.UtilisateurM;

/**
 * Servlet implementation class UserList
 */
@WebServlet("/userlistadmin")
public class UserList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserList() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		UtilisateurD utilisateurD = new UtilisateurD();
		ArrayList<UtilisateurM> utilisateurM = new ArrayList<UtilisateurM>();

		// affichage tous les utilisateurs
		utilisateurM = utilisateurD.read();
		request.setAttribute("listeUsers", utilisateurM);

		request.getRequestDispatcher("/vue/backend/UserList.jsp").forward(request, response);
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
