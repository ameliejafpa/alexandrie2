package controleur.backend;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ContactD;
import dao.UtilisateurD;
import modele.ContactM;
import modele.UtilisateurM;

/**
 * Servlet implementation class MessageAdmin
 */
@WebServlet("/messageadmin")
public class MessageAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ContactD contactD = new ContactD();
	UtilisateurM utilisateurM = new UtilisateurM();


       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<ContactM> listeMessages = new ArrayList<>();
		UtilisateurD utilisateurD = new UtilisateurD();
		int idUtilisateur = Integer.parseInt(request.getParameter("idUtilisateur"));
		listeMessages = contactD.findByIdUser(idUtilisateur);
		utilisateurM = utilisateurD.findById(idUtilisateur);
		request.setAttribute("utilisateur", utilisateurM);
		request.setAttribute("listeMessages", listeMessages);
		
		if (request.getParameter("lu") != null) {
			int etat = 1;
			int id = Integer.parseInt(request.getParameter("id"));
			String sujet = contactD.findById(id).getSujet();
			String message = contactD.findById(id).getMessage();
			contactD.update(new ContactM(utilisateurM,sujet,message,etat), id);
		}

		
		// verif connexion : si pas connect�, redirection automatique vers la page de
		// connexion
		HttpSession session = request.getSession(true);
		if (session.getAttribute("isConnected") == null || (boolean) session.getAttribute("isConnected") == false) {
			System.out.println("is false");
			response.sendRedirect("connectionadmin");
		} else {
			System.out.println(session.getAttribute("isConnected"));
			request.getRequestDispatcher("vue/backend/MessageAdmin.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (request.getParameter("lu") != null) {
			int etat = 1;
			int id = Integer.parseInt(request.getParameter("id"));
			String sujet = contactD.findById(id).getSujet();
			String message = contactD.findById(id).getMessage();
			contactD.update(new ContactM(utilisateurM,sujet,message,etat), id);
		}
		doGet(request, response);
	}

}
