package edu.poly.shop.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.poly.shop.dao.CategoryDAO;
import edu.poly.shop.entity.Category;
import edu.poly.shop.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	CategoryDAO categoryDao;

	@Override
	public Category save(Category entity) {
		return categoryDao.save(entity);
	}

	@Override
	public List<Category> saveAll(List<Category> entities) {
		return (List<Category>) categoryDao.saveAll(entities);
	}

	@Override
	public Optional<Category> findById(Integer id) {
		return categoryDao.findById(id);
	}

	@Override
	public boolean existsById(Integer id) {
		return categoryDao.existsById(id);
	}

	@Override
	public List<Category> findAll() {
		return (List<Category>) categoryDao.findAll();
	}

	@Override
	public List<Category> findAllById(List<Integer> ids) {
		return (List<Category>) categoryDao.findAllById(ids);
	}

	@Override
	public long count() {
		return categoryDao.count();
	}

	@Override
	public void deleteById(Integer id) {
		categoryDao.deleteById(id);
	}

	@Override
	public void delete(Category entity) {
		categoryDao.delete(entity);
	}

	@Override
	public void deleteAllById(List<Integer> ids) {
		categoryDao.deleteAllById(ids);
	}

	@Override
	public void deleteAll(List<Category> entities) {
		categoryDao.deleteAll(entities);
	}

	@Override
	public void deleteAll() {
		categoryDao.deleteAll();
	}
}
