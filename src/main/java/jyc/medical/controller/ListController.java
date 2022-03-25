package jyc.medical.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jyc.medical.domain.Criteria;
import jyc.medical.domain.ListVO;
import jyc.medical.domain.PageDTO;
import jyc.medical.service.ListService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/medical/*")
@AllArgsConstructor
public class ListController {

	private ListService service;
	
	@GetMapping("/list")
	public void list(Authentication authentication, Criteria cri, Model model, String remove) {
		
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String username = userDetails.getUsername();

		model.addAttribute("list", service.getList(username, cri));
		
		int total = service.getTotal(username, cri);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		if(remove != null) model.addAttribute("remove", "remove");	
		
	}
	
	@GetMapping("/register")
	public void register(Model model) {
		
		model.addAttribute("medilist", service.getMediList());
		
	}
	
	@GetMapping("/cusRegister")
	public void cusRegister(Model model) {
		
		model.addAttribute("medilist", service.getMediList());
		
	}
	
	@GetMapping("/simRegister")
	public void sumRegister(Model model) {
		
		model.addAttribute("medilist", service.getMediList());
		
	}
	
	@PostMapping("/register")
	public String register(ListVO list) {		
		
		service.register(list);	
		
		return "redirect:/medical/list";
		
	}
	
	@GetMapping("/get")
	public void get(Authentication authentication, @RequestParam("schType") String schType, @ModelAttribute("cri") Criteria cri, Model model) {
		
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		String username = userDetails.getUsername();
		
		model.addAttribute("list", service.get(username, schType));
		
	}
	
	@PostMapping("/modify")
	public String modify(ListVO list, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		service.modify(list);
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/medical/list";
		
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("id") String id, @RequestParam("schType") String schType, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		service.remove(id, schType);
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/medical/list";
		
	}
	
	@RequestMapping(value = "/schTypeChk", method = RequestMethod.GET)
	@ResponseBody
	public String schTypeChk(String id, String schType){
				
		int result = service.schTypeCheck(id, schType);
				
		if(result != 0) return "fail";
		else return "success";
		
	}
	
	@GetMapping("/info")
	public void info(String update, Model model) {
		
		if(update != null) model.addAttribute("update", "update");
		
	}
	
	@GetMapping("/manual")
	public void manual(Model model) {
		
		model.addAttribute("manual", service.manual());
		
	}
			
}