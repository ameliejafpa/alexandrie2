package modele;

public class CommandeM {
	private int id;
	private UtilisateurM idUtilisateur;
	private String dateC;
	private float total;
	private AdresseLivraisonM idAdresse;
	private int etat;
	
	public CommandeM() {
	}
	public CommandeM(UtilisateurM idUtilisateur, float total, AdresseLivraisonM idAdresse, int etat) {
		this.idUtilisateur = idUtilisateur;
		this.total = total;
		this.idAdresse = idAdresse;
		this.etat = etat;
	}
	public CommandeM(int id, UtilisateurM idUtilisateur, float total, AdresseLivraisonM idAdresse, int etat) {
		this.id = id;
		this.idUtilisateur = idUtilisateur;
		this.total = total;
		this.idAdresse = idAdresse;
		this.etat = etat;
	}
	
	
	public CommandeM(int id, int etat) {
		this.id = id;
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
	public String getDateC() {
		return dateC;
	}
	public void setDateC(String dateC) {
		this.dateC = dateC;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	public AdresseLivraisonM getIdAdresse() {
		return idAdresse;
	}
	public void setIdAdresse(AdresseLivraisonM idAdresse) {
		this.idAdresse = idAdresse;
	}
	public int getEtat() {
		return etat;
	}
	public void setEtat(int etat) {
		this.etat = etat;
	}
	@Override
	public String toString() {
		return "CommandeM [id=" + id + ", idUtilisateur=" + idUtilisateur + ", dateC=" + dateC + ", total=" + total
				+ ", idAdresse=" + idAdresse + ", etat=" + etat + "]";
	}
	
	
}
