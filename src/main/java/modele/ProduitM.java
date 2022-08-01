package modele;

public class ProduitM {
	private int id;
	private String titre;
	private String description;
	private float prix;
	private String image ;
	private SousCategorieM idSousCategorie;
	private int stock;
	private int stockMinimum;
	
	public ProduitM() {
	}
	public ProduitM(String titre, String description, float prix, String image, SousCategorieM idSousCategorie,
			int stock, int stockMinimum) {
		this.titre = titre;
		this.description = description;
		this.prix = prix;
		this.image = image;
		this.idSousCategorie = idSousCategorie;
		this.stock = stock;
		this.stockMinimum = stockMinimum;
	}
	public ProduitM(int id, String titre, String description, float prix, String image, SousCategorieM idSousCategorie,
			int stock, int stockMinimum) {
		this.id = id;
		this.titre = titre;
		this.description = description;
		this.prix = prix;
		this.image = image;
		this.idSousCategorie = idSousCategorie;
		this.stock = stock;
		this.stockMinimum = stockMinimum;
	}	
	public ProduitM(int id, String titre, int stock, int stockMinimum) {
		this.id = id;
		this.titre = titre;
		this.stock = stock;
		this.stockMinimum = stockMinimum;
	}
	public ProduitM(int id, String titre) {
		this.id = id;
		this.titre = titre;
	}
	public ProduitM(int id, String titre, float prix, String image) {
		this.id = id;
		this.titre = titre;
		this.prix = prix;
		this.image = image;
	}
	public ProduitM(int id, String titre, float prix, String image, int stock) {
		super();
		this.id = id;
		this.titre = titre;
		this.prix = prix;
		this.image = image;
		this.stock = stock;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public float getPrix() {
		return prix;
	}
	public void setPrix(float prix) {
		this.prix = prix;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public SousCategorieM getIdSousCategorie() {
		return idSousCategorie;
	}
	public void setIdSousCategorie(SousCategorieM idSousCategorie) {
		this.idSousCategorie = idSousCategorie;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getStockMinimum() {
		return stockMinimum;
	}
	public void setStockMinimum(int stockMinimum) {
		this.stockMinimum = stockMinimum;
	}
	@Override
	public String toString() {
		return "ProduitM [id=" + id + ", titre=" + titre + ", description=" + description + ", prix=" + prix
				+ ", image=" + image + ", idSousCategorie=" + idSousCategorie + ", stock=" + stock + ", stockMinimum="
				+ stockMinimum + "]";
	}
	

}
