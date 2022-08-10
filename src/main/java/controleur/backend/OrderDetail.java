package controleur.backend;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommandeD;
import dao.DetailsCommandeD;
import modele.DetailsCommandeM;

/**
 * Servlet implementation class OrderDetail
 */
@WebServlet("/orderdetailadmin")
public class OrderDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderDetail() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int idCommande = Integer.parseInt(request.getParameter("id"));

		CommandeD commandeD = new CommandeD();
		request.setAttribute("commande", commandeD.findById(idCommande));

		DetailsCommandeD detailsCommandeD = new DetailsCommandeD();
		ArrayList<DetailsCommandeM> detailsCommandeM = new ArrayList<DetailsCommandeM>();

		// affichage tous les utilisateurs
		detailsCommandeM = detailsCommandeD.findByIdCommande(idCommande);
		request.setAttribute("listeDetail", detailsCommandeM);

		request.getRequestDispatcher("/vue/backend/OrderDetail.jsp").forward(request, response);
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
