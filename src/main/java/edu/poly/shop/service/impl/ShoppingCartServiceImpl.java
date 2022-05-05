package edu.poly.shop.service.impl;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import edu.poly.shop.entity.CartItem;
import edu.poly.shop.service.ShoppingCartService;

@Service
@SessionScope
public class ShoppingCartServiceImpl implements ShoppingCartService {
	private Map<Integer, CartItem> map = new HashMap<Integer, CartItem>();

	@Override
	public void add(CartItem item) {
		CartItem existed = map.get(item.getId());
		if (existed != null) {
			existed.setQuantity(item.getQuantity() + existed.getQuantity());
		} else
			map.put(item.getId(), item);
	}

	@Override
	public void remove(int id) {
		map.remove(id);
	}

	@Override
	public Collection<CartItem> getCartItems() {
		return map.values();
	}

	@Override
	public void clear() {
		map.clear();
	}

	@Override
	public void update(int id, int quantity) {
		CartItem item = map.get(id);
		item.setQuantity(quantity);
		if (item.getQuantity() <= 0) {
			map.remove(id);
		}

	}

	@Override
	public double getAmount() {
		return map.values().stream()
				.mapToDouble(item -> item.getPrice() * item.getQuantity() * ((100 - item.getDiscount()) * 0.01)).sum();
		/*
		 * return map.values().stream().mapToDouble(item -> item.getQuantity() *
		 * item.getPrice()).sum();
		 */
		// map.values().stream().mapToDouble(item->item.getQuantity(*item.getPrice()).sum();
		// map.values().stream().mapToDouble(item->item.getQuantity() *
		// item.getPrice()).sum();
	}

	@Override
	public int getCount() {
//  if(map.isEmpty()){
//      return 0;
//  }
		return map.values().size();
	}
}
