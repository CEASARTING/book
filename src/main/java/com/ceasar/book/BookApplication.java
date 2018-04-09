package com.ceasar.book;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.apache.ibatis.logging.LogFactory;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.context.ApplicationContext;

@SpringBootApplication
public class BookApplication {

	// 使用log4j2打印日志
	private static final Logger m_logger = LogManager.getLogger(BookApplication.class);

	// 在子线程中依赖注入dao的时候使用
	public static ApplicationContext applicationContext;

	public static void main(String[] args) {
		applicationContext = SpringApplication.run(BookApplication.class, args);
		LogFactory.useLog4J2Logging();
		m_logger.info("|======================================================|");
		m_logger.info("|======================================================|");
		m_logger.info("|---------------(SpringBoot Start Success)-------------|");
		m_logger.info("|======================================================|");
		m_logger.info("|======================================================|");
	}
}
