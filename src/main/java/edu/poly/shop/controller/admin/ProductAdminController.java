package edu.poly.shop.controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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

import edu.poly.shop.dao.ProductDAO;
import edu.poly.shop.entity.Account;
import edu.poly.shop.entity.Category;
import edu.poly.shop.entity.Product;
import edu.poly.shop.service.CategoryService;
import edu.poly.shop.service.ParamService;
import edu.poly.shop.service.SessionService;

@Controller
public class ProductAdminController {
	@Autowired
	CategoryService categoryService;
	@Autowired
	ParamService paramService;
	@Autowired
	ProductDAO productDao;
	@Autowired
	SessionService session;

	@ModelAttribute("categories")
	public List<Category> getCategories() {
		return categoryService.findAll().stream().map(item -> {
			Category dto = new Category();
			BeanUtils.copyProperties(item, dto);
			return dto;
		}).collect(Collectors.toList());
	}
	
	

	@GetMapping("/admin/product_new")
	public String account(Model model) {
		model.addAttribute("PRODUCT", new Product());
		return "admin/admin_product_new";
	}


	@PostMapping("/admin/SaveProduct")
	public String save(@Valid @ModelAttribute("PRODUCT") Product pt, Errors errors, Model model,
			@RequestParam("categoryId") Integer categoryId, @RequestParam("photo") MultipartFile multipartFile)
			throws IOException {
		System.out.println(categoryId);
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng nhập các dữ liệu hợp lệ");
			if (multipartFile.isEmpty()) {
				model.addAttribute("error_photo", "Hình ảnh không được để trống");
			}
		} else {
			if (multipartFile.isEmpty()) {
				model.addAttribute("error_photo", "Hình ảnh không được để trống");
			} else {
				String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
				String uploadDir = "upload/";
				pt.setImage(fileName);
				Category category = new Category();
				category.setId(categoryId);
				pt.setCategory(category);
				productDao.save(pt);
				paramService.save(multipartFile, uploadDir);
				model.addAttribute("PRODUCT", new Product());
				model.addAttribute("messagee", "Chúc mừng bạn nhập dữ liệu thành công");
			}
		}

		return "admin/admin_product_new";
	}

	@RequestMapping("/admin/SearchProducts")
	public String searchAndPage(Model model, @RequestParam("keywordsProduct") Optional<String> kw,

			@RequestParam("p") Optional<Integer> p) {
		String kwords = kw.orElse(session.get("keywordsProduct", ""));
		session.set("keywordsProduct", kwords);
		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		Page<Product> page = productDao.findAllByNameLike("%" + kwords + "%", pageable);
		model.addAttribute("page", page);

		return "admin/admin_product_views";
	}

	@GetMapping("/admin/product_views")
	public String viewAccount(Model model, @RequestParam("p") Optional<Integer> p) {
		session.set("keywordsProduct", "");
		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		Page<Product> page = productDao.findAll(pageable);
		model.addAttribute("page", page);
		return "admin/admin_product_views";
	}

	@RequestMapping("/admin/edit_Product/{id}")
	public String edit(Model model, @PathVariable("id") Integer id) {
		Product item = productDao.findById(id).get();
		model.addAttribute("categori", item.getCategory());
		model.addAttribute("PRODUCT", item);
		return "admin/admin_product_new";
	}


	@RequestMapping("/admin/deleteProduct/{id}")
	public String create(@PathVariable("id") Integer id, RedirectAttributes prams) {
		try {
			productDao.deleteById(id);
			prams.addAttribute("message", "Đã xóa sản phẩm");
		} catch (Exception e) {
			prams.addAttribute("messagee", "Không thể xóa sản phẩm này");
		}
		return "redirect:/admin/product_views";

	}

}
