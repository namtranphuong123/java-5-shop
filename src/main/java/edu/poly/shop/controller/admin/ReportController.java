package edu.poly.shop.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.poly.shop.dao.ProductDAO;
import edu.poly.shop.entity.Report;

@Controller
public class ReportController {

	@Autowired
	ProductDAO dao;

	@RequestMapping("/admin/report")
	public String inventory(Model model) {
		List<Report> items = dao.getInventoryByCategory();
		model.addAttribute("items", items);
		return "admin/admin_account_report";
	}

}
