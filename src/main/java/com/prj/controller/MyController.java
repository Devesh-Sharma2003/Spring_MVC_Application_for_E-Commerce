package com.prj.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.RedirectView;

import com.prj.dao.ProductDao;
import com.prj.pojo.Product;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
public class MyController
{
	@Autowired
	private ProductDao dao;
	
	@RequestMapping("/")
	public String home(HttpSession s)
	{
		List<Product> li = this.dao.getAllProduct();
		s.setAttribute("product",li);
		return "index";
	}
	
	@RequestMapping(path="/addProduct",method=RequestMethod.POST)
	public String addProduct()
	{
		return "addForm";
	}
	
	@RequestMapping(path="/data",method=RequestMethod.POST)
	public RedirectView dataHandle(@ModelAttribute Product prd,HttpServletRequest request)
	{
		RedirectView rd = new RedirectView();
		this.dao.insertProduct(prd);
		//this is to get the name of the project as it gets remove in URL and after name it places '/'
		rd.setUrl(request.getContextPath()+"/");
		return rd;
	}
	
	@RequestMapping("/delete/{id}")
	public RedirectView deleteMaro(@PathVariable("id") int id,HttpServletRequest request)
	{
		RedirectView rd = new RedirectView();
		this.dao.deleteProduct(id);
		//this is to get the name of the project as it gets remove in URL and after name it places '/'
		rd.setUrl(request.getContextPath()+"/");
		return rd;
	}
	
	@RequestMapping("update/{id}")
	public String update(@PathVariable("id")int id,Model m)
	{
		Product p = this.dao.getProduct(id);
		m.addAttribute("pro", p);
		return "updateForm";
	}
}
