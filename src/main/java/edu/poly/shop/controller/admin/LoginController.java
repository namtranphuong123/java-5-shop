package edu.poly.shop.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.poly.shop.dao.AccountDAO;
import edu.poly.shop.dao.ProductDAO;
import edu.poly.shop.entity.Account;
import edu.poly.shop.entity.Report;
import edu.poly.shop.service.CookieService;
import edu.poly.shop.service.ParamService;
import edu.poly.shop.service.SessionService;
import edu.poly.shop.service.ShoppingCartService;

@Controller
public class LoginController {
	@Autowired
	AccountDAO accountDao;
	@Autowired
	ProductDAO dao;
	@Autowired
	CookieService cookieService;
	@Autowired
	SessionService session;
	@Autowired
	ParamService paramService;
	@Autowired
	ShoppingCartService shoppingCartService;

	@GetMapping("/admin/index")
	public String index(Model model) {
		List<Report> items = dao.getInventoryByCategory();
		model.addAttribute("items", items);
		return "admin/main";
	}

	@GetMapping("/user/login")
	public String login() {
		return "user/user_login";
	}

	@RequestMapping("/user/dologin")
	public String doLogin(Model model, @RequestParam("username") String username,
			@RequestParam("password") String password) {
		try {
			boolean remember = paramService.getBoolean("remember", false);
			Account account = accountDao.findById(username).get();
			if (account != null) {
				if (account.getPassword().equals(password)) {
					if (account.getAdmin()) {
						session.set("user", account);
						if (remember) {
							cookieService.add("userr", username, 10);
							cookieService.add("passs", password, 10);
							System.out.println("luu cookie ok");
						} else {
							cookieService.remove("userr");
							cookieService.remove("passs");

						}
						return "redirect:/admin/index";
					} else {
						String uri = session.get("uriback");
						if (uri != null) {
							if (remember) {
								cookieService.add("userr", username, 10);
								cookieService.add("passs", password, 10);
								System.out.println("luu cookie ok");
							} else {
								cookieService.remove("userr");
								cookieService.remove("passs");

							}
							session.remove("uriback");
							session.set("user", account);
							return "redirect:" + uri;
						} else {

							if (remember) {
								cookieService.add("userr", username, 10);
								cookieService.add("passs", password, 10);
								System.out.println("luu cookie ok");
							} else {
								cookieService.remove("userr");
								cookieService.remove("passs");

							}
							session.set("user", account);
							return "redirect:/user/index";
						}
					}
				} else {
					model.addAttribute("mess", "Mật khẩu không đúng");
				}
			} else {
				model.addAttribute("mess", "Tài khoản không tồn tại");
			}
		} catch (Exception e) {
			model.addAttribute("mess", "Tài khoản không tồn tại");
			return "user/user_login";
		}

		return "user/user_login";
	}

	@GetMapping("/user/logout")
	public String logout() {
		session.remove("user");
		shoppingCartService.clear();
		return "redirect:/user/index";
	}

}
