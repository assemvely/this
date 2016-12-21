package kr.ac.assemvely.mobile;


import java.util.List;


import javax.inject.Inject;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.assemvely.service.SnsService;

import kr.ac.assemvely.vo.SnsVo;



@Controller
@RequestMapping("/m/sns")
public class MsnsController {
	@Inject
	SnsService service;
	 
//	@RequestMapping(value="/follower",method=RequestMethod.POST)//이거 팔로워
//	public @ResponseBody List<UserVo> follower(HttpServletRequest request,HttpServletResponse response) throws Exception{
//		request.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html;charset=UTF-8");
//		String id=request.getParameter("id");
//		
//		System.out.println("�뙏濡쒖썙�뙏濡쒖썙");
//		
//		return service.follower(id);
//		
//	}
//	
//	@RequestMapping(value="/following",method=RequestMethod.POST)//이거 팔로잉
//	public @ResponseBody List<UserVo> following(HttpServletRequest request,HttpServletResponse response) throws Exception{
//		request.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html;charset=UTF-8");
//		String id=request.getParameter("id");
//		return service.following(id);
//	}
	
	 
//	@RequestMapping(value="/seller")//아마 셀러인듯..?
//	public @ResponseBody SellerVo seller(HttpServletRequest request,HttpServletResponse response,SellerVo seller) throws Exception{
//		
//	
//		request.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html;charset=UTF-8");
//		 String id=request.getParameter("id");
//		 String category=request.getParameter("category");
////		String id="q";
//	//	String category="OUTER";
//		 seller.setUservo(service.mypage(id));
//		 
//		 
//		
//		Map<String,String> map=new HashMap();
//		map.put("id",id);
//		map.put("category",category);
//		seller.setItemvo(service.item(map));
//		System.out.println("@@@@"+service.item(map).get(1).getImgname());
//		
//		 return seller;
//	}
 
	
 
//	@RequestMapping(value="/profile",method=RequestMethod.POST)//이거 프로필가져오기
//	public @ResponseBody List<mobilevo> profile(HttpServletRequest request,HttpServletResponse response) throws Exception{
//		
//		request.setCharacterEncoding("UTF-8");
//	   response.setContentType("text/html;charset=UTF-8");
//	    
//	   String id=request.getParameter("id");
//	    //String id="q";
//	 
//		return service.profile(id);
//	    
//		
//		
//		
//	}
	
	
	

 
	@RequestMapping(value="/list")//snstb에서 다뺴옴
	public @ResponseBody List<SnsVo> list(String id) throws Exception{
		//메인 페이지
		 
	 
		return service.list(id);
		
		
	}

	
	@RequestMapping(value="/listall")
	public @ResponseBody List<SnsVo> listall(String id) throws Exception{
		
	
		return service.listall(id);
	}
	
	@RequestMapping(value="/read")
	public @ResponseBody SnsVo read(String snsbno)throws Exception{
		
		int bno=Integer.valueOf(snsbno);
		return service.read(bno);
	}
	
//	//
//	@RequestMapping(value="/myshopping",method=RequestMethod.POST)
//	public @ResponseBody MyShoppingVo myshopping(MyShoppingVo shopping,HttpServletRequest request,HttpServletResponse response) throws Exception{
//		
//		request.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html;charset=UTF-8");
//		  String id=request.getParameter("id");
//		
//		shopping.setUservo(service.mypage(id));
//		shopping.setShoppingvo(service.myshopping(id));
//		
//		System.out.println(service.myshopping(id).get(1).getClothcode());
//		
//		
//		
//		return shopping;
//		
//		
//	}
	
	
	
}
