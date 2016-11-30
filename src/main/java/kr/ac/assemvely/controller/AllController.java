package kr.ac.assemvely.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.assemvely.service.ItemService;
import kr.ac.assemvely.service.UserService;
import kr.ac.assemvely.vo.ItemVo;
import kr.ac.assemvely.vo.UserVo;
//메인에서 가는 모든 경로를 지정
@Controller
@RequestMapping("/all")
public class AllController {

	@Inject
	private UserService userservice;
	
	@Inject
	private ItemService itemservice;
	
	@RequestMapping(value="/main")
	public String main(){
		return "redirect:/item/main";
	}
	
	@RequestMapping(value="/alert")
	public String alert(){
		return "alert";
	}
	@RequestMapping(value="/posting")
	public String posting(HttpSession session){
		UserVo vo=(UserVo) session.getAttribute("login");
		  
		
		String post = null;
	  
		if(vo.getBsm().equals("m")){
			post="redirect:/manager/posting"; 
		}else if(vo.getBsm().equals("s")){
			post="redirect:/item/posting";
		} 
	 
	 return post;
	}
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String search(Model model, String keyword) throws Exception
	{
		String id = keyword;
	 
		List<UserVo> searchuserlist = userservice.searchuser(id);
		model.addAttribute("searchuserlist", searchuserlist);
		
		String name = keyword;
		 
		List<ItemVo> searchitemlist = itemservice.searchitem(name);
		model.addAttribute("searchitemlist", searchitemlist);
		
		return "searchpage";
	}
	 
	 
}
