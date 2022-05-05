package edu.poly.shop.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import edu.poly.shop.entity.Category;


public interface CategoryDAO extends JpaRepository<Category, Integer> {
	Page<Category> findAllByNameLike(String keywords, Pageable pageable);
    }



