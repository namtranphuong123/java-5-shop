package edu.poly.shop.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import edu.poly.shop.entity.Order;
import edu.poly.shop.entity.OrderDetail;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Long> {
	List<OrderDetail> findByOrder(Order order);
}
