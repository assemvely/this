package kr.ac.assemvely.mobile;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.assemvely.service.ItemService;
import kr.ac.assemvely.service.UserService;
import kr.ac.assemvely.vo.NotifyVo;
import kr.ac.assemvely.vo.RelationVo;
import kr.ac.assemvely.vo.UserDto;
import kr.ac.assemvely.vo.UserVo;

@Controller
@RequestMapping("/m/user")
public class MuserController {
	@Inject
	private UserService service;
	@Inject
	private ItemService itemservice;
	
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
	         
	       
	       
	        // 요청한 곳으로부터 파라미터 받기
	       String id = request.getParameter("id");
	       String pw = request.getParameter("pw");
	       
	       System.out.println(id);
	       

	      dto.setId(pw);
	      dto.setPw(id);
	            
	      UserVo loginmember = service.login(dto);
	      
	      return loginmember;
	      
	   }
	
	
 
		@RequestMapping(value="/following", method=RequestMethod.POST)
		public String following(String id,String sessionid) throws Exception
		{ 
			
		
			String followingid=id;
			String followerid=sessionid;
			
			RelationVo rvo = new RelationVo();
			
			 
			//---------------여기 알람 인설트
			NotifyVo notifyvo=new NotifyVo();
			
			notifyvo.setId(followingid);
			notifyvo.setSendid(followerid);
		 
			notifyvo.setNotifycode("follow");
			itemservice.insertusernotify(notifyvo);
			//--------------------------
			System.out.println("안나와닌~~~");
			rvo.setFollowerid(followerid);
			rvo.setFollowingid(followingid);
			service.following(rvo);
			 System.out.println("하삐비비ㅣㅃ"+followerid);
			return id;
		}
		
		@RequestMapping(value="/unfollowed")
		public String unfollowing(String id,String sessionid)throws Exception
		{
		 
				
			String followingid=id;
			String followerid=sessionid;
		RelationVo relation=new RelationVo();
		relation.setFollowerid(followerid);
		relation.setFollowingid(followingid);
			service.unfollowed(relation);
			System.out.println("걸그룹노래짱"+followingid);
			return id;
		 
		}

}
