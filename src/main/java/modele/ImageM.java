package modele;

public class ImageM {
	private int id;
	private ProduitM idProduit;
	private String url;
	
	public ImageM() {
	}
	public ImageM(ProduitM idProduit, String url) {
		this.idProduit = idProduit;
		this.url = url;
	}
	public ImageM(int id, ProduitM idProduit, String url) {
		this.id = id;
		this.idProduit = idProduit;
		this.url = url;
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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
}
