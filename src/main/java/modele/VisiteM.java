package modele;

public class VisiteM {
	private int id;
	private ProduitM idProduit;
	private UtilisateurM idUtilisateur;
	private String dateV;
	
	public VisiteM() {
	}
	public VisiteM(ProduitM idProduit, UtilisateurM idUtilisateur, String dateV) {
		this.idProduit = idProduit;
		this.idUtilisateur = idUtilisateur;
		this.dateV = dateV;
	}
	public VisiteM(int id, ProduitM idProduit, UtilisateurM idUtilisateur, String dateV) {
		this.id = id;
		this.idProduit = idProduit;
		this.idUtilisateur = idUtilisateur;
		this.dateV = dateV;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public ProduitM getIdProduit() {
		return idProduit;
	}
	public void setIdProduit(ProduitM idProduit) {
		this.idProduit = idProduit;
	}
	public UtilisateurM getIdUtilisateur() {
		return idUtilisateur;
	}
	public void setIdUtilisateur(UtilisateurM idUtilisateur) {
		this.idUtilisateur = idUtilisateur;
	}
	public String getDateV() {
		return dateV;
	}
	public void setDateV(String dateV) {
		this.dateV = dateV;
	}
	

}
