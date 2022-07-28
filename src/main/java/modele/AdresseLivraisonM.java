package modele;

public class AdresseLivraisonM {
	private int id;
	private UtilisateurM idUtilisateur;
	private String adresse;
	private String codePostal;
	private String ville;
	private String pays;
	
	public AdresseLivraisonM() {
	}
	public AdresseLivraisonM(UtilisateurM idUtilisateur, String adresse, String codePostal, String ville, String pays) {
		this.idUtilisateur = idUtilisateur;
		this.adresse = adresse;
		this.codePostal = codePostal;
		this.ville = ville;
		this.pays = pays;
	}
	public AdresseLivraisonM(int id, UtilisateurM idUtilisateur, String adresse, String codePostal, String ville,
			String pays) {
		this.id = id;
		this.idUtilisateur = idUtilisateur;
		this.adresse = adresse;
		this.codePostal = codePostal;
		this.ville = ville;
		this.pays = pays;
	}
	
	public AdresseLivraisonM(String adresse, String codePostal, String ville, String pays) {
		super();
		this.adresse = adresse;
		this.codePostal = codePostal;
		this.ville = ville;
		this.pays = pays;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public UtilisateurM getIdUtilisateur() {
		return idUtilisateur;
	}
	public void setIdUtilisateur(UtilisateurM idUtilisateur) {
		this.idUtilisateur = idUtilisateur;
	}
	public String getAdresse() {
		return adresse;
	}
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	public String getCodePostal() {
		return codePostal;
	}
	public void setCodePostal(String codePostal) {
		this.codePostal = codePostal;
	}
	public String getVille() {
		return ville;
	}
	public void setVille(String ville) {
		this.ville = ville;
	}
	public String getPays() {
		return pays;
	}
	public void setPays(String pays) {
		this.pays = pays;
	}
	@Override
	public String toString() {
		return "AdresseLivraisonM [id=" + id + ", idUtilisateur=" + idUtilisateur + ", adresse=" + adresse
				+ ", codePostal=" + codePostal + ", ville=" + ville + ", pays=" + pays + "]";
	}
	

}
