package edu.poly.shop.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import edu.poly.shop.entity.Account;
import edu.poly.shop.entity.Order;

public interface OrderDAO extends JpaRepository<Order, Long> {
	List<Order> findByAccount(Account account);

	Page<Order> findByAccountFullnameLike(String keywords, Pageable pageable);
}