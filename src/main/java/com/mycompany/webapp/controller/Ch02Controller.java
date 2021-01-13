package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/ch02")
public class Ch02Controller {
		private static final Logger logger = LoggerFactory.getLogger(Ch01Controller.class);
		
		@RequestMapping("/content")
		public String content() {
			logger.info("실행");
			return "ch02/content";
		}
		
		// @RequestMapping("/request1") //GET, POST 둘다 지원/ 밸류값이 하나밖에 없는 경우 생략가능
		// @RequestMapping(value="/getMethod_", method=RequestMethod.POST) //POST만 지원
		@RequestMapping(value="/getMethod_", method=RequestMethod.GET) //GET만 지원
		public String get_Method() {
			logger.info("실행");
			return "ch02/content";
		}
		
		@RequestMapping(value="/postMethod_", method=RequestMethod.POST)
		public String post_Method() {
			logger.info("실행");
			return "ch02/content";
		}
		
	//	@RequestMapping(value="/join", method=RequestMethod.GET)
		@GetMapping("/join")
		public String joinForm() {
			logger.info("회원가입 페이지로 이동");
			return "ch02/joinForm";
		}
		
	//	@RequestMapping(value="/joinAsync", method=RequestMethod.GET)
		@GetMapping("/joinAsync")
		public String joinFormAsync() {
			logger.info("회원가입 페이지로 이동");
			return "ch02/joinFormAsync";
		}
		
	//	@RequestMapping(value="/join", method=RequestMethod.POST)
		@PostMapping("/join")
		public String join() {
			logger.info("회원가입 처리함");
			return "ch02/content";
		}
}
