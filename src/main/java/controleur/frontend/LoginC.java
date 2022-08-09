package controleur.frontend;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UtilisateurD;
import modele.UtilisateurM;

/**
 * Servlet implementation class LoginC
 */
@WebServlet("/login")
public class LoginC extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginC() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UtilisateurD utilisateurD = new UtilisateurD();
		boolean messageInscriptionOk=false;
		boolean emailExiste=false;
        boolean erreurMotdepasse = false;

		if (request.getParameter("btnInscription") != null) {
			String password = request.getParameter("insPassword");
			String nom = request.getParameter("insNom");
			String prenom = request.getParameter("insPrenom");
			String email = request.getParameter("insEmail");
			
			UtilisateurM utilisateur = new UtilisateurM(nom,prenom,email,password);
			UtilisateurM utilisateur2 = new UtilisateurM();
			utilisateur2 = utilisateurD.findByEmail(email);
			
			final String regex = "^(?=.*[~!@#$%^&*()_+\\-=;':\\\",./<>?])(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])\\S{8}$";
			final Pattern pattern = Pattern.compile(regex);
	        final Matcher matcher = pattern.matcher(password);
	        boolean matchFound = matcher.find();
	        if (utilisateur2.getEmail() != null) {
				emailExiste=true;
			} else if (!matchFound) {
				erreurMotdepasse = true;
			} else {
				utilisateurD.create(utilisateur);
				messageInscriptionOk = true;
			}
		}
		
		request.setAttribute("messageInscriptionOk", messageInscriptionOk);
		request.setAttribute("emailExiste", emailExiste);
		request.setAttribute("erreurMotdepasse", erreurMotdepasse);


		
		boolean connected = false;
		boolean messageConnexionNo = false;
		
		if (request.getParameter("btnConnexion") != null) {
			String email = request.getParameter("connexEmail");
			String password = request.getParameter("connexPassword");
			
			UtilisateurM utilisateur = utilisateurD.connexion(email,password);
			if (utilisateur == null) {
				System.out.println("pas de connexion");
				messageConnexionNo = true;
			} else {
				System.out.println("connexion Ok");
				HttpSession session = request.getSession(true);
				session.setAttribute("userId", utilisateur.getId());
				session.setAttribute("userNom", utilisateur.getNom());
				session.setAttribute("userPrenom", utilisateur.getPrenom());
				session.setAttribute("isConnected", true);
				connected = true;
				response.sendRedirect(request.getContextPath() + "/accueil");
			}
			request.setAttribute("messageConnexionNo", messageConnexionNo);
			
		}
		
		if (!connected) {
			request.getRequestDispatcher("vue/frontend/login.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
