package modele;

import java.util.ArrayList;


public class PanierM {
	public ArrayList<PanierDetailsM> articles = new ArrayList<>();

	public PanierM(ArrayList<PanierDetailsM> articles) {
		super();
		this.articles = articles;
	}

	public PanierM() {
		super();
	}

	@Override
	public String toString() {
		return "PanierM [articles=" + articles + "]";
	}
	
	public int count() {
		return this.articles.size();
	}
	
	public void add(PanierDetailsM p) {
		boolean exist=false;
		for(PanierDetailsM panierDetails:articles) {
			if(panierDetails.getProduit().getId()==p.getProduit().getId()) {
				exist=true;
				panierDetails.setQuantite(panierDetails.getQuantite()+p.getQuantite());
			}
		}
		if(exist==false) {
			articles.add(p);
		}
	}
	
	public void update(PanierDetailsM p) {
		for(PanierDetailsM panierDetails:articles) {
			if(panierDetails.getProduit().getId()==p.getProduit().getId()) {
				
				panierDetails.setQuantite(p.getQuantite());
			}
		}
	}
	
	public float prixTotal() {
		float prixTotal = 0;
		for (PanierDetailsM panierDetails : articles) {
			prixTotal += panierDetails.getProduit().getPrix() * panierDetails.getQuantite();
		}
		
		return prixTotal;
	}
	
	public void delete(int idProduit) {
		PanierDetailsM detail = new PanierDetailsM();
		for (PanierDetailsM panierDetails : articles) {
			if (panierDetails.getProduit().getId() == idProduit) {
				detail = panierDetails;
			}
		}
		articles.remove(detail);
	}
	
	public void empty() {
		articles = new ArrayList<>();
	}
}
