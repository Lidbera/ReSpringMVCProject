package com.lect.prac.ctrl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import util.Log;

@Controller
public class HomeController {
	@GetMapping("/")
	public String home() {
		return "main/home";
	}
	@GetMapping("/index")
	public String home2() {
		return "main/home";
	}
	
	@GetMapping("/login")
	public String login() {
		return "login/loginPage";
	}
	
	@GetMapping("/login/register")
	public String register() {
		return "login/register";
	}
}
