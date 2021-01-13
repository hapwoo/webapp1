package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	//http://.../webapp1/ 가 앞에 생략되어 있음
	@RequestMapping("/")
	public String home() {
		logger.info("실행");
		return "home";
	}
	
}
