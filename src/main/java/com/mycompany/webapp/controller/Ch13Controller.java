package com.mycompany.webapp.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.service.Ch13Service1;
import com.mycompany.webapp.service.Ch13Service2;
import com.mycompany.webapp.service.Ch13Service3;
import com.mycompany.webapp.service.Ch13Service4;
import com.mycompany.webapp.service.Ch13Service5;
import com.mycompany.webapp.service.Ch13Service6;
import com.mycompany.webapp.service.Ch13Service7;

@Controller/*("ch13Controller")*/
@RequestMapping("/ch13")
public class Ch13Controller {
	
	//Field ----------------------------------
	private static final Logger logger = LoggerFactory.getLogger(Ch13Controller.class);
	
	//주입하는 방법1 --> 가장 많이 씁니당
//	@Resource // Ch13Controller객체를 생성할 때 IoC 컨테이너가 관리객체 중에서 이 클래스 파일이 있느냐! 를 확인 후 주입
	private Ch13Service1 service1;
	
//	@Resource
	private Ch13Service2 service2;
	
	
	private Ch13Service3 service3;
	
	
	private Ch13Service4 service4;
	
	@Resource
	private Ch13Service5 service5;
	
	
	@Resource private Ch13Service6 service6; // 얜 xml에서 했다는데 ?ㅠ
	
	@Resource
	private Ch13Service7 service7;
	
	
	//주입하는 방법2
	//Constructor ----------------------------
/*	@Autowired // IoC가 관리하는 객체 중에서 Ch13Service1 라는 객체가 있으면 ~!
	public Ch13Controller(Ch13Service1 service1) {
		logger.info("실행"); // 서버만 실행하면 아무것도 안했는데 출력됨 <init>
		this.service1 = service1;
	} */
	
	//-------- 두개 동시에 주입하기
/*	@Autowired
	public Ch13Controller(Ch13Service1 service1, Ch13Service2 service2) {
		logger.info("실행");
		this.service1 = service1;
		this.service2 = service2;
	} */
	
	
	
	//Method ---------------------------------
	//주입하는 방법3
	@Autowired
	public void setService1(Ch13Service1 service1) {
		logger.info("실행");  // 서버만 실행하면 아무것도 안했는데 출력됨 setService1
		this.service1 = service1;
	}
	
	@Autowired
	public void setService2(Ch13Service2 service2) {
		logger.info("실행"); 
		this.service2 = service2;
	}
	
	
	public void setService3(Ch13Service3 service3) {
		logger.info("실행"); 
		this.service3 = service3;
	}
	

	public void setService4(Ch13Service4 service4) {
		logger.info("실행"); 
		this.service4 = service4;
	}
	

	@GetMapping("/content")
	public String content() {
		logger.info("실행");
		return "ch13/content";
	}
	
	@GetMapping("/service1")
	public String service1() {
		logger.info("실행");
		service1.method();
		return "redirect:/ch13/content";
		//redirect가 안붙은경우 jsp가 실행되는거라 주소는 /service로 출력이 되며
		//redirect가 붙은 경우에는 리다이렉트하므로 /content로 출력이됨 (주소가)
	}
	
	@GetMapping("/service2")
	public String service2() {
		logger.info("실행");
		service2.method();
		return "redirect:/ch13/content";
	}
	
	@GetMapping("/service3")
	public String service3() {
		logger.info("실행");
		service3.method();
		return "redirect:/ch13/content";
	}
	
	@GetMapping("/service4")
	public String service4() {
		logger.info("실행");
		service4.method();
		return "redirect:/ch13/content";
	}

	@GetMapping("/service5")
	public String service5() {
		logger.info("실행");
		service5.method();
		return "redirect:/ch13/content";
	}
	
	@GetMapping("/service6")
	public String service6() {
		logger.info("실행");
		service6.method();
		return "redirect:/ch13/content";
	}
	
	
	@GetMapping("/fileupload")
	public String fileupload(@Value("${fileupload}") String saveDirPath) {
		logger.info("실행");
		
		//String saveFilePath = "D:/MyWorkspace/fileupload/"; (x)
		logger.info("fileupload: " + saveDirPath);
		service7.method();
		return "redirect:/ch13/content";
	}
	
}
