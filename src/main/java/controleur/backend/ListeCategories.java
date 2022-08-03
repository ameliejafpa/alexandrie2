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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// delete categorie / sous categorie
		if (request.getParameter("deleteCategorie") != null) {
			categorieD.delete(Integer.valueOf(request.getParameter("deleteCategorie")));
		}
		if (request.getParameter("deleteSousCategorie") != null) {
			sousCategorieD.delete(Integer.valueOf(request.getParameter("deleteSousCategorie")));
		}

		// edit categorie / sous categorie
		if (request.getParameter("updateCategorie") != null) {
			request.setAttribute("showCategorie",
					categorieD.findById(Integer.valueOf(request.getParameter("updateCategorie"))));
		}
		if (request.getParameter("updateSousCat") != null) {
			request.setAttribute("showSousCat",
					sousCategorieD.findById(Integer.valueOf(request.getParameter("updateSousCat"))));
		}

		// liste categorie / sous categorie
		ArrayList<SousCategorieM> sousCategorieM = new ArrayList<SousCategorieM>();
		sousCategorieM = sousCategorieD.read();
		request.setAttribute("listeSousCategorie", sousCategorieM);

		ArrayList<CategorieM> categorieM = new ArrayList<CategorieM>();
		categorieM = categorieD.read();
		request.setAttribute("listeCategorie", categorieM);

		request.getRequestDispatcher("/vue/backend/ListeCategories.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// update et create
		if (request.getParameter("inputIdCat") != null) {
			categorieD.update(new CategorieM(request.getParameter("inputName")),
					Integer.valueOf(request.getParameter("inputIdCat")));
		} // fin update cat
		else if (request.getParameter("inputIdSousCat") != null) {
			sousCategorieD.update(
					new SousCategorieM(request.getParameter("inputName"),
							categorieD.findById(Integer.parseInt(request.getParameter("inputCatParent")))),
					Integer.valueOf(request.getParameter("inputIdSousCat")));
		} // fin update sous cat
		else if (Integer.parseInt(request.getParameter("inputType")) == 1) {
			categorieD.create(new CategorieM(request.getParameter("inputName")));
		} // fin create cat
		else if (Integer.parseInt(request.getParameter("inputType")) == 2) {
			sousCategorieD.create(new SousCategorieM(request.getParameter("inputName"),
					categorieD.findById(Integer.parseInt(request.getParameter("inputCatParent")))));
		} // fin create sous cat

		doGet(request, response);
	}

}
