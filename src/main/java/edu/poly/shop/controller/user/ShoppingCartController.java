package edu.poly.shop.controller.user;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.poly.shop.dao.AccountDAO;
import edu.poly.shop.dao.OrderDAO;
import edu.poly.shop.dao.OrderDetailDAO;
import edu.poly.shop.dao.ProductDAO;
import edu.poly.shop.entity.Account;
import edu.poly.shop.entity.CartItem;
import edu.poly.shop.entity.Order;
import edu.poly.shop.entity.OrderDetail;
import edu.poly.shop.entity.Product;
import edu.poly.shop.service.SessionService;
import edu.poly.shop.service.ShoppingCartService;

@Controller
public class ShoppingCartController {
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

	@RequestMapping("/shoppingCart/index")
	public String shoppingCart(Model model) {

		Collection<CartItem> cartItems = shoppingCartService.getCartItems();
		model.addAttribute("items", cartItems);
		model.addAttribute("total", shoppingCartService.getAmount());
		model.addAttribute("NoOfItem", shoppingCartService.getCount());
		model.addAttribute("Count", shoppingCartService.getCount());
		return "user/shoppingCart";
	}

	@RequestMapping(value = "/shoppingCart/add/{id}")
	public String add(Model model, @PathVariable("id") Integer id) {
		Product product = dao.findById(id).get();
		CartItem item = new CartItem();
		BeanUtils.copyProperties(product, item);
		item.setQuantity(1);
		item.setId(product.getId());
		shoppingCartService.add(item);
		return "redirect:/shoppingCart/index";
	}

	@RequestMapping("/remove/{id}")
	public String remove(@PathVariable("id") Integer id) {
		shoppingCartService.remove(id);
		return "redirect:/shoppingCart/index";
	}

	@RequestMapping("/shoppingCart/checkout")
	public String shoppingCartCheckOut(Model model) {
		Collection<CartItem> cartItems = shoppingCartService.getCartItems();
		model.addAttribute("carttItems", cartItems);
		model.addAttribute("UserCheckout", session.get("user"));
		model.addAttribute("Countt", shoppingCartService.getCount());
		model.addAttribute("totall", shoppingCartService.getAmount());
		return "user/user_checkout";
	}

	@RequestMapping("/cart/checkout")
	public String checkout(@ModelAttribute("UserCheckout") Account UserCheckout, Model model,
			RedirectAttributes prams) {
		if (UserCheckout.getPhone().equals("") || UserCheckout.getPhone().length() != 10) {
			Collection<CartItem> cartItems = shoppingCartService.getCartItems();
			model.addAttribute("carttItems", cartItems);
			model.addAttribute("Countt", shoppingCartService.getCount());
			model.addAttribute("totall", shoppingCartService.getAmount());
			model.addAttribute("messagePhone", "Vui lòng nhập đúng số điện thoại");
			model.addAttribute("message", "Vui lòng nhập các dữ liệu hợp lệ");
			if (UserCheckout.getAddress().equals("")) {
				model.addAttribute("messageAddress", "Vui lòng nhập đúng địa chỉ");
			}
		} else {
			if (UserCheckout.getAddress().equals("")) {
				Collection<CartItem> cartItems = shoppingCartService.getCartItems();
				model.addAttribute("carttItems", cartItems);
				model.addAttribute("Countt", shoppingCartService.getCount());
				model.addAttribute("totall", shoppingCartService.getAmount());
				model.addAttribute("messageAddress", "Vui lòng nhập đúng địa chỉ");
				model.addAttribute("message", "Vui lòng nhập các dữ liệu hợp lệ");
			} else {
				Account curentAcc = null;
				if (accountDao.findById(UserCheckout.getUsername()).isPresent()) {
					Order ord = new Order();
					ord.setAccount(UserCheckout);
					ord.setCreateDate(new Date());
					ord.setAddress(UserCheckout.getAddress());
					ord.setAmount(shoppingCartService.getAmount());
					ord.setAvailable(false);
					orderDao.save(ord);
					for (CartItem item : shoppingCartService.getCartItems()) {
						OrderDetail od = new OrderDetail();
						od.setOrder(ord);
						Product p = dao.getById(item.getId());
						od.setProduct(p);
						od.setPrice(item.getPrice() * (100 - item.getDiscount()) * 0.01);
						od.setQuantity(item.getQuantity());
						orderDetailDao.save(od);
					}
					shoppingCartService.clear();
				}
				prams.addAttribute("messageCheckOut", "Bạn đã đặt hàng thành công");
				return "redirect:/shoppingCart/index";
			}
		}
		return "user/user_checkout";
	}

	@PostMapping("/shoppingCart/update")
	public String update(@RequestParam("id") Integer id, @RequestParam("quantity") Integer quantity) {
		shoppingCartService.update(id, quantity);
		return "redirect:/shoppingCart/index";
	}
}
