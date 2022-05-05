package edu.poly.shop.controller.admin;

import java.io.IOException;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.poly.shop.dao.AccountDAO;
import edu.poly.shop.entity.Account;
import edu.poly.shop.service.SessionService;

@Controller
public class PasswordAdminController {
	@Autowired
	AccountDAO accountDao;
	@Autowired
	SessionService session;

	@RequestMapping("/admin/editPassword/{id}")
	public String editPasswordAdmin(Model model, @PathVariable("id") String id) {
		Account item = accountDao.findById(id).get();
		model.addAttribute("ACCOUNTS", item);
		return "admin/admin_account_password";
	}

	@RequestMapping("/admin/updatePassword")
	public String doLoginAdmin(@ModelAttribute("ACCOUNTS") Account ac, Model model,
			@RequestParam("password") String password, @RequestParam("passwordnew") String passwordnew,
			@RequestParam("passwordnew1") String passwordnew1) {
		try {
			Account account = accountDao.findById(ac.getUsername()).get();
			if (account.getPassword().equals(password)) {
				if (passwordnew.equals("")) {
					model.addAttribute("mess", "Mật khẩu mới không được rỗng");
				} else {
					if (passwordnew.equals(passwordnew1)) {
						ac.setActivated(account.getActivated());
						ac.setAdmin(account.getAdmin());
						ac.setEmail(account.getEmail());
						ac.setFullname(account.getFullname());
						ac.setPassword(passwordnew);
						ac.setPhoto(account.getPhoto());
						ac.setAddress(account.getAddress());
						ac.setPhone(account.getPhone());
						accountDao.save(ac);
						Account item = accountDao.findById(ac.getUsername()).get();
						model.addAttribute("ACCOUNTS", item);
						model.addAttribute("message", "Cập nhật mật khẩu thành công");
					} else {
						model.addAttribute("mess", "Mật khẩu mới không khớp nhau");
					}
				}
			} else {
				model.addAttribute("mess", "Mật khẩu hiện tại không đúng");
			}
		} catch (Exception e) {
			return "admin/admin_account_password";
		}

		return "admin/admin_account_password";
	}

}
