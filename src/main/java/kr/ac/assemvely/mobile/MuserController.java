package kr.ac.assemvely.mobile;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.assemvely.service.UserService;
import kr.ac.assemvely.vo.UserDto;
import kr.ac.assemvely.vo.UserVo;

@Controller
@RequestMapping("/m/user")
public class MuserController {
	@Inject
	private UserService service;
	
	
	@RequestMapping(value="/follower" ) 
	public @ResponseBody List<UserVo> follow(String id)throws Exception{
		  
		
	return service.followerlist(id); 
	}
	
	@RequestMapping(value="/followinguser" )
	public @ResponseBody List<UserVo> following(String id) throws Exception{
		
		return service.followinglist(id);
		
	}
	
	@RequestMapping(value="/brandlist")
	public @ResponseBody List<UserVo> brandlist()throws Exception{
		String bsm="s";
		return service.bybsm(bsm);
	}
	@RequestMapping(value="/mypage")
	public @ResponseBody UserVo mypage(String id)throws Exception{
		return service.mypage(id);
	}
	
	@RequestMapping(value="/join",  method={RequestMethod.POST, RequestMethod.GET})
	   public void mobilejoin(UserVo vo, HttpServletRequest request,
	         HttpServletResponse response) throws Exception
	   {
	      System.out.println("mobilejoin");
	      request.setCharacterEncoding("UTF-8");
	           
	       String id = request.getParameter("id");
	       String pw = request.getParameter("pw");
	       String email = request.getParameter("email");
	       
	       vo.setId(id);
	       vo.setPw(pw);  
	       vo.setEmail(email);
	       vo.setBsm("b");   
	       vo.setAddress("null");
	       vo.setImgname("null");
	       vo.setFilename("null");
	       

	      service.join(vo);
	   }
	
	  @RequestMapping(value="/loginpost",  method={RequestMethod.POST, RequestMethod.GET})
	   public @ResponseBody UserVo mobileloginpost(UserDto dto, HttpServletRequest request,
	         HttpServletResponse response) throws Exception
	   {
	      System.out.println("mobilelogin");
	      request.setCharacterEncoding("UTF-8");
	       response.setContentType("text/html;charset=UTF-8");
	         
	        // ��û�� �����κ��� �Ķ���� �ޱ�
	       String id = request.getParameter("id");
	       String pw = request.getParameter("pw");
	       

	      dto.setId(pw);
	      dto.setPw(id);
	            
	      UserVo loginmember = service.login(dto);
	      
	      return loginmember;
	      
	   }
	
	
	   

}
