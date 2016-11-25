package kr.ac.assemvely.controller;

import java.io.File;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import kr.ac.assemvely.service.UserService;
import kr.ac.assemvely.vo.ItemVo;
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
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(
			@RequestParam("imgfile1")MultipartFile imgfile1,
			@RequestParam("imgfile2")MultipartFile imgfile2,
			MultipartHttpServletRequest request,
			MultipartHttpServletRequest request2,
			ModelMap model,	UserVo vo) throws Exception
	{
				
		Map<String, MultipartFile> files = ((MultipartRequest) request).getFileMap();
		Map<String, MultipartFile> files2 = ((MultipartRequest) request).getFileMap();
		
		//���� �޾ƿ�
		CommonsMultipartFile cmf = (CommonsMultipartFile)files.get("imgfile1");
		CommonsMultipartFile cmf2 = (CommonsMultipartFile)files2.get("imgfile2");
		
		//���� ��θ� reseource/img������ ����
		String savePath = request.getServletContext().getRealPath("/resources/userimg");
		String randomid=UUID.randomUUID().toString();
		String randomid2=UUID.randomUUID().toString();
		//realPath�� ����̸�+������ ���� �̸�����.
		String filename1=cmf.getOriginalFilename() +randomid;
		String realPath = savePath+"/"+filename1;
		
		String filename2=cmf2.getOriginalFilename()+randomid2;
		String realPath2 = savePath+"/"+filename2;
	
		File file = new File(realPath);
		cmf.transferTo(file);
		
	//	String imgname = imgfile1.getOriginalFilename();
	//	String imgfullpath = savePath+"/"+imgname;
		 
		vo.setImgname(filename1);
		vo.setImgpath(realPath);
		
		if(vo.getBsm().equals("b"))
		{		
			
			vo.setFilename("null");
			vo.setFilepath("null");
			
			service.join(vo);
			return "homemain";
		}
		
		else if (vo.getBsm().equals("s"))
		{
			File file2 = new File(realPath2);
			cmf2.transferTo(file2);
			
//			String filename = imgfile2.getOriginalFilename();
//			String filefullpath = savePath+"/"+filename;
//			
			vo.setFilename(filename2);
			vo.setFilepath(realPath2);
			
			service.sellerjoin(vo);
			return "homemain";
			
		}
		return "homemain";
			
	}
	
	@RequestMapping(value="/joinPage", method=RequestMethod.GET)
	public String toJoin(Model model) throws Exception
	{
		
		return "/join";
		
	}
	
	@RequestMapping(value="/tomanaginguser", method=RequestMethod.GET)
	public String tomanaginuser(Model model) throws Exception
	{
		 
		model.addAttribute("userlist", service.userlist());
		 
		return "/user/managinguser";
		
	}
	
	
	@RequestMapping(value="/tostatistics", method=RequestMethod.GET)
	public String tostatistics(Model model, HttpServletRequest request, 
			HttpServletResponse response, HttpSession session) throws Exception
	{
		model.addAttribute("sellercounter", service.sellercounter());
		model.addAttribute("buyercounter", service.buyercounter());
		 
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
		{vo.setImgname(tvo1.getImgname());}
		else
		{vo.setImgname("null");}
		
		if(tvo1.getImgpath()!=null)
		{vo.setImgpath(tvo1.getImgpath());}
		else
		{vo.setImgpath("null");}
		
		
		if(tvo1.getFilename()!=null)
		{vo.setFilename(tvo1.getFilename());}
		else
		{vo.setFilename("null");}
		
		if(tvo1.getFilepath()!=null)
		{vo.setFilepath(tvo1.getFilepath());}
		else
		{vo.setFilepath("null");}
		
		vo.setAddress("null");
		
		service.join(vo);
		
		service.deletetempuser(id);
		
		
		return "redirect:/user/mypage";
		
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
		if(vo==null){
			
			return "homemain";
		}
		session.setAttribute("login", vo);
		 
		return "homemain";
		
	 
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
			return "homemain";
		}
		
		
		session.removeAttribute("login");
		session.invalidate();
		
		return "homemain";
		
				
	}
	
	@RequestMapping(value="/mypage")
	public String mypage(ItemVo itemvo,HttpSession session) throws Exception{
		UserVo vo=service.user(itemvo.getId());//���� �����޾ƿ��
	
		System.out.println("������ ��Ʈ�ѷ�"+itemvo.getCategorycode());//����־ȿ�??
		session.setAttribute("fromuser",itemvo);
		String path=null;
	
		if(vo.getBsm().equals("s")){
			path="redirect:/item/sellerpage?";
		}else if(vo.getBsm().equals("b")){
			path="redirect:/item/userpage?";
		}
		return path+itemvo;
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
		
		if(vo.getId()==sessionvo.getId()){//���̵� �����ϰ���ġ�ϸ�
			model.addAttribute("ALREADY",2);//�̴�
		}else{//���̵�� ������ ����ġ= Ÿ�� ����
		RelationVo relation=new RelationVo();
		relation.setFollowerid(sessionvo.getId());
		relation.setFollowingid(itemvo.getId());
		 //�ȷο��� �� �ȷ��׿� �ʸ� �־����
		if(service.already(relation)==0){//������ 0
			model.addAttribute("ALREADY",0);
		}else if(service.already(relation)==1){//������ 1
			model.addAttribute("ALREADY",1);
		}  
		}
 
		
		model.addAttribute("user",vo);
		model.addAttribute("followingcounter", service.followercounter(followerid));
		
		model.addAttribute("followercounter", service.followingcounter(followingid));
		System.out.println("���� ������Ʈ�ѷ� ����������"+vo.getBsm());
		
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
		model.addAttribute("userlist",service.followinglist(id));//relation vo�� ������´�.
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
		return "homemain";
		
	}
	
	
	@RequestMapping(value="/toreadtempuserinfo", method=RequestMethod.GET)
	public String selecttempuser(@RequestParam("id")String id, Model model) throws Exception
	{
		
		model.addAttribute("tempuser", service.selecttempuser(id));
	 
		return "/user/readtempuserinfo";
	}
	
	
	@RequestMapping(value="/following", method=RequestMethod.GET)
	public String following(@RequestParam("id")String followingid, HttpSession session) throws Exception
	{ 
		
		RelationVo rvo = new RelationVo();
		
		UserVo vo = (UserVo) session.getAttribute("login");
		String followerid = vo.getId();
		
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
