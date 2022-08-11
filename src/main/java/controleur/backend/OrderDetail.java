package controleur.backend;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommandeD;
import dao.DetailsCommandeD;
import modele.DetailsCommandeM;

/**
 * Servlet implementation class OrderDetail
 */
@WebServlet("/orderdetailadmin")
public class OrderDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CommandeD commandeD = new CommandeD();
	int idCommande;

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

		idCommande = Integer.parseInt(request.getParameter("id"));

		request.setAttribute("commande", commandeD.findById(idCommande));

		DetailsCommandeD detailsCommandeD = new DetailsCommandeD();
		ArrayList<DetailsCommandeM> detailsCommandeM = new ArrayList<DetailsCommandeM>();

		detailsCommandeM = detailsCommandeD.findByIdCommande(idCommande);
		request.setAttribute("listeDetail", detailsCommandeM);

		
		// verif connexion : si pas connect�, redirection automatique vers la page de
		// connexion
		HttpSession session = request.getSession(true);
		if (session.getAttribute("isConnected") == null || (boolean) session.getAttribute("isConnected") == false) {
			System.out.println("is false");
			response.sendRedirect("connectionadmin");
		} else {
			System.out.println(session.getAttribute("isConnected"));
			request.getRequestDispatcher("/vue/backend/OrderDetail.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// update du statut
		commandeD.updateStatus(Integer.parseInt(request.getParameter("inputStatus")), idCommande);

		doGet(request, response);
	}

}
