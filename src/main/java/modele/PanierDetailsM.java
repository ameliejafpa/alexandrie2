package modele;

public class PanierDetailsM {

	private ProduitM produit;
	private int quantite;
	
	
	
	public PanierDetailsM() {
		super();
	}
	
	
	
	public PanierDetailsM(ProduitM produit, int quantite) {
		super();
		this.produit = produit;
		this.quantite = quantite;
	}



	
	public ProduitM getProduit() {
		return produit;
	}



	public void setProduit(ProduitM produit) {
		this.produit = produit;
	}



	public int getQuantite() {
		return quantite;
	}



	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}



	@Override
	public String toString() {
		return "PanierDetailsM [produit=" + produit + ", quantite=" + quantite + "]";
	}




}