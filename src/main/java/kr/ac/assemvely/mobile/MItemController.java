package kr.ac.assemvely.mobile;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.assemvely.service.ItemService;
import kr.ac.assemvely.service.UserService;
import kr.ac.assemvely.vo.CartVo;
import kr.ac.assemvely.vo.ItemInfoVo;
import kr.ac.assemvely.vo.ItemVo;
import kr.ac.assemvely.vo.MileageVo;
import kr.ac.assemvely.vo.MyShoppingVo;
import kr.ac.assemvely.vo.PayVo;
import kr.ac.assemvely.vo.UserDto;
import kr.ac.assemvely.vo.UserVo;

@Controller
@RequestMapping("/m/item")
public class MItemController {

	
	@Inject
	private ItemService itemservice;
	
	@Inject
	private UserService userservice; 
	
//	@RequestMapping(value="readposting")
//	public @ResponseBody List<ItemVo> listlittlecategoryouterGET()throws Exception{
//		String st="OUTER";
//		return itemservice.selectcategory(st);
//	}
	
	@RequestMapping(value="/readposting",method=RequestMethod.POST)
	private @ResponseBody ItemVo readposting(String clothcode) throws Exception{
 

		 
		Integer code=Integer.valueOf(clothcode);
				return itemservice.readposting(code);
			
				
				
				
	}
	@RequestMapping(value="/content")
	private @ResponseBody List<ItemVo> readcontent(int clothcode)throws Exception{
		ItemVo itemvo=new ItemVo();
		
		Pattern pattern=Pattern.compile("src=[\"']?[^>\"']+");
		itemvo=itemservice.readposting(clothcode);
		String content=itemvo.getContent();
	
		String realcontent=content.replaceAll("[°¡-ÆR¤¡-¤¾¤¿-¤Ó!~]","");

			Matcher match=pattern.matcher(realcontent);
			String imgTag=null;
			String realimgname=null;
			
		List<ItemVo> all=new ArrayList<>();
			while(match.find()){
				ItemVo item=new ItemVo();
				imgTag=match.group();
				 realimgname=imgTag.replaceAll("(src=?[\"'])","");
			 
				 item.setImgname(realimgname);
				 
				 all.add(item);
			}
		 
		return all;
		
	}
	
	@RequestMapping(value="/readinfo")
	private @ResponseBody List<ItemInfoVo> readinfo(String clothcode)throws Exception{
	//	int code=Integer.valueOf(clothcode);
//		System.out.println("¿©±â"+clothcode);
 	int code=Integer.valueOf(clothcode);
//	 
//		System.out.println("ÀÌ°Å"+itemservice.readinfo(code));
		return itemservice.readinfo(code);
		
	}
	@RequestMapping(value="/myshopping")
	private @ResponseBody MyShoppingVo myshopping(String id)throws Exception{
		 MyShoppingVo shopping=new MyShoppingVo();
	 
		shopping.setUservo(userservice.mypage(id));
		shopping.setItemvo(itemservice.selectitemfrompaytb(id));
		return shopping;
		
	}
	 @RequestMapping(value="/seller")
	 private @ResponseBody MyShoppingVo sellerpage(String id, String category) throws Exception{
		 MyShoppingVo shopping=new MyShoppingVo();
		 shopping.setUservo(userservice.mypage(id));
		 if(category==null){
			 shopping.setItemvo(itemservice.selectuser(id));
		 }else{
			 ItemVo vo=new ItemVo();
			 vo.setId(id);
			 vo.setCategorycode(category);
			 shopping.setItemvo(itemservice.branditem(vo));
		 }
		 return shopping;
		 
	 }
	 
	  @RequestMapping(value="/outer")
      public @ResponseBody List<ItemVo> listlittlecategoryouterGET(Model model, String outer)throws Exception{
      
      System.out.println("outer : " + outer);
      String selectcategory;
      if(outer ==null)
         selectcategory ="OUTER";
      else
         selectcategory = outer.toUpperCase();
      List<ItemVo> outervo;
      
      
      if (selectcategory.equals("OUTER")){
         outervo = itemservice.selectcategory(selectcategory);
      }else{
         outervo = itemservice.selectlittlecategory(selectcategory);
      }
      
      //System.out.println("outervo.size() : " + outervo.size() ); 
      
      model.addAttribute("SELECTCATEGORY", outervo);
      model.addAttribute("SELECTLITTLECATEGORY",selectcategory);
         //return itemservice.selectcategory("OUTER");
      return outervo;
      }
   
   @RequestMapping(value="/top")
      public @ResponseBody List<ItemVo> listlittlecategorytopGET(Model model, String top)throws Exception{
      
      System.out.println("top : " + top);
      String selectcategory;
      if(top ==null)
         selectcategory ="TOP";
      else
         selectcategory = top.toUpperCase();
      List<ItemVo> topvo;
      
      //////////////// selectcategory °¡ JACKET È®ÀÎ
      
      if (selectcategory.equals("TOP")){
         topvo = itemservice.selectcategory(selectcategory);
      }else{
         topvo = itemservice.selectlittlecategory(selectcategory);
      }
      
      //System.out.println("outervo.size() : " + outervo.size() ); 
      
      model.addAttribute("SELECTCATEGORY", topvo);
      model.addAttribute("SELECTLITTLECATEGORY",selectcategory);
         //return itemservice.selectcategory("OUTER");
      return topvo;
      
      /*String to="TOP";
         return itemservice.selectcategory(to);*/
      }
   
   @RequestMapping(value="/bottom")
      public @ResponseBody List<ItemVo> listlittlecategorybottomGET(Model model, String bottom)throws Exception{
      
      System.out.println("bottom : " + bottom);
      String selectcategory;
      if(bottom ==null)
         selectcategory ="BOTTOM";
      else
         selectcategory = bottom.toUpperCase();
      List<ItemVo> bottomvo;
      
      //////////////// selectcategory °¡ "JACKET" ...
      
      if (selectcategory.equals("BOTTOM")){
         bottomvo = itemservice.selectcategory(selectcategory);
      }else{
         bottomvo = itemservice.selectlittlecategory(selectcategory);
      }
      
      //System.out.println("outervo.size() : " + outervo.size() ); 
      
      model.addAttribute("SELECTCATEGORY", bottomvo);
      model.addAttribute("SELECTLITTLECATEGORY",selectcategory);
        
      return bottomvo;
      /*String bo="BOTTOM";
         return itemservice.selectcategory(bo);*/
      }

   
   @RequestMapping(value="/skirt")
      public @ResponseBody List<ItemVo> listlittlecategoryskirtGET(Model model, String skirt)throws Exception{
      
      System.out.println("skirt : " + skirt);
      String selectcategory;
      if(skirt ==null)
         selectcategory ="SKIRT";
      else
         selectcategory = skirt.toUpperCase();
      List<ItemVo> skirtvo;
      
      //////////////// selectcategory °¡ "JACKET" ...
      
      if (selectcategory.equals("SKIRT")){
         skirtvo = itemservice.selectcategory(selectcategory);
      }else{
         skirtvo = itemservice.selectlittlecategory(selectcategory);
      }
      
      //System.out.println("outervo.size() : " + outervo.size() ); 
      
      model.addAttribute("SELECTCATEGORY", skirtvo);
      model.addAttribute("SELECTLITTLECATEGORY",selectcategory);
         //return itemservice.selectcategory("OUTER");
      return skirtvo;
      
      /*String sk="SKIRT";
         return itemservice.selectcategory(sk);*/
      }
   
   @RequestMapping(value="/dress")
      public @ResponseBody List<ItemVo> listlittlecategorydressGET(Model model, String dress)throws Exception{
      
      System.out.println("dress : " + dress);

      String selectcategory;
      if(dress ==null)
         selectcategory ="DRESS";
      else
         selectcategory = dress.toUpperCase();
      List<ItemVo> dressvo;
      
      //////////////// selectcategory °¡ "JACKET" ...
      
      if (selectcategory.equals("DRESS")){
         dressvo = itemservice.selectcategory(selectcategory);
      }else{
         dressvo = itemservice.selectlittlecategory(selectcategory);
      }
      
      //System.out.println("outervo.size() : " + outervo.size() ); 
      
      model.addAttribute("SELECTCATEGORY", dressvo);
      model.addAttribute("SELECTLITTLECATEGORY",selectcategory);
         //return itemservice.selectcategory("OUTER");
      return dressvo;
      
      /*String dr="DRESS";
         return itemservice.selectcategory(dr);*/
      }
   
   @RequestMapping(value="/acc")
      public @ResponseBody List<ItemVo> listlittlecategoryaccGET(Model model, String acc)throws Exception{
      
      System.out.println("acc : " + acc);

      String selectcategory;
      if(acc ==null)
         selectcategory ="ACC";
      else
         selectcategory = acc.toUpperCase();
      List<ItemVo> accvo;
      
      //////////////// selectcategory °¡ "JACKET" ...
      
      if (selectcategory.equals("ACC")){
         accvo = itemservice.selectcategory(selectcategory);
      }else{
         accvo = itemservice.selectlittlecategory(selectcategory);
      }
      
      //System.out.println("outervo.size() : " + outervo.size() ); 
      
      model.addAttribute("SELECTCATEGORY", accvo);
      model.addAttribute("SELECTLITTLECATEGORY",selectcategory);
         //return itemservice.selectcategory("OUTER");
      return accvo;
      /*String ac="ACC";
         return itemservice.selectcategory(ac);*/
      }
   
   @RequestMapping(value="/cart", method={RequestMethod.POST, RequestMethod.GET})
   private @ResponseBody List<CartVo> cart(HttpSession session,
         HttpServletRequest request, HttpServletResponse response
         ) throws Exception
   {
      
      request.setCharacterEncoding("UTF-8");
       response.setContentType("text/html;charset=UTF-8");
       
       String id = request.getParameter("id");
       
      List<CartVo> cartlist =itemservice.cart(id);

   
      return cartlist;
   }
   //¾ÆÀÌµð ¹Þ¾Æ¿À°í , selected_cartlist ¹Þ¾Æ¿À°í, => ÇßÀ½.
   //selected_cartlist»èÁ¦ÇÏ°í itemtb¿¡¼­ ¼ö·® »èÁ¦ÇÏ°í, 
   //paytb·Î ž«±â±â.
   @RequestMapping(value="/tomobileordertaker", method={RequestMethod.POST, RequestMethod.GET})
   private void tomobileordertaker(
         //@RequestParam("sellected_cartlist")ArrayList<CartVo> sellected_cartlist,   //reqeustparamÀ¸·Î sellected_cartlist¸¦ ¹Þ¾Æ¿Â´Ù.
         HttpServletRequest request, HttpServletResponse response
         ) throws Exception
   {
      
      request.setCharacterEncoding("UTF-8");
      
      String sellected_cartlist = request.getParameter("sellected_cartlist");
      String id = request.getParameter("id");
      
       PayVo pvo=new PayVo();
       pvo.setId(id); 
       
      
      JSONParser parser = new JSONParser();
      JSONArray jarr = (JSONArray) parser.parse(sellected_cartlist);
      
      for(int i =0; i<jarr.size(); i++)
      {
         JSONObject job = (JSONObject) jarr.get(i);
         
         CartVo cvo = new CartVo();
         
         String name = (String) job.get("name");
         String amount = (String) job.get("amount");
         String clothcode = (String) job.get("clothcode");
         String color = (String) job.get("color");
         String imgname = (String) job.get("imgname");
         String price = (String) job.get("price");
         String cartbno = (String) job.get("cartbno");
                  
         cvo.setId(id);
         cvo.setName(name);
         cvo.setAmount(Integer.parseInt(amount));
         cvo.setClothcode(Integer.parseInt(clothcode));
         cvo.setColor(color);
         cvo.setImgname(imgname);
         cvo.setPrice(Integer.parseInt(price));
         cvo.setCartbno(Integer.parseInt(cartbno));
   
         
         itemservice.coloramount(cvo);   //±¸ÀÔÇÑ ¼ö·® »©±â
         
         if(cvo.getCartbno()!=0)//carttb¿¡¼­ »èÁ¦
         {
            
            itemservice.deletefromcart(cvo.getCartbno());
         }
         
         ItemVo ivo=itemservice.readposting(cvo.getClothcode());
          pvo.setBrandid(ivo.getId());
          pvo.setClothcode(cvo.getClothcode());
         itemservice.insertintopaytb(pvo);// paytb¿¡ ³Ö±â.

           
      }
      
   }
   
   //¸¶ÀÏ¸®Áö ¼öÁ¤ÇØÁÖ±â
   //ÆÄ¶ó¹ÌÅÍ·Î ·Î±×ÀÎ Á¤º¸¶û Â÷°¨µÉ ¸¶ÀÏ¸®Áö, Àû¸³µÉ ¸¶ÀÏ¸®Áö Á¤º¸¸¦ ¹Þ¾Æ¿Â´Ù.
   @RequestMapping(value="/mileagechange", method={RequestMethod.POST, RequestMethod.GET})
   private void mobilemileagechange(HttpSession session,
         HttpServletRequest request, HttpServletResponse response
         ) throws Exception
   {
      
      request.setCharacterEncoding("UTF-8");
       response.setContentType("text/html;charset=UTF-8");
       
       String id =  request.getParameter("id");
       String pw =  request.getParameter("pw");
       
       UserDto dto = new UserDto();
       dto.setId(id);
       dto.setPw(pw);
       
       UserVo uvo = userservice.login(dto);
       
       Integer mileage = uvo.getMileage();
       
       
       int minusmileage = Integer.parseInt(request.getParameter("minusmileage"));
       int plusmileage = Integer.parseInt(request.getParameter("plusmileage"));
       
       mileage = +plusmileage-minusmileage;
       
       MileageVo mvo = new MileageVo();
       
       mvo.setId(id);
       mvo.setMileage(mileage);
       
       userservice.updatemileage(mvo);
       
   }
   
      @RequestMapping(value="readinfo",  method={RequestMethod.POST, RequestMethod.GET})
      private @ResponseBody List<ItemInfoVo> readinfo(HttpServletRequest request,
            HttpServletResponse response)throws Exception{
      //   int code=Integer.valueOf(clothcode);
        
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        String clothcode =  request.getParameter("clothcode");
        
         int code=Integer.valueOf(clothcode);
         
         
      //   String iteminfo =  toString().valueOf(itemservice.readinfo(code));
         
     
         return itemservice.readinfo(code);
         
      }
      
      
      //½º¸¶Æ®Æù¿¡¼­ Àå¹Ù±¸´Ï¿¡ ³Ö±â.
      @RequestMapping(value="tomobileincart",  method={RequestMethod.POST, RequestMethod.GET})
      private void tomobileincart(HttpServletRequest request,
            HttpServletResponse response, CartVo cvo)throws Exception{
      //   int code=Integer.valueOf(clothcode);
        
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        String id =  request.getParameter("id");
        String pw =  request.getParameter("pw");
        Integer clothcode =  Integer.parseInt(request.getParameter("clothcode"));
        Integer amount =  Integer.parseInt(request.getParameter("amount"));
        String color =  request.getParameter("color");
        
      
        UserDto dto = new UserDto();
        dto.setId(id);
        dto.setPw(pw);
        
        UserVo uvo = userservice.login(dto);
        
        cvo.setId(uvo.getId());
        cvo.setClothcode(clothcode);
        cvo.setColor(color);
        cvo.setAmount(amount);
        
        itemservice.incart(cvo);
        
        
      }


  
	
}
