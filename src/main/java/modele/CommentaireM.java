package modele;

public class CommentaireM {
	private int id;
	private String commentaire;
	private int note;
	private ProduitM idProduit;
	private UtilisateurM idUtilisateur;
	
	public CommentaireM() {
	}
	public CommentaireM(String commentaire, int note, ProduitM idProduit, UtilisateurM idUtilisateur) {
		this.commentaire = commentaire;
		this.note = note;
		this.idProduit = idProduit;
		this.idUtilisateur = idUtilisateur;
	}
	public CommentaireM(int id, String commentaire, int note, ProduitM idProduit, UtilisateurM idUtilisateur) {
		this.id = id;
		this.commentaire = commentaire;
		this.note = note;
		this.idProduit = idProduit;
		this.idUtilisateur = idUtilisateur;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCommentaire() {
		return commentaire;
	}
	public void setCommentaire(String commentaire) {
		this.commentaire = commentaire;
	}
	public int getNote() {
		return note;
	}
	public void setNote(int note) {
		this.note = note;
	}
	public ProduitM getIdProduit() {
		return idProduit;
	}
	public void setIdProduit(ProduitM idProduit) {
		this.idProduit = idProduit;
	}
	public UtilisateurM getIdUtilisateur() {
		return idUtilisateur;
	}
	public void setIdUtilisateur(UtilisateurM idUtilisateur) {
		this.idUtilisateur = idUtilisateur;
	}
	

}
