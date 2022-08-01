package modele;

public class CoordonneeM {
	private int id;
	private String nom;
	private String adresse;
	private String telephone;
	private String email;
	private String logo;
	
	public CoordonneeM() {
	}
	public CoordonneeM(String nom, String adresse, String telephone, String email, String logo) {
		this.nom = nom;
		this.adresse = adresse;
		this.telephone = telephone;
		this.email = email;
		this.logo = logo;
	}
	public CoordonneeM(int id, String nom, String adresse, String telephone, String email, String logo) {
		this.id = id;
		this.nom = nom;
		this.adresse = adresse;
		this.telephone = telephone;
		this.email = email;
		this.logo = logo;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getAdresse() {
		return adresse;
	}
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	@Override
	public String toString() {
		return "CoordonneeM [id=" + id + ", nom=" + nom + ", adresse=" + adresse + ", telephone=" + telephone
				+ ", email=" + email + ", logo=" + logo + "]";
	}

	
}
