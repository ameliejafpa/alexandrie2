package controleur.backend;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

		request.getRequestDispatcher("vue/backend/MessageAdmin.jsp").forward(request, response);
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
