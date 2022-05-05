package edu.poly.shop;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class AssignmentShopApplication {

	public static void main(String[] args) {
		SpringApplication.run(AssignmentShopApplication.class, args);
	}

}
