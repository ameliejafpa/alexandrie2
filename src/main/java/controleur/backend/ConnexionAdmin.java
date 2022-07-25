package controleur.backend;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AdministrateurD;
import modele.AdministrateurM;

/**
 * Servlet implementation class ConnexionAdmin
 */
@WebServlet("/connectionadmin")
public class ConnexionAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConnexionAdmin() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/vue/backend/ConnexionAdmin.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean connected =false;
		
		//connexion
		AdministrateurD administrateurD = new AdministrateurD();
		AdministrateurM administrateur = new AdministrateurM();
		//System.out.println(request.getParameter("inputEmail"));
		//System.out.println(request.getParameter("inputPassword"));
		if (administrateurD.login(request.getParameter("inputEmail"), request.getParameter("inputPassword"), administrateur)!=null) {
			//active la session
			HttpSession session = request.getSession(true);
			session.setAttribute("sessionId", administrateur.getId());
			session.setAttribute("sessionNom", administrateur.getNom());
			session.setAttribute("sessionPrivilege", administrateur.getPrivilege());
			session.setAttribute("isConnected", true);			
			connected=true;
			//System.out.println("nom session "+ session.getAttribute("adminNom"));
			//redirige vers l'accueil
			response.sendRedirect(request.getContextPath()+"/accueiladmin");		
		} 
		else {
			doGet(request, response);
		}
				
	} // fin do post

}
