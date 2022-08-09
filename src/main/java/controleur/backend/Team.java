package controleur.backend;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdministrateurD;
import modele.AdministrateurM;

/**
 * Servlet implementation class Team
 */
@WebServlet("/teamadmin")
public class Team extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AdministrateurD administrateurD = new AdministrateurD();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Team() {
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
		if (request.getParameter("deleteAdmin") != null) {
			administrateurD.delete(Integer.valueOf(request.getParameter("deleteAdmin")));
		}

		// edit
		if (request.getParameter("updateAdmin") != null) {
			request.setAttribute("showAdmin",
					administrateurD.findById(Integer.valueOf(request.getParameter("updateAdmin"))));
		}

		// liste
		ArrayList<AdministrateurM> administrateurM = new ArrayList<AdministrateurM>();
		administrateurM = administrateurD.read();
		request.setAttribute("listeAdmin", administrateurM);

		request.getRequestDispatcher("/vue/backend/Team.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// update
		if (request.getParameter("inputId") != null) {
			administrateurD.update(new AdministrateurM(request.getParameter("inputName"),
					request.getParameter("inputName"), null, request.getParameter("inputPrivilege")),
					Integer.valueOf(request.getParameter("inputId")));
		}

		// create
		else {
			administrateurD
					.create(new AdministrateurM(request.getParameter("inputName"), request.getParameter("inputEmail"),
							request.getParameter("inputName"), request.getParameter("inputPrivilege")));
		}

		doGet(request, response);
	}

}
