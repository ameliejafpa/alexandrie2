package modele;

public class AdministrateurM {
	private int id;
	private String nom;
	private String email;
	private String motDePasse;
	private String privilege;
	
	public AdministrateurM() {
	}

	public AdministrateurM(String nom, String email, String motDePasse, String privilege) {
		this.nom = nom;
		this.email = email;
		this.motDePasse = motDePasse;
		this.privilege = privilege;
	}

	public AdministrateurM(int id, String nom, String email, String motDePasse, String privilege) {
		this.id = id;
		this.nom = nom;
		this.email = email;
		this.motDePasse = motDePasse;
		this.privilege = privilege;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMotDePasse() {
		return motDePasse;
	}

	public void setMotDePasse(String motDePasse) {
		this.motDePasse = motDePasse;
	}

	public String getPrivilege() {
		return privilege;
	}

	public void setPrivilege(String privilege) {
		this.privilege = privilege;
	}
	
	

}
