package kr.ac.assemvely.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.oreilly.servlet.Base64Encoder;

import kr.ac.assemvely.service.ItemService;
import kr.ac.assemvely.service.PayService;
import kr.ac.assemvely.service.UserService;
import kr.ac.assemvely.vo.ItemVo;
import kr.ac.assemvely.vo.NotifyVo;
import kr.ac.assemvely.vo.RelationVo;
import kr.ac.assemvely.vo.TempUserVo;
import kr.ac.assemvely.vo.UserDto;
import kr.ac.assemvely.vo.UserVo;

@Controller
@RequestMapping("/user")
public class UserController 
{
	@Inject
	private UserService service;
	
	@Inject
	private PayService payservice;
	
	@Inject
	private ItemService itemservice;
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	   public String join(
	         @RequestParam("imgfile1")MultipartFile imgfile1,
	         @RequestParam("imgfile2")MultipartFile imgfile2,
	         MultipartHttpServletRequest request,
	         MultipartHttpServletRequest request2,
	         ModelMap model,   UserVo vo) throws Exception
	   {
	            
	      Map<String, MultipartFile> files = ((MultipartRequest) request).getFileMap();
	      Map<String, MultipartFile> files2 = ((MultipartRequest) request).getFileMap();
	      
	      //파일 받아옴
	      CommonsMultipartFile cmf = (CommonsMultipartFile)files.get("imgfile1");
	      CommonsMultipartFile cmf2 = (CommonsMultipartFile)files2.get("imgfile2");
	      
	      //파일 경로를 reseource/img폴더로 지정
	    //  String savePath = request.getServletContext().getRealPath("/resources/userimg");
	     
	      String savePath = request.getServletContext().getRealPath("/android/profile/");
	      String randomid=UUID.randomUUID().toString();
	      String randomid2=UUID.randomUUID().toString();
	      //realPath를 경로이름+파일의 원래 이름으로.
	      String filename1=cmf.getOriginalFilename() +randomid;
	      String realPath = savePath+"/"+filename1;
	      
	      String filename2=cmf2.getOriginalFilename()+randomid2;
	      String realPath2 = savePath+"/"+filename2;
	   
	      File file = new File(realPath);
	      cmf.transferTo(file);
	      
	   //   String imgname = imgfile1.getOriginalFilename();
	   //   String imgfullpath = savePath+"/"+imgname;
	       
	      vo.setImgname(filename1);
	    
	      
	      if(vo.getBsm().equals("b"))
	      {      
	         vo.setFilename("");
	         service.join(vo);
	         return "redirect:/item/main";
	      }
	      
	      else if (vo.getBsm().equals("s"))
	      {
	         File file2 = new File(realPath2);
	         cmf2.transferTo(file2);
	         
//	         String filename = imgfile2.getOriginalFilename();
//	         String filefullpath = savePath+"/"+filename;
	      
	         vo.setFilename(filename2);
	       
	         service.sellerjoin(vo);
	         return "redirect:/item/main";
	         
	      }
	      return "redirect:/item/main";
	         
	   }
	
	@RequestMapping(value="/joinPage", method=RequestMethod.GET)
	public String toJoin(Model model) throws Exception
	{
		
		return "/user/join";
		
	}
	
	@RequestMapping(value="/tomanaginguser", method=RequestMethod.GET)
	public String tomanaginuser(Model model) throws Exception
	{
		 
		List<UserVo> userlist1 = service.userlist();
		
		List<UserVo> userlist = new ArrayList<>();
				
		for(int i =0; i<userlist.size(); i++)
		{
			UserVo vo = userlist.get(i);
			String path  = "C://android//profile//"+vo.getImgname();		
			InputStream in = new BufferedInputStream(new FileInputStream(path));
				
			byte[] info =IOUtils.toByteArray(in);	
			   
		    String encodeBase64 = Base64Encoder.encode(info);

		    vo.setImgname(encodeBase64);
			  
			userlist.add(vo);
			
			model.addAttribute("userlist", service.userlist());
		}
		
		return "/user/managinguser";
		
	}
	
	
	@RequestMapping(value="/tostatistics", method=RequestMethod.GET)
	public String tostatistics(Model model, HttpServletRequest request, 
			HttpServletResponse response, HttpSession session) throws Exception
	{
		UserVo vo=(UserVo) session.getAttribute("login");
		String id=vo.getId();
		List<ItemVo>bestlist=payservice.bestItem();
		List<ItemVo> top3=new ArrayList<ItemVo>();
		for(int i=0;i<3;i++){
			top3.add(bestlist.get(i));
			
		}
		
		//2.판매자 통계 	
		if(vo.getBsm().equals("s")){
		List<ItemVo>mybest=payservice.mybestitem(id);
		List<ItemVo>mytop3=new ArrayList<ItemVo>();
		
		for(int i=0;i<3;i++){
			mytop3.add(mybest.get(i));
		}
		model.addAttribute("mybestitem",mytop3);
		model.addAttribute("weeklymybuyer",payservice.weeklymybuyer(id));//주별 바이어
		}
		//1.매니져 통계
		model.addAttribute("sellercounter", service.sellercounter());//셀러수
		model.addAttribute("buyercounter", service.buyercounter());//바이어 수 
		model.addAttribute("bestbrand",payservice.bestbrand());//브랜드 판매순위
		
		model.addAttribute("bestItem",top3);//베스트 아이템
	//해놓긴 해놨음 주간 회원수	model.addAttribute("weeklyusercount",service.usercount());
		 
		//1. paytb brandid=sessionid인곳 숫자 세기
		//2. 최근 칠일내 내brandid가 얼마나 언급되었는가 위에 숫자세기랑 똑같고 조건만 붙여주면 될듯
		//3. 브랜드 순위는 브랜드 아이디가 많이 언급된순으로 ->db에서 해결할 방법 먼저 찾아보면 좋을듯(seller,manager)
		//4. 브랜드가 내 아이디인곳에 clothcode별로 카운트 뽑아서 순서 정하면 될듯
		//5. 게시글은 itemtb에 id가 세션id(seller)
			 //총게시글은 itemtb의 수(manager)
		int countitem = itemservice.countitem();
		model.addAttribute("COUNTITEM", countitem);
		
		int countcodi = itemservice.countcodi();
		model.addAttribute("COUNTCODI", countcodi);
		return "/user/statistics";
		
	}
	
	@RequestMapping(value="/towaitinglist", method=RequestMethod.GET)
	public String towaitinglist(Model model) throws Exception
	{
		
		model.addAttribute("templist", service.templist());
		
		return "/user/waitinglist";
		
	}
	
	
	@RequestMapping(value="/approve", method=RequestMethod.GET)
	public String approve(@RequestParam("id")String id, TempUserVo tvo) throws Exception
	{
		TempUserVo tvo1 = service.selecttempuser(id);
		
		UserVo vo = new UserVo();
		vo.setId(tvo1.getId());
		vo.setPw(tvo1.getPw());
		vo.setBsm(tvo1.getBsm());
		
		if(tvo1.getEmail()!=null)
		{vo.setEmail(tvo1.getEmail());}
		else
		{vo.setEmail("null");}
		vo.setBsm(tvo1.getBsm());
			
		if(tvo1.getImgname()!=null)
		{
			vo.setImgname(tvo1.getImgname());}
		else
		{vo.setImgname("null");}
		
	 
		
		if(tvo1.getFilename()!=null)
		{vo.setFilename(tvo1.getFilename());}
		else
		{vo.setFilename("null");}
		
	 
		
		vo.setAddress("null");
		
		service.join(vo);
		
		service.deletetempuser(id);
	 
		return "redirect:/user/tomanaginguser";
		
	}
	
	@RequestMapping(value="/loginpage", method=RequestMethod.GET)
	public String tologin(Model model) throws Exception
	{
		return "/user/loginPost";
		
	}
	
	@RequestMapping(value="/loginPost", method={RequestMethod.POST, RequestMethod.GET})
	public String loginPOST(UserDto dto, HttpSession session, Model model) throws Exception
	{
		
		UserVo vo = service.login(dto);
		String path  = "C://android//profile//"+vo.getImgname();
		String path2  = "C://android//profile//"+vo.getFilename();
		String path3 =  "C://android//profile//null.jpg";
		
		
		//null이면
		if(path.equals("C://android//profile//null"))
		{
	
			InputStream in = new BufferedInputStream(new FileInputStream(path3));	
			
			byte[] info =IOUtils.toByteArray(in);		
			
			String encodeBase64 = Base64Encoder.encode(info);
			
			vo.setImgname(encodeBase64);
			
		}
		else
		{
			InputStream in = new BufferedInputStream(new FileInputStream(path));	
			
			byte[] info =IOUtils.toByteArray(in);		
			
			String encodeBase64 = Base64Encoder.encode(info);
			
			vo.setImgname(encodeBase64);
			
		}
		if(path2.equals("C://android//profile//null"))
		{
			InputStream in2 = new BufferedInputStream(new FileInputStream(path3));	
			byte[] info2 =IOUtils.toByteArray(in2);		
			String encodeBase642 = Base64Encoder.encode(info2);				
			vo.setFilename(encodeBase642);
		}
		else
		{
		
			InputStream in2 = new BufferedInputStream(new FileInputStream(path2));	
			byte[] info2 =IOUtils.toByteArray(in2);		
			String encodeBase642 = Base64Encoder.encode(info2);
			
			vo.setFilename(encodeBase642);
			
		}
				
			
		if(vo==null)
		{
			
			return "redirect:/item/main";
		}
		
		session.setAttribute("login", vo); 
	//	System.out.println(vo);
		return "redirect:/item/main";
		
	 
	}
	
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpServletRequest request, 
			HttpServletResponse response, HttpSession session) throws Exception
	{
	
		Object obj =session.getAttribute("login");
		
		if(obj != null)
		{
						
			session.removeAttribute("login");
			session.invalidate();
			return "redirect:/item/main";
		}
		
		
		session.removeAttribute("login");
		session.invalidate();
		
		return "redirect:/item/main";
		
				
	}
	
	@RequestMapping(value="/mypage")
	public String mypage(ItemVo itemvo,HttpSession session) throws Exception{
	
		UserVo vo=service.user(itemvo.getId());//유저 정보받아우기
	 
		System.out.println(vo);
		
		session.setAttribute("fromuser",itemvo);
		String path=null;
	 
		if(vo.getBsm().equals("s")){
			path="redirect:/item/sellerpage";
		}else if(vo.getBsm().equals("b")){
			path="redirect:/item/userpage";
		} 
	 
		return path;
	}
	
	@RequestMapping(value="/selectuser" )
	public String listAll(ItemVo itemvo,Model model, HttpSession session,
			HttpServletRequest request, HttpServletResponse response
			) throws Exception
	{	
		
		UserVo vo =service.user(itemvo.getId());
		UserVo sessionvo=(UserVo) session.getAttribute("login");
		 
		String followingid=vo.getId();
		String followerid=vo.getId();
		String path=null;
	 
		if(sessionvo==null){
			 
			model.addAttribute("ALREADY",2);
		}else if(vo.getId().equals(sessionvo.getId())){//아이디가 세션하s고일치하면
			model.addAttribute("ALREADY",2);//이다
		}else{//아이디랑 세션이 불일치= 타인 계정
		RelationVo relation=new RelationVo();
		relation.setFollowerid(sessionvo.getId());
		relation.setFollowingid(itemvo.getId());
		 //팔로워에 나 팔로잉에 너를 넣어놓고
		if(service.already(relation)==0){//없으면 0
			model.addAttribute("ALREADY",0);
		}else if(service.already(relation)==1){//있으면 1
			model.addAttribute("ALREADY",1);
		}  
		}
 
		
		model.addAttribute("user",vo);
		model.addAttribute("followingcounter", service.followercounter(followerid));
		
		model.addAttribute("followercounter", service.followingcounter(followingid));
		int countitem = itemservice.countitem();
		model.addAttribute("COUNTITEM", countitem);
		
		int countcodi = itemservice.countcodi();
		model.addAttribute("COUNTCODI", countcodi);
		
		if(vo.getBsm().equals("b")){
			path="/user/mypage";
		}else if(vo.getBsm().equals("s")){
			path="sellermypage";
		}
		return path;
	}
	@RequestMapping(value="/follower" ) 
	public String follow(@RequestParam("id") String id,Model model)throws Exception{
		  
			model.addAttribute("userlist", service.followerlist(id));	
	  
		return "follow";
	}
	@RequestMapping(value="/followinguser" )
	public String following(@RequestParam("id")String id,Model model) throws Exception{
		model.addAttribute("userlist",service.followinglist(id));//relation vo를 가지고온다.
		return "follow";
	}
	
	@RequestMapping(value="/deletetempuser", method=RequestMethod.GET)
	public String deletetempuser(@RequestParam("id")String id)throws Exception
	{
		
		service.deletetempuser(id);
		return "/user/mypage";
	}
	
	@RequestMapping(value="/deleteuser", method=RequestMethod.GET)
	public String deleteuser(HttpSession session, HttpServletRequest request, HttpServletResponse response)throws Exception
	{
		
		UserVo vo = (UserVo) session.getAttribute("login");
		
		String id = vo.getId();
		String pw = vo.getPw();
				
		UserDto dto = new UserDto();
		dto.setId(id);
		dto.setPw(pw);
				
		service.deleteuser(dto);
		logout(request, response, session);
		return "redirect:/item/main";
		
	}
	
	
	@RequestMapping(value="/toreadtempuserinfo", method=RequestMethod.GET)
	public String selecttempuser(@RequestParam("id")String id, Model model) throws Exception
	{
		
		TempUserVo vo =  service.selecttempuser(id);
		
		String path  = "C://android//profile//"+vo.getImgname();	
		String path2  = "C://android//profile//"+vo.getFilename();	
		
		InputStream in = new BufferedInputStream(new FileInputStream(path));
		InputStream in2 = new BufferedInputStream(new FileInputStream(path2));
		
		byte[] info =IOUtils.toByteArray(in);	
		byte[] info2 =IOUtils.toByteArray(in2);	
		
		 String encodeBase64 = Base64Encoder.encode(info);
		 String encodeBase642 = Base64Encoder.encode(info2);

		 vo.setImgname(encodeBase64);
		
		
		model.addAttribute("tempuser", vo);
	 
		return "/user/readtempuserinfo";
	}
	
	
	@RequestMapping(value="/following", method=RequestMethod.GET)
	public String following(@RequestParam("id")String followingid, HttpSession session) throws Exception
	{ 
		
	
		
		RelationVo rvo = new RelationVo();
		
		UserVo vo = (UserVo) session.getAttribute("login");
		String followerid = vo.getId();
		//---------------여기 알람 인설트
		NotifyVo notifyvo=new NotifyVo();
		
		notifyvo.setId(followingid);
		notifyvo.setSendid(followerid);
	 
		notifyvo.setNotifycode("follow");
		itemservice.insertusernotify(notifyvo);
		//--------------------------
		
		rvo.setFollowerid(followerid);
		rvo.setFollowingid(followingid);
		service.following(rvo);
		
		return "redirect:/user/mypage?id="+followingid;	
		
	}
	
	@RequestMapping(value="/unfollowed")
	public String unfollowing(@RequestParam("id")String followingid,HttpSession session)throws Exception
	{
	 
	UserVo sessionvo=(UserVo) session.getAttribute("login");
	RelationVo relation=new RelationVo();
	relation.setFollowerid(sessionvo.getId());
	relation.setFollowingid(followingid);
		service.unfollowed(relation);
		return "redirect:/user/mypage?id="+followingid;
	}

 
	
}
