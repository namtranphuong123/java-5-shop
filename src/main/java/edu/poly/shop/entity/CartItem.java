package edu.poly.shop.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class CartItem {
	private Integer id;
	private String name;
	private String image;
	private Integer quantity;
	private Double price;
	private Integer Discount;
}