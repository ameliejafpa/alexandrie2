package controleur.frontend;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AdresseLivraisonD;
import dao.CommandeD;
import dao.DetailsCommandeD;
import dao.UtilisateurD;
import modele.AdresseLivraisonM;
import modele.CommandeM;
import modele.DetailsCommandeM;
import modele.UtilisateurM;

/**
 * Servlet implementation class MonCompte
 */
@WebServlet("/monCompte")
public class MonCompteC extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MonCompteC() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// uptdate utilisateur
		HttpSession session = request.getSession(true);
		int userId = (int) session.getAttribute("userId");
		UtilisateurD utilisateurD = new UtilisateurD();
		UtilisateurM utilisateur = new UtilisateurM();
		boolean samePassword = true;
		boolean champVide = false;
		if (request.getParameter("btnUpdate") != null) {
			String nom = request.getParameter("upNom");
			String prenom = request.getParameter("upPrenom");
			String email = request.getParameter("upEmail");
			if (nom == null || prenom == null || email == null) {
				champVide = true;
				request.setAttribute("champVide", champVide);
			}
			if (request.getParameter("password") != null && request.getParameter("upPassword") != null ) {
				String oldPassword = request.getParameter("password");
				String newPassword = request.getParameter("upPassword");
				
				utilisateur = new UtilisateurM(nom,prenom,email,newPassword);
				utilisateurD.update(utilisateur, userId);
			} else {
				utilisateur = new UtilisateurM(nom,prenom,email);
				utilisateurD.updateWithoutPassword(utilisateur, userId);
			}
		}
		// create / update adresse de livraison
		AdresseLivraisonD adresseLivraisonD = new AdresseLivraisonD();

		if (request.getParameter("btnAdresse") != null) {
			String adresse = request.getParameter("adresse");
			String codePostal = request.getParameter("codePostal");
			String ville = request.getParameter("ville");
			String pays = request.getParameter("pays");
			AdresseLivraisonM adresseLivraisonM = new AdresseLivraisonM();
			adresseLivraisonM = adresseLivraisonD.findByUserId(userId);
			if (adresseLivraisonM.getIdUtilisateur() == null) {
				adresseLivraisonD.create(new AdresseLivraisonM(new UtilisateurM(userId), adresse, codePostal, ville, pays));
			} else {
				adresseLivraisonD.updateByUserId(new AdresseLivraisonM(adresse, codePostal, ville, pays), userId);
				System.out.println("test");
			}
		}
		
		//affichage de l'adresse de livraison
		AdresseLivraisonM adresseLivraisonM = new AdresseLivraisonM();
		adresseLivraisonM = adresseLivraisonD.findByUserId(userId);
		request.setAttribute("adresseLivraison", adresseLivraisonM);
		
		//affichage de mes commandes
		ArrayList<CommandeM> commandes = new ArrayList<>();
		CommandeD commandeD = new CommandeD();
		commandes = commandeD.findByUserId(userId);
		request.setAttribute("commandes", commandes);
		ArrayList<DetailsCommandeM> listeDetailsCommandes = new ArrayList<>();
		for (CommandeM commandeM : commandes) {
			
			int idCommande = commandeM.getId();
			ArrayList<DetailsCommandeM> detailsCommande = new ArrayList<>();
			DetailsCommandeD detailsCommandeD = new DetailsCommandeD();
			detailsCommande = detailsCommandeD.findByIdCommande(idCommande);
			listeDetailsCommandes.addAll(detailsCommande);
		}
		
		request.setAttribute("listeDetailsCommandes", listeDetailsCommandes);

		
		
		
		request.getRequestDispatcher("vue/frontend/monCompte.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
