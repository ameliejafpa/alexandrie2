package modele;

public class ContactM {
	private int id;
	private UtilisateurM idUtilisateur;
	private String sujet;
	private String message;
	private int etat;
	
	public ContactM() {
	}
	public ContactM(UtilisateurM idUtilisateur, String sujet, String message, int etat) {
		this.idUtilisateur = idUtilisateur;
		this.sujet = sujet;
		this.message = message;
		this.etat = etat;
	}
	public ContactM(int id, UtilisateurM idUtilisateur, String sujet, String message, int etat) {
		this.id = id;
		this.idUtilisateur = idUtilisateur;
		this.sujet = sujet;
		this.message = message;
		this.etat = etat;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public UtilisateurM getIdUtilisateur() {
		return idUtilisateur;
	}
	public void setIdUtilisateur(UtilisateurM idUtilisateur) {
		this.idUtilisateur = idUtilisateur;
	}
	public String getSujet() {
		return sujet;
	}
	public void setSujet(String sujet) {
		this.sujet = sujet;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getEtat() {
		return etat;
	}
	public void setEtat(int etat) {
		this.etat = etat;
	}
	

}
