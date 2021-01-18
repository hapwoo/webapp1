package com.mycompany.webapp.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;


@Service //component scan의 대상이 됨 (-> 자동적으로 관리객체가 됨) @Service @component,@Repository로 마찬가지
public class Ch13Service2 {
	private static final Logger logger = LoggerFactory.getLogger(Ch13Service2.class);
	
	public void method() {
		logger.info("실행");
	}
}
