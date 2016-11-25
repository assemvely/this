package kr.ac.assemvely.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.assemvely.vo.UserVo;
//���ο��� ���� ��� ��θ� ����
@Controller
@RequestMapping("/all")
public class AllController {

	@RequestMapping(value="/main")
	public String main(){
		return "redirect:/item/main";
	}
	@RequestMapping(value="/posting")
	public String posting(HttpSession session){
		UserVo vo=(UserVo) session.getAttribute("login");
		 System.out.println("���"+vo.toString());
		String post = null;
		if(vo.getBsm().equals("m")){
			post="redirect:/manager/posting"; 
		}else if(vo.getBsm().equals("s")){
			post="redirect:/item/posting";
		}else if(vo.getBsm().equals("b")){
			post="homemain";
		} 
	 return post;
	}
 
}
