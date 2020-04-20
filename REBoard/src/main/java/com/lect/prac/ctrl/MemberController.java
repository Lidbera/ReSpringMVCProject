
package com.lect.prac.ctrl;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.lect.prac.domain.MemberVO;
import com.lect.prac.service.MemberService;

import util.Log;

@Controller
public class MemberController {

	@Inject
	private MemberService svc;
	
	@GetMapping("register")
	public String registerPage() {
		return "login/register";
	}

	@PostMapping("member/login")
	public String login(@ModelAttribute MemberVO vo, HttpSession session) {
		vo = svc.login(vo);
		if (vo != null) {
			session.setAttribute("logfail", false);
			session.setAttribute("id", vo.getId());
			session.setAttribute("name", vo.getName());
			return "redirect:/";
		} else {
			session.setAttribute("logfail", true);
			return "redirect:/login";
		}
	}

	@PostMapping("member/insert")
	public String insert(@ModelAttribute MemberVO vo, Model model) {
		try {
			svc.register(vo);
		} catch (Exception e) {
			Log.info(e.getMessage());
			model.addAttribute("regiscs", false);
			return "login/register";
		}
		model.addAttribute("regiscs", true);
		return "login/loginPage";
	}

	@GetMapping("member/check")
	public String selectOne(String id, Model model) {
		MemberVO vo = svc.select(id);
		if (vo == null) {
			model.addAttribute("regiidcheck", true);
		} else {
			model.addAttribute("regiidcheck", false);
		}
		return "login/regicheck";
	}

	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@PostMapping("member/modify")
	public String updateMember(@ModelAttribute String id, Model model) {
		MemberVO vo = svc.select(id);
		model.addAttribute("vo", vo);
		return "login/member";
	}

	@PostMapping("member/update")
	public String update(@ModelAttribute MemberVO vo, Model model, HttpSession session) {
		try {
			svc.modify(vo);
		} catch (Exception e) {
			model.addAttribute("memcheck", false);
		}
		session.setAttribute("id", vo.getId());
		session.setAttribute("name", vo.getName());
		model.addAttribute("memcheck", true);
		return "login/member";
	}
}
