package kr.ac.assemvely.mobile;



import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import kr.ac.assemvely.service.ItemService;
import kr.ac.assemvely.service.SnsService;
import kr.ac.assemvely.service.UserService;
import kr.ac.assemvely.vo.CodiAll;
import kr.ac.assemvely.vo.CodiVo;
import kr.ac.assemvely.vo.CodiVo2;
import kr.ac.assemvely.vo.ImageVo;
import kr.ac.assemvely.vo.LikeVo;
import kr.ac.assemvely.vo.NotifyVo;
import kr.ac.assemvely.vo.SearchVo;
import kr.ac.assemvely.vo.SnsVo;
import kr.ac.assemvely.vo.Sns_codiVo;
import kr.ac.assemvely.vo.Sns_userVo;
import kr.ac.assemvely.vo.SnslikeVo;
import kr.ac.assemvely.vo.UserVo;



@Controller
@RequestMapping("/m/sns")
public class MsnsController {
	@Inject
	SnsService service;
	@Inject
	UserService userservice;
	@Inject
	ItemService itemservice;
	

	List<CodiVo> codi = new ArrayList<>();
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
	
	
	

 
	@RequestMapping(value="/list") 
	public @ResponseBody SnslikeVo list(String id) throws Exception{
		//메인 페이지
		SnslikeVo snslikevo=new SnslikeVo();
		snslikevo.setSnsvo(service.list(id));
		snslikevo.setLikevo(service.mylike(id));
	 
		return snslikevo; 
		
		
	}

	
/*	@RequestMapping(value="/listall")
	public @ResponseBody List<Sns_codiVo>listall(String id) throws Exception{
		
		
		return service.sns_codi(id);
	}
	
	*/
	
	@RequestMapping(value="/read")
	public @ResponseBody SnslikeVo read(LikeVo likevo)throws Exception{
		SnslikeVo snslikevo=new SnslikeVo();
	 
	 
		snslikevo.setSnsvo(service.read(likevo.getBno())); 
		 
		likevo.setBoard("s");
	 
		snslikevo.setLikevo(service.mylike(likevo.getId()));
		return snslikevo;
		
	}
	@RequestMapping(value="/searchlist")
	public @ResponseBody List<SnsVo> searchlist()throws Exception{
		return service.searchlist();
	}
	 @RequestMapping("/listall")
		 public @ResponseBody Sns_userVo listall(String id) throws Exception {
		
		
			 Sns_userVo snsuservo=new Sns_userVo();
			 snsuservo.setFollowercounter(userservice.followingcounter(id));
			 snsuservo.setFollowingcounter(userservice.followercounter(id));
			 snsuservo.setSnscodivo(service.listall(id));
			 snsuservo.setRelationvo(userservice.followerlist(id));
		 return snsuservo;
		 }

	//코디 리스트 뿌리는 테스트용
	@RequestMapping(value="/test")
	public @ResponseBody List<CodiVo> test(String id,String writedate) throws Exception{
	
		//이미지 파일도 가져와야하기대문에 codivo에 imagename 추가함...
		
	 
		
		DateFormat inputFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date=inputFormat.parse(writedate);
		
		CodiVo codivo=new CodiVo();
		codivo.setId(id);
		codivo.setWritedate(date);	
		List<CodiVo> codi=service.test(codivo);
		
	 
		
		return service.test(codivo);
		
		
		
		
	}
	@RequestMapping(value="/search")
	public @ResponseBody SearchVo search(String keyword) throws Exception
	{
		SearchVo searchvo=new SearchVo();
		String id = keyword;	
		searchvo.setUservo(userservice.searchuser(id));
	
	 
		String name = keyword;
		 
		searchvo.setItemvo(itemservice.searchitem(name));
		
		return searchvo;
	}
	
	@RequestMapping(value="/like")
	public @ResponseBody LikeVo like(LikeVo likevo,HttpSession session)throws Exception{
		
		 
		//----------------------------------여기부터 저아래까지가 notify좋아요 코드
		UserVo uservo=(UserVo)session.getAttribute("login");
		
		NotifyVo notifyvo=new NotifyVo();
		notifyvo.setBsm("b");
		notifyvo.setSendid(likevo.getId());
		notifyvo.setBoard(likevo.getBoard());
		notifyvo.setBno(likevo.getBno());
		notifyvo.setNotifycode("like");
		if(likevo.getBoard().equals("s")){

			itemservice.insertnotify(notifyvo);
		}else if(likevo.getBoard().equals("c")){
			itemservice.insertcodilikenotify(notifyvo);
		
		}
 
		
		//------------------------------------------
		
		service.insertlike(likevo);
		
		if(likevo.getBoard().equals("s")){
		service.countplus(likevo);
		}else{
			service.codilikeplus(likevo);
		}
	 
		return likevo;
	}
	@RequestMapping(value="/dislike")
	public @ResponseBody LikeVo dislike(LikeVo likevo)throws Exception{
 
		service.deletelike(likevo);
		if(likevo.getBoard().equals("s")){
			service.countminus(likevo);
			}else{
				service.codilikeminus(likevo);
			}
		 
	
		return likevo;
		
	}
	

 
	 @RequestMapping("s_delete")
	 public @ResponseBody void s_delete(String snsbno) throws Exception{
	
		 
		int bno=Integer.parseInt(snsbno);
		
	 service.s_delete(bno);
	 }
	//sns에 글올리기
		@RequestMapping(value="/sns_insert")
		public @ResponseBody void sns_insert(String id,String filename,String content) throws Exception{
			
			SnsVo snsvo=new SnsVo();
			snsvo.setId(id);
			snsvo.setBoardcode("s");
			snsvo.setSnsimg(filename);
			snsvo.setSnscontent(content);
			
			service.s_insert(snsvo);
			
			
			
		}
 
	
	//codicomment입력하는 것!!!
	@RequestMapping(value="codi_comment")
	public @ResponseBody int codi_comment(String id,String codicomment,String codicapture) throws Exception{

 
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
		CodiVo codi=service.codibno(id);
		System.out.println("원본은 어떻게 나오냐???"+codi.getWritedate());
		
		System.out.println("????"+transFormat.format(codi.getWritedate()));
		
		String codi_date=transFormat.format(codi.getWritedate());
		
	
		CodiVo2 codivo2=new CodiVo2();
		
		
	 
		codivo2.setWritedate(codi.getWritedate());
		codivo2.setCodicomment(codicomment);
		codivo2.setId(id);
		codivo2.setCodicapture(codicapture);
		codivo2.setBoardcode("c");
		
		return service.codi_comment(codivo2);
	}

	//코디랑 sns 한번에 다 가져오는 메소드
	@RequestMapping(value="/sns_codi")
	public @ResponseBody SnslikeVo sns_codi(String id) throws Exception{
	 
		
		SnslikeVo snslikevo=new SnslikeVo();
		snslikevo.setSnsvo(service.sns_codi(id));
		snslikevo.setLikevo(service.mylike(id));
	

		return snslikevo;
	}

	// 안드로이드 코디 나오는거 맨처음에
	@RequestMapping(value = "/all")
	public @ResponseBody List<ImageVo> all() throws Exception {

	 
		return service.all();

	}
	
	
	
	//안드로이드 개인 계정에서 코디한거 누르면 상품이랑 이런거 까지 전부다 나오는 것@@@
	@RequestMapping(value = "/codiall")
	public @ResponseBody CodiAll codiall(String id, String writedate,String likeid,String codibno) throws Exception {

		System.out.println("날자ㅣ" + writedate);

		// DateFormat outputFormat=new SimpleDateFormat("yyMMddHHmmss");
		DateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		Date date = inputFormat.parse(writedate);
		System.out.println("e데이트로바꾸니?" + date);
		// String writedate1=outputFormat.format(date);

		// System.out.println("날짜"+writedate1);
		System.out.println("왜오지도 않냐?");
		CodiVo codivo = new CodiVo();
		codivo.setId(id);
		System.out.println("아뒷" + id);
		Integer codinum=Integer.parseInt(codibno);
		 
		codivo.setWritedate(date);
		codivo.setCodibno(codinum);
		CodiAll codiall = new CodiAll();
		System.out.println("?");
		codiall.setUservo(service.codi_usertb(id));
		System.out.println("?>?");

		System.out.println("???????" + codivo.getId());
		System.out.println("?" + codivo.getWritedate());

		String capture = service.codi_coditb3(codivo).getCodicapture();
		String codicomment=service.codi_coditb3(codivo).getCodicomment();
		Integer codilike=service.codi_coditb3(codivo).getCodilike();
		
		codiall.setCodilike(codilike);
		System.out.println("///>");

		codiall.setCodicapture(capture);
		codiall.setCodicomment(codicomment);
		 
		System.out.println("?>>>>>");
		codiall.setItemvo(service.codi_itemtb(codivo));
		codiall.setLikevo(service.mylike(likeid));
		System.out.println("유저정보" + codiall.getUservo().getId());
		System.out.println("유저정보" + codiall.getUservo().getImgname());
		System.out.println("z코디내용"+codiall.getCodicomment());
		System.out.println("코디정보"+codiall.getCodicapture());
		System.out.println("코디올" + codiall.getItemvo());
		return codiall;
	}

	
	
	 
	
	
	

	// 코디에서 카테고리 목록 가져오는것
	@RequestMapping(value = "/codi_cloth")
	public @ResponseBody List<ImageVo> codi_cloth(HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String category = request.getParameter("category");

		System.out.println(category);
		
		
		return service.codi_cloth(category);

	}

	
	
	
	//코디삭제하기
	@RequestMapping(value="/codi_delete")
	public int codi_delete(String id,String writedate) throws Exception{
		
		System.out.println("아뒤"+id);
		System.out.println("날자"+writedate);
		
		CodiVo codivo=new CodiVo();
		codivo.setId(id);
		
		

		
		DateFormat inputFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		
		Date date=inputFormat.parse(writedate);
		System.out.println("변환되날자"+date);
			codivo.setWritedate(date);
			
			service.codi_delete1(codivo);
		return service.codi_delete2(codivo);
		
		
	}
	
	
	//search에서 sns,,codi 가져오는것
	   @RequestMapping(value="/search_sns")
	   public @ResponseBody List<Sns_codiVo> search_sns() throws Exception{
	      
	      return    service.search_sns();   
	      
	   }
	
	
	
	//코디 수정하는것1.
	@RequestMapping(value="/codi_update")
	public void codi_update(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		
	

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		StringBuilder sb = new StringBuilder();
		String line = null;

		BufferedReader reader = request.getReader();
		while ((line = reader.readLine()) != null) {
			sb.append(line);

		}

		JSONObject jsonObj = new JSONObject(sb.toString());
		JSONArray jarray = jsonObj.getJSONArray("codi");
		
		
		
		//추가한것
	String id1=(String) jarray.getJSONObject(0).get("id");
	String writedate1=(String) jarray.getJSONObject(0).get("writedate");
	DateFormat inputFormat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	Date date1 = inputFormat1.parse(writedate1);
	CodiVo codivo1=new CodiVo();
	codivo1.setId(id1);
	codivo1.setWritedate(date1);
	List<CodiVo> ori_codilist=service.codi_select(codivo1);
	
	
	
	List<CodiVo> up_codilist=new ArrayList<>();
	
	for (int i = 0; i < jarray.length(); i++) {

			JSONObject obj = jarray.getJSONObject(i);
			int clothcode = obj.getInt("clothcode");
			
			int coordinate_x = obj.getInt("coordinate_x");
			int coordinate_y = obj.getInt("coordinate_y");
			System.out.println("yyy"+coordinate_y);
			int width = obj.getInt("width");
			int height = obj.getInt("height");
			String id = obj.getString("id");
			
			System.out.println("clothcde"+clothcode);
			System.out.println("x"+coordinate_x);
			
			String writedate = obj.getString("writedate");
			
			

			DateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			Date date = inputFormat.parse(writedate);

			CodiVo codivo = new CodiVo(id, clothcode, date, coordinate_x, coordinate_y, width, height);
			up_codilist.add(codivo);
	
		}
	//기존 코디 지우기
		service.codi_delete1(ori_codilist.get(0));
		
		for(int i=0;i<up_codilist.size();i++){
			service.codi_updateinsert(up_codilist.get(i));
		}
			
		
	
}
	

	
	
	//코디 수정하는거 2
	@RequestMapping(value="/codi_update2")
	public @ResponseBody int codi_update(String id,String codicomment,String codicapture,String writedate) throws Exception{
		
		
		DateFormat inputFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		
		Date date=inputFormat.parse(writedate);
	
	
		CodiVo2 codivo2=new CodiVo2(date,codicomment,id,codicapture);
		
		return service.codi_update2(codivo2);
		
		
		
		
		
	}
	
	
	
	
	
	@RequestMapping(value = "/codi_insert")
	public void codi(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		// response.setContentType("application/json;charset=UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		System.out.println("왜 안나오냐...................");

		

		// StringBuffer json=new StringBuffer();
		StringBuilder sb = new StringBuilder();
		String line = null;

		BufferedReader reader = request.getReader();
		while ((line = reader.readLine()) != null) {
			sb.append(line);

		}
		
		JSONObject jsonObj = new JSONObject(sb.toString());
		JSONArray jarray = jsonObj.getJSONArray("codi");
		
		for(int i = 0; i < jarray.length(); i++){
		
		JSONObject obj=jarray.getJSONObject(i);
		int clothcode=obj.getInt("clothcode");
		int coordinate_x=obj.getInt("coordinate_x");
		int coordinate_y=obj.getInt("coordinate_y");
		int width=obj.getInt("width");
		int height=obj.getInt("height");
		String id=obj.getString("id");
		
		
	
		
		
		CodiVo codivo=new CodiVo(clothcode,coordinate_x,coordinate_y,width,height,id);
				
		service.codi_insert(codivo);
	
			
		}
		
	
				
		
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
	
	@RequestMapping(value = "codi_fileread")
	   public @ResponseBody byte[] fileread(String codiimgname) throws Exception {

	      System.out.println("코디파일이름" + codiimgname);
	      String path = "C:\\android\\codi\\" + codiimgname;
	      System.out.println("경로가 문제냐" + path);
	      

	      InputStream in = new BufferedInputStream(new FileInputStream(path));
	      return IOUtils.toByteArray(in);
	   }

	   @RequestMapping(value = "sns_fileread")
	   public @ResponseBody byte[] sns_fileread(String File) throws Exception {

	      String Filename = File;

	      System.out.println("파일이름" + Filename);
	      String path = "C:\\android\\sns\\" + Filename;
	      InputStream in = new BufferedInputStream(new FileInputStream(path));

	      return IOUtils.toByteArray(in);

	   }

	   @RequestMapping(value = "item_fileread")
	   public @ResponseBody byte[] item_fileread(String File) throws Exception {

	      String Filename = File;

	      System.out.println("파일이름2" + Filename);

	      String path = "C:\\android\\item\\" + Filename;
	      System.out.println("경로0" + path);
	      InputStream in = new BufferedInputStream(new FileInputStream(path));

	      return IOUtils.toByteArray(in);

	   }

	   @RequestMapping(value = "profile_fileread")
	   public @ResponseBody byte[] profile_fileread(String File) throws Exception {

	      String Filename = File;

	      System.out.println("파일이름" + Filename);
	      String path = "C:\\android\\profile\\" + Filename;
	      InputStream in = new BufferedInputStream(new FileInputStream(path));

	      return IOUtils.toByteArray(in);

	   }

	   @RequestMapping(value = "/what")
	   public @ResponseBody String what(HttpServletRequest request) throws Exception {


	      MultipartHttpServletRequest imgrequest = (MultipartHttpServletRequest) request;
	      Map<String, MultipartFile> files = ((MultipartRequest) imgrequest).getFileMap();
	      CommonsMultipartFile cmf = (CommonsMultipartFile) files.get("bitmap");

	      String savePath = "C:\\android\\codi\\";

	      String randomid = UUID.randomUUID().toString();

	      String fileName = cmf.getOriginalFilename();



	      int random = (int) Math.random();
	      char ch = (char) ((Math.random() * 26) + 97);

	      String filename =randomid+ ".png";

	      String realPath = savePath + filename;
	      System.out.println(realPath);
	      File file = new File(realPath);
	      // 파일 업로드 처리 완료.
	      cmf.transferTo(file);

	      return filename;

	   }

	   @RequestMapping(value = "/gallery")
	   public @ResponseBody String gallery(HttpServletRequest request) throws Exception {
	   
	      MultipartHttpServletRequest imgrequest = (MultipartHttpServletRequest) request;
	      Map<String, MultipartFile> files = ((MultipartRequest) imgrequest).getFileMap();

	      CommonsMultipartFile cmf = (CommonsMultipartFile) files.get("gallery");

	      String savePath = "C:\\android\\sns\\";

	      

	      String randomid = UUID.randomUUID().toString();
	      String fileName = cmf.getOriginalFilename() + randomid;
	      String fileName1 = cmf.getOriginalFilename();

	      // String realPath=savePath+"\\"+fileName;

	      String realPath = savePath + randomid + ".png";
	      System.out.println(realPath);
	      File file = new File(realPath);
	      // 파일 업로드 처리 완료.
	      cmf.transferTo(file);

	      return randomid + ".png";

	   }
	
}
