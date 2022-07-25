package modele;

import java.util.ArrayList;
import java.util.Iterator;

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
		boolean exist = false;
		for (PanierDetailsM panierDetailsM : articles) {
			if (panierDetailsM.getProduit().getId() == p.getProduit().getId()) {
				exist = true;
				panierDetailsM.setQuantite(panierDetailsM.getQuantite()+p.getQuantite());
			}
			if (exist = false) {
				articles.add(p);
			}
		}
	}
	
	public double prixTotal() {
		double prixTotal = 0;
		for (PanierDetailsM panierDetailsM : articles) {
			prixTotal += panierDetailsM.getProduit().getPrix() * panierDetailsM.getQuantite();
		}
		
		return prixTotal;
	}
	
	public void delete(int idProduit) {
		PanierDetailsM detail = new PanierDetailsM();
		for (PanierDetailsM panierDetailsM : articles) {
			if (panierDetailsM.getProduit().getId() == idProduit) {
				detail = panierDetailsM;
			}
		}
		articles.remove(detail);
	}
	
	public void empty() {
		articles = new ArrayList<>();
	}
}
