package controleur.backend;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FournisseurD;
import modele.FournisseurM;

/**
 * Servlet implementation class Fournisseur
 */
@WebServlet("/fournisseuradmin")
public class Fournisseur extends HttpServlet {
	private static final long serialVersionUID = 1L;
	FournisseurD fournisseurD = new FournisseurD();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Fournisseur() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// delete
		if (request.getParameter("deleteFour") != null) {
			fournisseurD.delete(Integer.valueOf(request.getParameter("deleteFour")));
		}

		// edit
		if (request.getParameter("updateFour") != null) {
			request.setAttribute("showFour",
					fournisseurD.findById(Integer.valueOf(request.getParameter("updateFour"))));
		}

		// liste
		ArrayList<FournisseurM> fournisseurM = new ArrayList<FournisseurM>();
		fournisseurM = fournisseurD.read();
		request.setAttribute("listeFour", fournisseurM);

		request.getRequestDispatcher("/vue/backend/Fournisseur.jsp").forward(request, response);
	} // fin doGet

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// update
		if (request.getParameter("inputId") != null) {
			System.out.println("update!");
			fournisseurD.update(new FournisseurM(request.getParameter("inputName")),
					Integer.valueOf(request.getParameter("inputId")));
		}
		// create
		else {
			System.out.println("create!");
			fournisseurD.create(new FournisseurM(request.getParameter("inputName")));
		}

		doGet(request, response);
	} // fin doPost

}
