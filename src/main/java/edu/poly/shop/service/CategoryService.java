package edu.poly.shop.service;

import java.util.List;
import java.util.Optional;

import edu.poly.shop.entity.Account;
import edu.poly.shop.entity.Category;

public interface CategoryService {

	void deleteAll();

	void deleteAll(List<Category> entities);

	void deleteAllById(List<Integer> ids);

	void delete(Category entity);

	void deleteById(Integer id);

	long count();

	List<Category> findAllById(List<Integer> ids);

	List<Category> findAll();

	boolean existsById(Integer id);

	Optional<Category> findById(Integer id);

	List<Category> saveAll(List<Category> entities);

	Category save(Category entity);


}
