package controleur.backend;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategorieD;
import dao.SousCategorieD;
import modele.CategorieM;
import modele.SousCategorieM;

/**
 * Servlet implementation class ListeCategories
 */
@WebServlet("/listecatadmin")
public class ListeCategories extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CategorieD categorieD = new CategorieD();
	SousCategorieD sousCategorieD = new SousCategorieD();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListeCategories() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Database.Connect();
		
		if(request.getParameter("delete")!=null ) {
			sousCategorieD.delete(Integer.valueOf(request.getParameter("delete")));
		}
		
		ArrayList<SousCategorieM> sousCategorieM = new ArrayList<SousCategorieM>();
		sousCategorieM=sousCategorieD.read();
		request.setAttribute("listeSousCategorie", sousCategorieM);
		
		ArrayList<CategorieM> categorieM = new ArrayList<CategorieM>();
		categorieM=categorieD.read();
		request.setAttribute("listeCategorie", categorieM);
		
		
		
		request.getRequestDispatcher("/vue/backend/ListeCategories.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (Integer.parseInt(request.getParameter("inputType"))==1) { //nouvelle categorie
			categorieD.create(new CategorieM(request.getParameter("inputName")));
			
		} else if (Integer.parseInt(request.getParameter("inputType"))==2) { //nouvelle sous categorie
			sousCategorieD.create(new SousCategorieM(request.getParameter("inputName"), 
					categorieD.findById(Integer.parseInt(request.getParameter("inputCatParent")))));
		}

		
		

		doGet(request, response);
	}

}
