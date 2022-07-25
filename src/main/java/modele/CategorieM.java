package modele;

public class CategorieM {
	private int id;
	private String titre;
	
	public CategorieM() {
	}
	public CategorieM(String titre) {
		this.titre = titre;
	}
	public CategorieM(int id, String titre) {
		this.id = id;
		this.titre = titre;
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
	
	
	

}
