package modele;

public class DetailsCommandeM {
	private int id;
	private CommandeM idCommande;
	private ProduitM idProduit;
	private int quantite;
	private float prix;
	
	public DetailsCommandeM() {
	}
	public DetailsCommandeM(CommandeM idCommande, ProduitM idProduit, int quantite, float prix) {
		this.idCommande = idCommande;
		this.idProduit = idProduit;
		this.quantite = quantite;
		this.prix = prix;
	}
	public DetailsCommandeM(int id, CommandeM idCommande, ProduitM idProduit, int quantite, float prix) {
		this.id = id;
		this.idCommande = idCommande;
		this.idProduit = idProduit;
		this.quantite = quantite;
		this.prix = prix;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public CommandeM getIdCommande() {
		return idCommande;
	}
	public void setIdCommande(CommandeM idCommande) {
		this.idCommande = idCommande;
	}
	public ProduitM getIdProduit() {
		return idProduit;
	}
	public void setIdProduit(ProduitM idProduit) {
		this.idProduit = idProduit;
	}
	public int getQuantite() {
		return quantite;
	}
	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}
	public float getPrix() {
		return prix;
	}
	public void setPrix(float prix) {
		this.prix = prix;
	}
	@Override
	public String toString() {
		return "DetailsCommandeM [id=" + id + ", idCommande=" + idCommande + ", idProduit=" + idProduit + ", quantite="
				+ quantite + ", prix=" + prix + "]";
	}
	
	
}
