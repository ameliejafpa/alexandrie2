package modele;

public class RechercheM {
	private int id;
	private UtilisateurM idUtilisateur;
	private String motCle;
	private String dateR;
	
	public RechercheM() {
	}
	public RechercheM(UtilisateurM idUtilisateur, String motCle, String dateR) {
		this.idUtilisateur = idUtilisateur;
		this.motCle = motCle;
		this.dateR = dateR;
	}
	public RechercheM(int id, UtilisateurM idUtilisateur, String motCle, String dateR) {
		this.id = id;
		this.idUtilisateur = idUtilisateur;
		this.motCle = motCle;
		this.dateR = dateR;
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
	public String getMotCle() {
		return motCle;
	}
	public void setMotCle(String motCle) {
		this.motCle = motCle;
	}
	public String getDateR() {
		return dateR;
	}
	public void setDateR(String dateR) {
		this.dateR = dateR;
	}
	

}
