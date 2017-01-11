package kr.ac.assemvely.mobile;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.assemvely.service.ManagerService;
import kr.ac.assemvely.vo.ManagerVo;

@Controller
@RequestMapping("/m/manager")
public class MmanagerController {

	
	@Inject
	private ManagerService managerservice;
 
	
	@RequestMapping("/readposting")
	private @ResponseBody ManagerVo readposting(@ModelAttribute("managerbno") int managerbno,Model model,HttpSession session){
		 
		 
		 
		return  managerservice.readposting(managerbno);
	}
	
  
	
}
