package com.example.project01.controller.shop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project01.model.shop.DrugDAO;
import com.example.project01.model.shop.DrugDTO;
import com.example.project01.service.BoardService;
import com.example.project01.service.PageUtil;

@Controller
@RequestMapping("/shop/drug/*")
public class DrugController {
	
	@Inject
	BoardService boardService;
	
	@Inject
	DrugDAO drugDao;
	
	@RequestMapping("write.do")
	public String write() {
		return "shop/drug_write";
	}
	
	@RequestMapping("insert.do")
	public String insert(DrugDTO dto) {
		drugDao.insert(dto);
		return "redirect:/shop/drug/list.do";
	}
	
	@RequestMapping("list.do")
	public ModelAndView list(ModelAndView mav) {
		mav.setViewName("/shop/drug_list");
		mav.addObject("list", drugDao.list());
		return mav;
	}
	
	@RequestMapping("search_list.do")
	public ModelAndView list(@RequestParam(defaultValue = "1") int curPage, @RequestParam(defaultValue = "productName") String search_option, @RequestParam(defaultValue = "") String keyword) {
		int count = boardService.count(search_option, keyword);
		PageUtil page_info = new PageUtil(count, curPage);
		int start = page_info.getPageBegin();
		int end = page_info.getPageEnd();
		List<DrugDTO> list = boardService.search_list(start, end, search_option, keyword);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/shop/drug_list");
//		Map<String, Object> map = new HashMap<>();
//		map.put("list", list);
//		map.put("count", count);
//		map.put("search_option", search_option);
//		map.put("keyword", keyword);
//		map.put("page_info", page_info);
		mav.addObject("count", count);
		mav.addObject("search_option", search_option);
		mav.addObject("keyword", keyword);
		mav.addObject("page_info", page_info);
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping("edit/{drug_code}")
	public ModelAndView edit(@PathVariable("drug_code") int drug_code, ModelAndView mav) {
		mav.setViewName("/shop/drug_edit");
		mav.addObject("dto", drugDao.detail(drug_code));
		return mav;
	}
	
	@RequestMapping("update.do")
	public String update(DrugDTO dto) {
		drugDao.update(dto);
		return "redirect:/shop/drug/list.do";
	}
	
	@RequestMapping("delete.do")
	public String delete(int drug_code) {
		drugDao.delete(drug_code);
		return "redirect:/shop/drug/list.do";
	}
		
	@RequestMapping("detail/{drug_code}")
	public ModelAndView detail(@PathVariable int drug_code, ModelAndView mav) {
		mav.setViewName("/shop/drug_detail");
		mav.addObject("dto", drugDao.detail(drug_code));
		return mav;
	}
	
//	@RequestMapping("detail/{drug_code}")
//	public ModelAndView detail(int drug_code, int cur_page, String search_option, String keyword) {
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("/shop/drug_detail");
//		mav.addObject("dto", drugDao.detail(drug_code));
//		mav.addObject("cur_page", cur_page);
//		mav.addObject("search_option", search_option);
//		mav.addObject("keyword", keyword);
//		return mav;
//	}

}



//package com.example.project01.controller.shop;
//
//import javax.inject.Inject;
//import javax.servlet.http.HttpServletRequest;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.example.project01.model.shop.DrugDAO;
//import com.example.project01.model.shop.DrugDTO;
//
//@Controller
//@RequestMapping("/shop/drug/*")
//public class DrugController {
//	
//	@Inject
//	DrugDAO drugDao;
//	
//	@RequestMapping("write.do")
//	public String write() {
//		return "shop/drug_write";
//	}
//	
//	@RequestMapping("insert.do")
//	public String insert(DrugDTO dto) {
//		drugDao.insert(dto);
//		return "redirect:/shop/drug/list.do";
//	}
//	
//	@RequestMapping("list.do")
//	public ModelAndView list(ModelAndView mav) {
//		mav.setViewName("/shop/drug_list");
//		mav.addObject("list", drugDao.list());
//		return mav;
//	}
//	
//	@RequestMapping("edit/{drug_code}")
//	public ModelAndView edit(@PathVariable("drug_code") int drug_code, ModelAndView mav) {
//		mav.setViewName("/shop/drug_edit");
//		mav.addObject("dto", drugDao.detail(drug_code));
//		return mav;
//	}
//	
//	@RequestMapping("update.do")
//	public String update(DrugDTO dto) {
//		drugDao.update(dto);
//		return "redirect:/shop/drug/list.do";
//	}
//	
//	@RequestMapping("delete.do")
//	public String delete(int drug_code) {
//		drugDao.delete(drug_code);
//		return "redirect:/shop/drug/list.do";
//	}
//	
//	@RequestMapping("detail/{drug_code}")
//	public ModelAndView detail(@PathVariable int drug_code, ModelAndView mav) {
//		mav.setViewName("/shop/drug_detail");
//		mav.addObject("dto", drugDao.detail(drug_code));
//		return mav;
//	}
//
//}
