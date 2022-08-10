package controleur.backend;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommandeD;
import modele.CommandeM;

/**
 * Servlet implementation class OrderByUser
 */
@WebServlet("/orderbyuseradmin")
public class OrderByUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CommandeD commandeD = new CommandeD();
	ArrayList<CommandeM> commandeM = new ArrayList<CommandeM>();

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

		if (request.getParameter("action").equals("showByClient")) {
			int idUser = Integer.parseInt(request.getParameter("id"));
			commandeM = commandeD.findByUserId(idUser);

		} else if (request.getParameter("action").equals("showByProduct")) {
			int idProduct = Integer.parseInt(request.getParameter("id"));
			commandeM = commandeD.findByProductId(idProduct);

		} else if (request.getParameter("action").equals("showAll")) {
			commandeM = commandeD.read();
		}

		// affichage des commandes
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
