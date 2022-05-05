package edu.poly.shop.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.poly.shop.dao.AccountDAO;
import edu.poly.shop.dao.OrderDAO;
import edu.poly.shop.dao.OrderDetailDAO;
import edu.poly.shop.dao.ProductDAO;
import edu.poly.shop.entity.Order;
import edu.poly.shop.entity.OrderDetail;
import edu.poly.shop.service.SessionService;
import edu.poly.shop.service.ShoppingCartService;

@Controller
public class OrdersAdminController {
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

	@RequestMapping("/admin/oder")
	public String shoppingCartOrder(Model model, @RequestParam("p") Optional<Integer> p) {
		session.set("keywordsOrders", "");
		Pageable pageable = PageRequest.of(p.orElse(0), 9);
		Page<Order> page = orderDao.findAll(pageable);
		model.addAttribute("Orderss", page);
		return "admin/admin_orders_views";
	}

	@RequestMapping("/admin/SearchOrders")
	public String searchAndPageOrder(Model model, @RequestParam("keywordsOrders") Optional<String> kw,
			@RequestParam("p") Optional<Integer> p) {
		String kwords = kw.orElse(session.get("keywordsOrders", ""));
		session.set("keywordsOrders", kwords);
		Pageable pageable = PageRequest.of(p.orElse(0), 9);
		Page<Order> page = orderDao.findByAccountFullnameLike("%" + kwords + "%", pageable);
		model.addAttribute("Orderss", page);
		return "admin/admin_orders_views";
	}

	@RequestMapping("/admin/oderDetails/{id}")
	public String shoppingCartOrderDetails(Model model, @PathVariable("id") Long id) {
		Order od = orderDao.findById(id).get();
		List<OrderDetail> item = orderDetailDao.findByOrder(od);
		model.addAttribute("OrderDetailss", item);
		return "admin/admin_orders_details_views";
	}

	@RequestMapping("/admin/edit_orders/{id}")
	public String edit(Model model, @PathVariable("id") Long id) {
		Order od = orderDao.findById(id).get();
		model.addAttribute("Orderss", od);
		return "admin/admin_orders_edit";
	}

	@PostMapping("/admin/SaveOrders")
	public String save(Model model, @ModelAttribute("Orderss") Order orders) {
		Order od = orderDao.findById(orders.getId()).get();
		orders.setAccount(od.getAccount());
		orders.setAmount(od.getAmount());
		orders.setAddress(od.getAddress());
		orders.setOrderDetails(od.getOrderDetails());
		orderDao.save(orders);
		Order item = orderDao.findById(orders.getId()).get();
		model.addAttribute("Orderss", item);

		model.addAttribute("messagee", "Đã xác nhận đơn hàng thành công");

		return "admin/admin_orders_edit";
	}
}
