package modele;

public class FavoriM {
	private int id;
	private ProduitM idProduit;
	private UtilisateurM idUtilisateur;
	
	public FavoriM() {
	}
	public FavoriM(ProduitM idProduit, UtilisateurM idUtilisateur) {
		this.idProduit = idProduit;
		this.idUtilisateur = idUtilisateur;
	}
	public FavoriM(int id, ProduitM idProduit, UtilisateurM idUtilisateur) {
		this.id = id;
		this.idProduit = idProduit;
		this.idUtilisateur = idUtilisateur;
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
	

}
