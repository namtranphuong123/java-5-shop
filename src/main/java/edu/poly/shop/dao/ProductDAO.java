package edu.poly.shop.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import edu.poly.shop.entity.Product;
import edu.poly.shop.entity.Report;

public interface ProductDAO extends JpaRepository<Product, Integer> {
	/*
	 * @Query("SELECT o FROM Product o WHERE o.name LIKE ?1") Page<Product>
	 * findByKeywords(String keywords, Pageable pageable);
	 */
	Page<Product> findAllByNameLike(String keywords, Pageable pageable);
	
	@Query("SELECT new Report(o.category, sum(o.price), count(o)) "
			+ " FROM Product o "
			+ " GROUP BY o.category"
			+ " ORDER BY sum(o.price) DESC")
			List<Report> getInventoryByCategory();
}
