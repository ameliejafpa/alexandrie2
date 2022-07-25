package modele;

public class SlideM {
	private int id;
	private String titre;
	private String image;
	private String url;
	
	public SlideM() {
	}
	public SlideM(String titre, String image, String url) {
		this.titre = titre;
		this.image = image;
		this.url = url;
	}
	public SlideM(int id, String titre, String image, String url) {
		this.id = id;
		this.titre = titre;
		this.image = image;
		this.url = url;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	

}
