package kr.ac.assemvely.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import kr.ac.assemvely.service.ItemService;
import kr.ac.assemvely.vo.ItemInfoVo;
import kr.ac.assemvely.vo.ItemVo;
import kr.ac.assemvely.vo.UserVo;

@Controller
@RequestMapping("/item")
public class ItemController {

	@Inject
	private ItemService itemservice;
	

	@RequestMapping(value = "/main")
	public String listGET(Model model) throws Exception {
		List<ItemVo> vo;
		vo = itemservice.listitem();
		model.addAttribute("LIST", vo);
		

		List<ItemVo> newitem = itemservice.newitem();
		model.addAttribute("NEWITEM", newitem);
		return "homemain";

	}
	@RequestMapping(value="/posting" )
	public String posting( HttpSession session,Model model){
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
		
		
		return "homemain";
	}
	@RequestMapping(value="/readposting")
	private String readposting(@ModelAttribute("clothcode") String clothcode,Model model) throws Exception{
	 
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
	public String userpage(@RequestParam("id")String id,HttpSession session)throws Exception{
		
		 
 		
		List<ItemVo> vo=itemservice.selectuser(id);
		session.removeAttribute("USERITEM");
		session.setAttribute("USERITEM", vo);
 		
 		 
		
		return "redirect:/user/selectuser?id="+id;
	}
	
 @RequestMapping(value="sellerpage")
 public String sellerpage( HttpSession session)throws Exception{

	 session.removeAttribute("USERITEM");
	 ItemVo itemvo=(ItemVo) session.getAttribute("fromuser");
	 
	 List<ItemVo> vo=null;
	 
	 System.out.println("아이템 셀러페이지 컨트로러"+itemvo.getCategorycode());
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
	/*@RequestMapping("/image")
	private String getImage(@ModelAttribute("bno") int bno, Model model) {

		// @PathVariable=媛믪씠 �뵲�씪�떎�땲�뒗寃�.
		ItemVo imageFile = service.get(bno);
		model.addAttribute("imageFile", imageFile);
		return "uploadComplete";

	}*/
	 

}
