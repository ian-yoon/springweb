package com.example.project01.controller.pdf;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.project01.service.PdfService;

@Controller
@RequestMapping("/pdf/*")
public class PdfController {
	
	@Inject
	PdfService pdfService;
	
	@RequestMapping("list.do")
	public ModelAndView list(HttpSession session) throws Exception {
		String userid=(String)session.getAttribute("userid");
		String name=(String)session.getAttribute("name");
		String result = pdfService.createPdf(userid, name);
		return new ModelAndView("pdf/result", "message", result);
	}

}
