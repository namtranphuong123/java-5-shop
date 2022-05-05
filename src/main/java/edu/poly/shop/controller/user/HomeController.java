package edu.poly.shop.controller.user;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.poly.shop.dao.AccountDAO;
import edu.poly.shop.dao.ProductDAO;
import edu.poly.shop.entity.Account;
import edu.poly.shop.entity.Product;
import edu.poly.shop.service.SessionService;
import edu.poly.shop.service.ShoppingCartService;

@Controller
public class HomeController {
	@Autowired
	ProductDAO productDAO;
	@Autowired
	SessionService session;
	@Autowired
	ShoppingCartService shoppingCartService;

	@RequestMapping("/user/index")
	public String index(Model model, @RequestParam("p") Optional<Integer> p) {
		session.set("keywords", "");
		Pageable pageable = PageRequest.of(p.orElse(0), 8);
		Page<Product> page = productDAO.findAll(pageable);
		model.addAttribute("page", page);
		model.addAttribute("Count", shoppingCartService.getCount());
		return "user/main";
	}

	@RequestMapping("/user/search")
	public String searchAndPage(Model model, @RequestParam("keywords") Optional<String> kw,
			@RequestParam("p") Optional<Integer> p) {
		String kwords = kw.orElse(session.get("keywords", ""));
		session.set("keywords", kwords);
		Pageable pageable = PageRequest.of(p.orElse(0), 8);
		Page<Product> page = productDAO.findAllByNameLike("%" + kwords + "%", pageable);
		model.addAttribute("page", page);
		return "user/main";
		
	}

	@GetMapping("/user/about")
	public String about() {
		return "user/about";
	}
}
