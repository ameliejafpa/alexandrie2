package controleur.frontend;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ContactD;
import modele.ContactM;
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(true);
		int userId = (int) session.getAttribute("userId");
		ContactD contactD = new ContactD();
		if (request.getParameter("btnMessage") != null) {
			String sujet = request.getParameter("conSujet");
			String message = request.getParameter("conMessage");
			contactD.create(new ContactM(new UtilisateurM(userId), sujet, message, 0));
		}
		
		request.getRequestDispatcher("vue/frontend/contact.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
