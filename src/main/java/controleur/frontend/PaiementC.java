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
import modele.PanierDetailsM;
import modele.PanierM;
import modele.UtilisateurM;

/**
 * Servlet implementation class PaiementC
 */
@WebServlet("/paiement")
public class PaiementC extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaiementC() {
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
		
		//affichage de la commande
		request.setAttribute("panierDetails", panierDetails);
		
		//affichage des informations du client
		int userId = (int) session.getAttribute("userId");
		//affichage de l'adresse de livraison
		AdresseLivraisonD adresseLivraisonD = new AdresseLivraisonD();
		AdresseLivraisonM adresseLivraisonM = new AdresseLivraisonM();
		adresseLivraisonM = adresseLivraisonD.findByUserId(userId);
		request.setAttribute("adresseLivraison", adresseLivraisonM);
		
		//inscription
		UtilisateurD utilisateurD = new UtilisateurD();
		boolean messageInscriptionOk=false;
		if (request.getParameter("btnInscription") != null) {
			String password = request.getParameter("insPassword");
			String nom = request.getParameter("insNom");
			String prenom = request.getParameter("insPrenom");
			String email = request.getParameter("insEmail");
			String adresse = request.getParameter("adresse");
			String codePostal = request.getParameter("codePostal");
			String ville = request.getParameter("ville");
			String pays = request.getParameter("pays");
			UtilisateurM utilisateur = new UtilisateurM(nom,prenom,email,password);
			utilisateurD.create(utilisateur);
			messageInscriptionOk = true;
			adresseLivraisonD.create(new AdresseLivraisonM(new UtilisateurM(userId), adresse, codePostal, ville, pays));
		}
		
		request.setAttribute("messageInscriptionOk", messageInscriptionOk);
		
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
				session.setAttribute("userId", utilisateur.getId());
				session.setAttribute("userNom", utilisateur.getNom());
				session.setAttribute("userPrenom", utilisateur.getPrenom());
				session.setAttribute("isConnected", true);
			}
			request.setAttribute("messageConnexionNo", messageConnexionNo);
			
		}
		
		boolean commandeOk = false;
		
		if (request.getParameter("valider") != null) {
			commandeOk = true;
			CommandeD commandeD = new CommandeD();
			DetailsCommandeD detailsCommandeD = new DetailsCommandeD();
			
			//enregistrement de la commande
			float totalPanier = panier.prixTotal();
			UtilisateurM utilisateurM = new UtilisateurM();
			utilisateurM.setId(userId);
			CommandeM commandeM = new CommandeM(utilisateurM, totalPanier, adresseLivraisonM, 0);
			commandeD.create(commandeM);
			int idCommande = commandeD.findLastId();
			commandeM = commandeD.findById(idCommande);

			//enregistrement des détails de la commande
			for (PanierDetailsM panierDetailsM : panier.articles) {
				detailsCommandeD.create(new DetailsCommandeM(commandeM, panierDetailsM.getProduit(),panierDetailsM.getQuantite(),panierDetailsM.getProduit().getPrix()));
			}
			panier.empty();
			session.setAttribute("panier", panier);
		}
		
		request.setAttribute("commandeOk", commandeOk);
		request.getRequestDispatcher("vue/frontend/paiement.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
