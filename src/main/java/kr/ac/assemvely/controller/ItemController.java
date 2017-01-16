package kr.ac.assemvely.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import kr.ac.assemvely.service.ItemService;
import kr.ac.assemvely.service.ManagerService;
import kr.ac.assemvely.service.PayService;
import kr.ac.assemvely.service.UserService;
import kr.ac.assemvely.vo.AddressVo;
import kr.ac.assemvely.vo.CartVo;
import kr.ac.assemvely.vo.CodiVo2;
import kr.ac.assemvely.vo.ItemInfoVo;
import kr.ac.assemvely.vo.ItemVo;
import kr.ac.assemvely.vo.ManagerVo;
import kr.ac.assemvely.vo.MileageVo;
import kr.ac.assemvely.vo.OrderVo;
import kr.ac.assemvely.vo.PayVo;
import kr.ac.assemvely.vo.UserVo;

@Controller
@RequestMapping("/item")
public class ItemController {

	@Inject
	private ItemService itemservice;
	
	@Inject
	private PayService payservice;
	
	@Inject
	private UserService userservice;
	
	@Inject 
	private ManagerService managerservice;

	@RequestMapping(value = "/main")
	public String listGET(Model model) throws Exception {
		List<ItemVo> vo;
		vo = itemservice.listitem();
		model.addAttribute("LIST", vo);
		
		List<CodiVo2> codi=itemservice.bestcodi();
		List<CodiVo2> codilist=new ArrayList<>();
		for(int i=0;i<codilist.size();i++){
			int count=0;
			CodiVo2 codi2=codi.get(i);
			codilist.add(codi2);
			count++;
			if(count==4){
				break;
			}
		}
		
		List<UserVo> brandgallery = userservice.brandgallery();
		model.addAttribute("BRANDGALLERY", brandgallery);
		
		model.addAttribute("BESTCODI", codilist);
		List<ItemVo> newitem = itemservice.newitem();
		model.addAttribute("NEWITEM", newitem);
	

		int countitem = itemservice.countitem();
		model.addAttribute("COUNTITEM", countitem);
		
		int countcodi = itemservice.countcodi();
		model.addAttribute("COUNTCODI", countcodi);
		List<ManagerVo> banner=managerservice.readbanner();
	 
		model.addAttribute("BANNER",banner);
		return "homemain";
	}
	@RequestMapping(value="/posting" )
	public String posting( HttpSession session,Model model) throws Exception{

		int countitem = itemservice.countitem();
		model.addAttribute("COUNTITEM", countitem);
		
		int countcodi = itemservice.countcodi();
		model.addAttribute("COUNTCODI", countcodi);
			UserVo vo=(UserVo) session.getAttribute("login");
			model.addAttribute("userVO",vo);
		return "itemposting";
	 
	}
 

	@RequestMapping(value = "/upload")
	private String upload(@RequestParam MultipartFile imgfile, MultipartHttpServletRequest request, ModelMap model,ItemVo itemvo, HttpSession session,ItemInfoVo info) throws Exception {
		Map<String, MultipartFile> files = ((MultipartRequest) request).getFileMap();
		CommonsMultipartFile cmf = (CommonsMultipartFile) files.get("imgfile");
		String savePath = request.getServletContext().getRealPath("/resources/itemimg");
		String realPath = savePath + "/" + cmf.getOriginalFilename();
		
		File file = new File(realPath);
		
		System.out.println("여기 리얼 패스"+realPath);
		// �뙆�씪 �뾽濡쒕뱶 泥섎━ �셿猷�.
		cmf.transferTo(file);
		UserVo vo=(UserVo) session.getAttribute("login");
		itemvo.setId(vo.getId());
		itemvo.setImgname(cmf.getOriginalFilename());
		 itemvo.setContent(request.getParameter("smarteditor"));
		itemservice.insertitem(itemvo);
		

		String name=itemvo.getName();
		
		
		
		ItemVo clothcode=itemservice.clothcode(name);

		
		String[] arr=request.getParameterValues("a");
		 for(int i=0;i<arr.length;i++){
			 
			 
			 String color=arr[i];
			 info.setColor(color);
			
			 i++;
			 String amount=arr[i];
			 info.setAmount(amount);
			
			 
			 info.setClothcode(clothcode.getClothcode());
			 
			 
			 itemservice.insertinfo(info);
			 
		 }
		
		
		return "redirect:/item/main";
	}
	@RequestMapping(value="/readposting")
	private String readposting(@ModelAttribute("clothcode") int clothcode,Model model) throws Exception{

		int countitem = itemservice.countitem();
		model.addAttribute("COUNTITEM", countitem);
		
		int countcodi = itemservice.countcodi();
		model.addAttribute("COUNTCODI", countcodi);
		ItemVo itemvo=itemservice.readposting(clothcode);
		 
		int Price=(itemvo.getPrice());
		int mileage=(int) (Price*(0.1));
		itemvo.setMileage(mileage);
		List<ItemInfoVo> info=itemservice.readinfo(clothcode);
				model.addAttribute("COLOR",info);
				model.addAttribute("READ",itemvo);
		 
				
				return "itemread";
				
				
	}
	@RequestMapping(value = "/outer")
	public String listlittlecategoryouterGET(Model model, String outer) throws Exception {

		int countitem = itemservice.countitem();
		model.addAttribute("COUNTITEM", countitem);
		
		int countcodi = itemservice.countcodi();
		model.addAttribute("COUNTCODI", countcodi);
		String selectcategory;

		if (outer == null)
			selectcategory = "OUTER";
		else
			selectcategory = outer.toUpperCase();

		List<ItemVo> outervo;

		if (selectcategory.equals("OUTER")) {
			outervo = itemservice.selectcategory(selectcategory);
		} else {
			outervo = itemservice.selectlittlecategory(selectcategory);
		}
		model.addAttribute("SELECTCATEGORY", outervo);
		System.out.println(outervo.toString());
		model.addAttribute("SELECTLITTLECATEGORY", selectcategory);

		return "outer";
	}
 
	@RequestMapping(value="userpage")
	public String userpage(HttpSession session)throws Exception{
		
		//★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
		 session.removeAttribute("USERITEM");
		 ItemVo itemvo=(ItemVo) session.getAttribute("fromuser");
		  
		List<ItemVo> vo=itemservice.selectuser(itemvo.getId());
		session.removeAttribute("USERITEM");
		session.setAttribute("USERITEM", vo);
 		
 		 //나중에 코디게시판에서 불러와야함!
		//★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
		
		return "redirect:/user/selectuser?id="+itemvo.getId();
	}
	
 @RequestMapping(value="sellerpage")
 public String sellerpage(HttpSession session)throws Exception{

	 session.removeAttribute("USERITEM");
	 ItemVo itemvo=(ItemVo) session.getAttribute("fromuser");
	 
	 List<ItemVo> vo=null;
	 

	 if(itemvo.getCategorycode()!=null){
		 
		vo =itemservice.branditem(itemvo);
	 }else{
	  vo=itemservice.selectuser(itemvo.getId());
	 }
		
		session.setAttribute("USERITEM", vo);
		
		return "redirect:/user/selectuser?id="+itemvo.getId();
 }

	@RequestMapping(value = "/top")
	public String listlittlecategorytopGET(Model model, String top) throws Exception {

		int countitem = itemservice.countitem();
		model.addAttribute("COUNTITEM", countitem);
		
		int countcodi = itemservice.countcodi();
		model.addAttribute("COUNTCODI", countcodi);
		String selectcategory;
		if (top == null)
			selectcategory = "TOP";
		else
			selectcategory = top.toUpperCase();
		List<ItemVo> topvo;

		if (selectcategory.equals("TOP")) {
			topvo = itemservice.selectcategory(selectcategory);
		} else {
			topvo = itemservice.selectlittlecategory(selectcategory);
		}
		model.addAttribute("SELECTCATEGORY", topvo);
		model.addAttribute("SELECTLITTLECATEGORY", selectcategory);
		return "top";
	}

	@RequestMapping(value = "/bottom")
	public String listlittlecategorybottomGET(Model model, String bottom) throws Exception {

		int countitem = itemservice.countitem();
		model.addAttribute("COUNTITEM", countitem);
		
		int countcodi = itemservice.countcodi();
		model.addAttribute("COUNTCODI", countcodi);
		String selectcategory;
		if (bottom == null)
			selectcategory = "BOTTOM";
		else
			selectcategory = bottom.toUpperCase();
		List<ItemVo> bottomvo;

		if (selectcategory.equals("BOTTOM")) {
			bottomvo = itemservice.selectcategory(selectcategory);
		} else {
			bottomvo = itemservice.selectlittlecategory(selectcategory);
		}
		model.addAttribute("SELECTCATEGORY", bottomvo);
		model.addAttribute("SELECTLITTLECATEGORY", selectcategory);
		return "bottom";
	}

	@RequestMapping(value = "/skirt")
	public String listlittlecategoryskirtGET(Model model, String skirt) throws Exception {

		int countitem = itemservice.countitem();
		model.addAttribute("COUNTITEM", countitem);
		
		int countcodi = itemservice.countcodi();
		model.addAttribute("COUNTCODI", countcodi);
		String selectcategory;
		if (skirt == null)
			selectcategory = "SKIRT";
		else
			selectcategory = skirt.toUpperCase();
		List<ItemVo> skirtvo;

		if (selectcategory.equals("SKIRT")) {
			skirtvo = itemservice.selectcategory(selectcategory);
		} else {
			skirtvo = itemservice.selectlittlecategory(selectcategory);
		}
		model.addAttribute("SELECTCATEGORY", skirtvo);
		model.addAttribute("SELECTLITTLECATEGORY", selectcategory);
		return "skirt";
	}

	@RequestMapping(value = "/dress")
	public String listlittlecategorydressGET(Model model, String dress) throws Exception {

		int countitem = itemservice.countitem();
		model.addAttribute("COUNTITEM", countitem);
		
		int countcodi = itemservice.countcodi();
		model.addAttribute("COUNTCODI", countcodi);
		String selectcategory;
		if (dress == null)
			selectcategory = "DRESS";
		else
			selectcategory = dress.toUpperCase();
		List<ItemVo> dressvo;

		if (selectcategory.equals("DRESS")) {
			dressvo = itemservice.selectcategory(selectcategory);
		} else {
			dressvo = itemservice.selectlittlecategory(selectcategory);
		}
		model.addAttribute("SELECTCATEGORY", dressvo);
		model.addAttribute("SELECTLITTLECATEGORY", selectcategory);
		return "dress";
	}

	@RequestMapping(value = "/acc")
	public String listlittlecategoryaccGET(Model model, String acc) throws Exception {

		int countitem = itemservice.countitem();
		model.addAttribute("COUNTITEM", countitem);
		
		int countcodi = itemservice.countcodi();
		model.addAttribute("COUNTCODI", countcodi);
		String selectcategory;
		if (acc == null)
			selectcategory = "ACC";
		else
			selectcategory = acc.toUpperCase();
		List<ItemVo> accvo;

		if (selectcategory.equals("ACC")) {
			accvo = itemservice.selectcategory(selectcategory);
		} else {
			accvo = itemservice.selectlittlecategory(selectcategory);
		}
		model.addAttribute("SELECTCATEGORY", accvo);
		model.addAttribute("SELECTLITTLECATEGORY", selectcategory);
		return "acc";
	}
	

	
	@RequestMapping(value="/tocart")
	public String tocart(HttpSession session, Model model,
			HttpServletRequest request, HttpServletResponse response) throws Exception
	{

		int countitem = itemservice.countitem();
		model.addAttribute("COUNTITEM", countitem);
		
		int countcodi = itemservice.countcodi();
		model.addAttribute("COUNTCODI", countcodi);
		UserVo uvo=(UserVo) session.getAttribute("login");	
		String id = uvo.getId();
						
		ArrayList<CartVo> cvolist= (ArrayList<CartVo>)itemservice.selectitemfromcart(id);
	 
		
		// List<ItemVo> shoppinglist = new ArrayList<>();
		 
		for(int i=0; i<cvolist.size() ;i++)
		{
			CartVo cvo = (cvolist.get(i));
		 	
			Integer clothcode = cvo.getClothcode();
		
		 ItemVo ivo = itemservice.shoppeditem(clothcode);
			 
			 
			///shoppinglist.add(cvo);
		
			
	
		}
		
			
//		session.setAttribute("shoppinglist", shoppinglist);
//		model.addAttribute("shoppinglist", shoppinglist);
		
		model.addAttribute("cartlist",cvolist);
		return "/item/cart";
		
	}
	
	//泥댄겕�맂 �빆紐⑸뱾�쓽 媛믪쓣 媛��졇�� �꽭�뀡�뿉 �떞�뒗�떎.
	@RequestMapping(value="/buy")
	public String tobuy(int[] chk, HttpSession session, Model model,
			HttpServletRequest request, HttpServletResponse response,CartVo cartvo
			) throws Exception
	{

		int countitem = itemservice.countitem();
		model.addAttribute("COUNTITEM", countitem);
		
		int countcodi = itemservice.countcodi();
		model.addAttribute("COUNTCODI", countcodi);
		UserVo uvo =  (UserVo) session.getAttribute("login");
		
		String id=uvo.getId();
	
	 
		Integer price = 0;
		Integer allprice = 0;
		Integer deliverycharge =1;
		Integer mileage = 0;
		List<CartVo> shoppinglist = new ArrayList<>();
		if(chk!=null){
		
		for(int i=0;i<chk.length;i++){
			int cartbno=chk[i];
			CartVo ivo=itemservice.userchoice(cartbno);
			price=ivo.getPrice();	
			
			allprice =allprice+price;
			shoppinglist.add(ivo); 
			
			deliverycharge=2500*(chk.length);
		}
		
		}else{
			
			 shoppinglist.add(cartvo);  
			deliverycharge=2500;
			allprice=cartvo.getPrice();
		}
	
	 

	
		mileage=(int) (allprice*0.1);
		
		session.setAttribute("shoppinglist", shoppinglist);
		session.setAttribute("ordertakerprice", allprice);						//allprice가 체크한 항목들의 가격 합
		session.setAttribute("ordertakerdeliverycharge", deliverycharge);		//배송료
		session.setAttribute("ordertakermileage", mileage);						//적립될 마일리지.
		 
		return "/item/buy";
		
	}
	
	@RequestMapping(value="/jusoPopup")
	public String jusoPopup( HttpSession session, Model model) throws Exception
	{
	
		return "/popup/jusoPopup";
		
	}
	
	@RequestMapping(value="/ordertaker")
	public  @ResponseBody OrderVo ordertaker(HttpSession session,
			@RequestBody OrderVo ordervo) throws Exception
	{
	 
		UserVo uvo = (UserVo) session.getAttribute("login");
		String id=uvo.getId();
		 
		 PayVo pvo=new PayVo();
		 
		    pvo.setId(id); 
		    
	 AddressVo avo=new AddressVo();
		avo.setId(id);
		avo.setAddress(ordervo.getAddress());
	 
	  	userservice.updateaddress(avo); //address 넣기
		
		List<CartVo> cartlist=(List<CartVo>) session.getAttribute("shoppinglist");
		
	for(int i=0;i<cartlist.size();i++){
		CartVo cartvo=cartlist.get(i);
		 
			
			cartvo.setId(id);
		 
			 itemservice.coloramount(cartvo);//구입한 수량 빼기
	 
			if(cartvo.getCartbno()!=0){
			 itemservice.deletefromcart(cartvo.getCartbno());//장바구니에서 지우고
			}
	 
		 ItemVo itvo=itemservice.readposting(cartvo.getClothcode());
		 pvo.setBrandid(itvo.getId());
		 pvo.setClothcode(cartvo.getClothcode());
      itemservice.insertintopaytb(pvo);//ㅍㅔ이 티비에 넣고
		}
 	 
	 
 	
	Integer plusmileage = (Integer) session.getAttribute("ordertakermileage");
	Integer minusmileage =(Integer) session.getAttribute("ordertakerprice");
	Integer deliverycharge=(Integer) session.getAttribute("ordertakerdeliverycharge");
	Integer mileage = uvo.getMileage();
 
 
	mileage +=plusmileage-minusmileage;
 
	
	MileageVo mvo = new MileageVo();
	
	mvo.setId(id);		
	mvo.setMileage(mileage);
 	userservice.updatemileage(mvo);
	 
	 
	ordervo.setDeliverycharge(deliverycharge);
 
	ordervo.setMileage(plusmileage);
	 
	ordervo.setPrice(minusmileage);
	
 	return ordervo;
		
	}
	

//
//	@RequestMapping(value="/payment")
//	public String payment(HttpSession session,
//			String name, String address, String howtopay, AddressVo avo) throws Exception
//	{
//		
//		UserVo uvo = (UserVo) session.getAttribute("login");
//		String id = uvo.getId();
//		
//		Integer plusmileage = (Integer) session.getAttribute("ordertakermileage");
//		Integer minusmileage =(Integer) session.getAttribute("ordertakerprice");
//		
//		Integer mileage = uvo.getMileage();
//	 
//	 
//		mileage +=plusmileage-minusmileage;
//		
//	 
//		
//		MileageVo mvo = new MileageVo();
//		
//		mvo.setId(id);		
//		mvo.setMileage(mileage);
//		userservice.updatemileage(mvo);
//		
//		
//		userservice.updatemileage(mvo);
//				
//					
//		return "homemain";
//		
//	}
	@RequestMapping(value="/select")
	private String select(@ModelAttribute("submit")String submit ,CartVo cartvo,ItemInfoVo iteminfovo,HttpSession session){
 
		 
		String path=null;
		 
		if(submit.equals("cart")){ 
			path="redirect:/item/incart";
		}else if(submit.equals("buy now!")){
			path="/user/buy";
		}
		 session.setAttribute("Cart",cartvo);
	  
		return path;
	}
	@RequestMapping(value="/incart",method=RequestMethod.POST)
	private @ResponseBody CartVo select(@RequestBody CartVo cartvo,Model model,HttpSession session){
	 
		//ResponseEntity<String> entity=null;
		try{
			UserVo vo=(UserVo)session.getAttribute("login");
			cartvo.setId(vo.getId());
		itemservice.incart(cartvo);
	//	 entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
		//	entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return cartvo;
		
	}
	
	 
	
	/*@RequestMapping("/image")
	private String getImage(@ModelAttribute("bno") int bno, Model model) {

		// @PathVariable=媛믪씠 �뵲�씪�떎�땲�뒗寃�.
		ItemVo imageFile = service.get(bno);
		model.addAttribute("imageFile", imageFile);
		return "uploadComplete";

	}*/
	 
@RequestMapping(value="/cart")
private String cart(HttpSession session,Model model) throws Exception{

	int countitem = itemservice.countitem();
	model.addAttribute("COUNTITEM", countitem);
	
	int countcodi = itemservice.countcodi();
	model.addAttribute("COUNTCODI", countcodi);
	UserVo uservo=(UserVo)session.getAttribute("login");
	
	List<CartVo> vo=itemservice.cart(uservo.getId());
	
	model.addAttribute("cart",vo);
	return "/item/cart";
}
@RequestMapping(value="/myshopping")
private String myshopping(HttpSession session,Model model)throws Exception{

	int countitem = itemservice.countitem();
	model.addAttribute("COUNTITEM", countitem);
	
	int countcodi = itemservice.countcodi();
	model.addAttribute("COUNTCODI", countcodi);
	UserVo uservo=(UserVo)session.getAttribute("login");
	List<ItemVo> itemvo=itemservice.selectitemfrompaytb(uservo.getId());
	model.addAttribute("myshopping",itemvo);
	return "myshopping";
	
}
 
}
