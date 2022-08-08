package controleur.frontend;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.FavoriD;
import dao.ProduitD;
import modele.FavoriM;
import modele.PanierDetailsM;
import modele.PanierM;
import modele.ProduitM;

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
		} else if (request.getParameter("action").equalsIgnoreCase("addToCart")) {
			int id = Integer.parseInt(request.getParameter("id"));
			int quantite = 1;
			HttpSession session = request.getSession(true);
			int userId = (int) session.getAttribute("userId");
			ProduitM produit = new ProduitM();
			ProduitD produitD = new ProduitD();
			produit = produitD.findById(id);
			PanierDetailsM panierAdd = new PanierDetailsM(produit, quantite);
			PanierM panier = (PanierM) session.getAttribute("panier");
			panier.add(panierAdd);
			session.setAttribute("panier", panier);
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
