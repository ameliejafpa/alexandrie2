package controleur.frontend;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modele.PanierDetailsM;
import modele.PanierM;
import modele.ProduitM;

/**
 * Servlet implementation class MonPanier
 */
@WebServlet("/monPanier")
public class MonPanierC extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MonPanierC() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession( true );
		PanierM panier = (PanierM) session.getAttribute("panier");
		ArrayList<PanierDetailsM> panierDetails = panier.articles;
		
		
		
		//affichage du panier
		request.setAttribute("panierDetails", panierDetails);
		
		//suppression d'un produit du panier
		if (request.getParameter("action") != null && request.getParameter("action").equalsIgnoreCase("delete")) {
			int id = Integer.parseInt(request.getParameter("id"));
			panier.delete(id);
			session.setAttribute("panier", panier);
		}
		
		//vidange du panier
		if (request.getParameter("btnEmptyCart") != null) {
			panier.empty();
			session.setAttribute("panier", panier);
		}
		
		//modification du panier
		if (request.getParameter("btnUpdteCart") != null) {
			Iterator<PanierDetailsM> it = panierDetails.iterator();
			int i = 0;
			while (it.hasNext()) {
				int quantite = Integer.valueOf(request.getParameter("quantiteProduit" + i));
				System.out.println(quantite);
				//type type = (type) it.next();
				i++;
			}
			ProduitM produit = new ProduitM();
			int quantite = Integer.valueOf(request.getParameter("panierQuantite"));
			PanierDetailsM panierAdd = new PanierDetailsM(produit, quantite);
			panier = (PanierM) session.getAttribute("panier");
			panier.add(panierAdd);
			session.setAttribute("panier", panier);
		}
				
		request.getRequestDispatcher("vue/frontend/monPanier.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
