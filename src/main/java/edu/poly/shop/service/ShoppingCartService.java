package edu.poly.shop.service;

import java.util.Collection;

import edu.poly.shop.entity.CartItem;

public interface ShoppingCartService {

	int getCount();

	double getAmount();

	void update(int id, int quantity);

	void clear();

	Collection<CartItem> getCartItems();

	void remove(int id);

	void add(CartItem item);

}
