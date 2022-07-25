package modele;

public class UtilisateurM {
	private int id;
	private String nom;
	private String prenom;
	private String dateInscription;
	private String email;
	private String motDePasse;
	
	public UtilisateurM() {
	}
	public UtilisateurM(String nom, String prenom, String dateInscription, String email, String motDePasse) {
		this.nom = nom;
		this.prenom = prenom;
		this.dateInscription = dateInscription;
		this.email = email;
		this.motDePasse = motDePasse;
	}	
	public UtilisateurM(int id, String nom, String prenom, String dateInscription, String email, String motDePasse) {
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
		this.dateInscription = dateInscription;
		this.email = email;
		this.motDePasse = motDePasse;
	}
	
	
	public UtilisateurM(String nom, String prenom, String email, String motDePasse) {
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.motDePasse = motDePasse;
	}
	
	
	public UtilisateurM(String email, String motDePasse) {
		super();
		this.email = email;
		this.motDePasse = motDePasse;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getDateInscription() {
		return dateInscription;
	}
	public void setDateInscription(String dateInscription) {
		this.dateInscription = dateInscription;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMotDePasse() {
		return motDePasse;
	}
	public void setMotDePasse(String motDePasse) {
		this.motDePasse = motDePasse;
	}
	

}
