package jyc.medical.controller;


import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jyc.medical.domain.AuthVO;
import jyc.medical.domain.MemberVO;
import jyc.medical.service.MemberService;
import lombok.AllArgsConstructor;
// import lombok.extern.log4j.Log4j;

@Controller
// @Log4j
@AllArgsConstructor
public class CommonController {
	
	private MemberService service;
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		
		model.addAttribute("msg", "Access Denied");
		
	}
	
	@RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST})
	public void loginInput(String error, String logout, Model model) {
		
		if(error != null) model.addAttribute("error", "Login Error Check Your Account");
		if(logout != null) model.addAttribute("logout", "Logout!!");
		
	}
	
	@GetMapping("/join")
	public void join() { 

	}

	@PostMapping("/join")
	public String join(MemberVO member, AuthVO auth, RedirectAttributes rttr, Model model) {
		
		service.join(member, auth);
		
		rttr.addFlashAttribute("loginAlert", "join");
		
		return "redirect:/login";
		
	}
	
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.GET)
	@ResponseBody
	public String memberIdChk(String memberId) throws Exception {
		
		int result = service.idCheck(memberId);
		
		if(result != 0) {
			return "fail";
		}
		else {
			return "success";
		}
		
	}
	
	@GetMapping("/medical/userinfo")
	public void userinfo(Authentication authentication, Model model) {
		
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String username = userDetails.getUsername();
		
		model.addAttribute("member", service.getUserInfo(username));
		
	}
	
	@PostMapping("/medical/userinfo")
	public String userinfo(MemberVO member, RedirectAttributes rttr) {
		
		if(service.updatePW(member)) {
			rttr.addFlashAttribute("infoAlert", "modify");
		}
		
		return "redirect:/medical/info";
		
	}
	
	@PostMapping("/medical/deleteUser")
	public String deleteUser(String id, RedirectAttributes rttr) {
		
		if(service.deleteUser(id)) {
			rttr.addFlashAttribute("loginAlert", "deleteUser");
		}
		
		SecurityContextHolder.clearContext(); // 뒤로가기 방지
		
		return "redirect:/login";
		
	}
	
}
