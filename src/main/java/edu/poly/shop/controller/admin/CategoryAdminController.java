package edu.poly.shop.controller.admin;

import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.poly.shop.dao.CategoryDAO;
import edu.poly.shop.entity.Category;
import edu.poly.shop.entity.Product;
import edu.poly.shop.service.ParamService;
import edu.poly.shop.service.SessionService;

@Controller
public class CategoryAdminController {
	@Autowired
	ParamService paramService;
	@Autowired
	SessionService session;
	@Autowired
	CategoryDAO categoryDao;

	@GetMapping("/admin/category")
	public String account(Model model) {
		model.addAttribute("Category", new Category());
		return "admin/admin_category_add";
	}

	@RequestMapping("/admin/SearchCategory")
	public String searchAndPageCategory(Model model, @RequestParam("keywordCategory") Optional<String> kw,
			@RequestParam("p") Optional<Integer> p) {
		String kwords = kw.orElse(session.get("keywordCategory", ""));
		session.set("keywordCategory", kwords);
		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		Page<Category> page = categoryDao.findAllByNameLike("%" + kwords + "%", pageable);
		model.addAttribute("cate", page);
		return "admin/admin_category_views";
	}
	
	@GetMapping("/admin/category_views")
	public String viewAccount(Model model, @RequestParam("p") Optional<Integer> p) {
		session.set("keywordCategory", "");
		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		Page<Category> page = categoryDao.findAll(pageable);
		model.addAttribute("cate", page);
		return "admin/admin_category_views";
	}

	@RequestMapping("/admin/editCate/{id}")
	public String edit(Model model, @PathVariable("id") Integer id) {
		Category item = categoryDao.getById(id);
		model.addAttribute("Category", item);
		return "admin/admin_category_add";
	}

	@PostMapping("/admin/SaveCategory")
	public String save(Model model, @Valid @ModelAttribute("Category") Category cate, Errors errors) {
		if (errors.hasErrors()) {
			
			model.addAttribute("message", "Vui lòng nhập đúng các dữ liệu hợp lệ");
		} else {
			categoryDao.save(cate);
			model.addAttribute("Category", new Category());
			model.addAttribute("messagee", "Chúc mừng bạn nhập dữ liệu hợp lệ");
		}

		return "admin/admin_category_add";
	}

	@RequestMapping("/admin/deletecate/{id}")
	public String delete(@PathVariable("id") Integer id, RedirectAttributes prams) {
		try {
			categoryDao.deleteById(id);
		} catch (Exception e) {
			prams.addAttribute("message", "Còn sản phẩm của thể loại này");
		}
		return "redirect:/admin/category_views";

	}

}
