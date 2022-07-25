package modele;

public class EntreeEnStockM {
	private int id;
	private FournisseurM idFournisseur;
	private ProduitM idProduit;
	private String dateE;
	private int quantite;
	
	public EntreeEnStockM() {
	}
	public EntreeEnStockM(FournisseurM idFournisseur, ProduitM idProduit, String dateE, int quantite) {
		this.idFournisseur = idFournisseur;
		this.idProduit = idProduit;
		this.dateE = dateE;
		this.quantite = quantite;
	}
	public EntreeEnStockM(int id, FournisseurM idFournisseur, ProduitM idProduit, String dateE, int quantite) {
		this.id = id;
		this.idFournisseur = idFournisseur;
		this.idProduit = idProduit;
		this.dateE = dateE;
		this.quantite = quantite;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public FournisseurM getIdFournisseur() {
		return idFournisseur;
	}
	public void setIdFournisseur(FournisseurM idFournisseur) {
		this.idFournisseur = idFournisseur;
	}
	public ProduitM getIdProduit() {
		return idProduit;
	}
	public void setIdProduit(ProduitM idProduit) {
		this.idProduit = idProduit;
	}
	public String getDateE() {
		return dateE;
	}
	public void setDateE(String dateE) {
		this.dateE = dateE;
	}
	public int getQuantite() {
		return quantite;
	}
	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}

}
