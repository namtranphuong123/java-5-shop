package edu.poly.shop.controller.user;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.poly.shop.dao.AccountDAO;
import edu.poly.shop.entity.Account;
import edu.poly.shop.service.MailerService;

@Controller
public class MailerController {
	@Autowired
	AccountDAO accountDao;
	@Autowired
	MailerService mailer;

	@RequestMapping("/user/passwordMail")
	public String email(Model model) {
		return "user/user_send_mail";
	}

	@RequestMapping("/user/passwordMaill")
	public String demo(Model model, @RequestParam("email") String email) throws MessagingException {
		if (email.equals("")) {
			model.addAttribute("message", "Không được để trống email");
			return "user/user_send_mail";
		} else {
			try {
				Account account = accountDao.findByEmail(email);
				mailer.queue(email, "Mật khẩu", account.getPassword());
				model.addAttribute("mess", "Mật khẩu của bạn đã được gửi bên email, hãy đăng nhập ngay!");
				System.out.println("Đã gửi");

			} catch (Exception e) {
				model.addAttribute("message", "Không có tài khoản đăng ký email này");
				return "user/user_send_mail";
			}
		}
		return "user/user_login";

	}
}
