package modele;

public class SousCategorieM {
	private int id;
	private String titre;
	private CategorieM idCategorie;
	
	public SousCategorieM() {
	}
	public SousCategorieM(int id) {
		this.id = id;
	}
	public SousCategorieM(String titre, CategorieM idCategorie) {
		this.titre = titre;
		this.idCategorie = idCategorie;
	}
	public SousCategorieM(int id, String titre, CategorieM idCategorie) {
		this.id = id;
		this.titre = titre;
		this.idCategorie = idCategorie;
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
	public CategorieM getIdCategorie() {
		return idCategorie;
	}
	public void setIdCategorie(CategorieM idCategorie) {
		this.idCategorie = idCategorie;
	}
	
	

}
