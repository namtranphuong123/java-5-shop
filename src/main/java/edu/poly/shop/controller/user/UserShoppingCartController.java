package edu.poly.shop.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.poly.shop.dao.AccountDAO;
import edu.poly.shop.dao.OrderDAO;
import edu.poly.shop.dao.OrderDetailDAO;
import edu.poly.shop.dao.ProductDAO;
import edu.poly.shop.entity.Account;
import edu.poly.shop.entity.Order;
import edu.poly.shop.entity.OrderDetail;
import edu.poly.shop.service.SessionService;
import edu.poly.shop.service.ShoppingCartService;

@Controller
public class UserShoppingCartController {
	@Autowired
	ProductDAO dao;
	@Autowired
	ShoppingCartService shoppingCartService;
	@Autowired
	SessionService session;
	@Autowired
	AccountDAO accountDao;
	@Autowired
	OrderDAO orderDao;
	@Autowired
	OrderDetailDAO orderDetailDao;

	@RequestMapping("/user/oder/{id}")
	public String shoppingCartOrder(Model model, @PathVariable("id") String id) {
		Account acc = accountDao.findById(id).get();
		List<Order> item = orderDao.findByAccount(acc);
		model.addAttribute("Orderss", item);
		return "user/user_account_shopping";
	}

	@RequestMapping("/user/oderDetails/{id}")
	public String shoppingCartOrderDetails(Model model, @PathVariable("id") Long id) {
		Order od = orderDao.findById(id).get();
		List<OrderDetail> item = orderDetailDao.findByOrder(od);
		model.addAttribute("OrderDetailss", item);
		return "user/user_account_shopping_details";
	}
}
