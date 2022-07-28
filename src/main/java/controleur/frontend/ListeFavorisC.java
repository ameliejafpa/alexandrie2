package controleur.frontend;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FavoriD;
import modele.FavoriM;

/**
 * Servlet implementation class FavoriC
 */
@WebServlet("/listeFavoris")
public class ListeFavorisC extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListeFavorisC() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		FavoriD favoriD = new FavoriD();
		ArrayList<FavoriM> listeFavoris = new ArrayList<>();
		int idUtilisateur = Integer.parseInt(request.getParameter("idUtilisateur"));
		listeFavoris = favoriD.findByIdUser(idUtilisateur);
		request.setAttribute("listeFavoris", listeFavoris);
		
		if (request.getParameter("id") == null) {
			request.getRequestDispatcher("vue/frontend/listeFavoris.jsp").forward(request, response);
		} else if (request.getParameter("action").equalsIgnoreCase("delete")) {
			int id = Integer.parseInt(request.getParameter("id"));
			favoriD.delete(id);
			response.sendRedirect(request.getContextPath()+"/listeFavoris?idUtilisateur="+idUtilisateur);
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
