package controleur.frontend;

import java.io.IOException;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
		boolean messageInscriptionOk=false;
		boolean emailExiste=false;
        boolean erreurNewPassword = false;
        boolean erreurOldPassword = false;
        boolean champObligatoire = false;
		if (request.getParameter("btnUpdate") != null) {
			String nom = request.getParameter("upNom");
			String prenom = request.getParameter("upPrenom");
			String email = request.getParameter("upEmail");
			
			utilisateur = utilisateurD.findByEmail(email);
			
			if (nom.equalsIgnoreCase("") || prenom.equalsIgnoreCase("") || email.equalsIgnoreCase("")) {
	        	champObligatoire = true;
			}
			if (utilisateur.getEmail() != null && utilisateurD.findById(userId).getEmail().equalsIgnoreCase(email) == false) {
				emailExiste=true;
			} 
			String oldPassword = null;
			String newPassword = null;
			if (!request.getParameter("oldPassword").equalsIgnoreCase("") && !request.getParameter("newPassword").equalsIgnoreCase("") ) {
				
				// test si mot de passe correct
				oldPassword = request.getParameter("oldPassword");
				
				if (utilisateurD.connexion(email, oldPassword) == null) {
					erreurOldPassword = true;
				}
				
				//Vérification nouveau mot de passe
				newPassword = request.getParameter("newPassword");
				final String regex = "^(?=.*[~!@#$%^&*()_+\\-=;':\\\",./<>?])(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])\\S{8}$";
				final Pattern pattern = Pattern.compile(regex);
		        final Matcher matcher = pattern.matcher(newPassword);
		        boolean matchFound = matcher.find();
		        if (!matchFound) {
		        	erreurNewPassword = true;
				}
		        if (!erreurNewPassword && !champObligatoire && !emailExiste && !erreurOldPassword) {
		        	utilisateur = new UtilisateurM(nom,prenom,email,newPassword);
					utilisateurD.update(utilisateur, userId);
					session.setAttribute("userId", utilisateur.getId());
					session.setAttribute("userNom", utilisateur.getNom());
					session.setAttribute("userPrenom", utilisateur.getPrenom());
					session.setAttribute("userEmail", utilisateur.getEmail());
				}
			} else if (!champObligatoire && !emailExiste) {
				utilisateur = new UtilisateurM(nom,prenom,email);
				utilisateurD.updateWithoutPassword(utilisateur, userId);
			}
			
			request.setAttribute("messageInscriptionOk", messageInscriptionOk);
			request.setAttribute("emailExiste", emailExiste);
			request.setAttribute("erreurOldPassword", erreurOldPassword);
			request.setAttribute("erreurNewPassword", erreurNewPassword);
			request.setAttribute("champObligatoire", champObligatoire);
		}
		// create adresse de livraison
		AdresseLivraisonD adresseLivraisonD = new AdresseLivraisonD();

		if (request.getParameter("btnAddAdresse") != null) {
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
		
		// update adresse de livraison
		
		// delete adresse de livraison
//		if (request.getParameter("btnAddAdresse") != null) {
//			
//		}
		
		
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
