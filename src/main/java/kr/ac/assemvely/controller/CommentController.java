package kr.ac.assemvely.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.assemvely.service.CommentService;
import kr.ac.assemvely.vo.CommentVo;
import kr.ac.assemvely.vo.UserVo;

@Controller
@RequestMapping("/comment")
public class CommentController {
	
	@Inject
	CommentService service;
	
	
	@RequestMapping("/list")
	public String list(@ModelAttribute("clothcode") Integer clothcode,Model model) throws Exception{
		model.addAttribute("clothcode",clothcode);
		
		return "comment";
	}
	
	
	@RequestMapping(value="/b_insert",method=RequestMethod.POST)
	public ResponseEntity<String> insert(@RequestBody CommentVo commentvo){
		
		ResponseEntity<String> entity=null;
		try {
			service.c_insert(commentvo);
			entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
				
		return entity;
	}
	
	@RequestMapping(value="/b_list",method=RequestMethod.GET)
	//public @ResponseBody List<CommentVo> list(Model model,@PathVariable Integer bno) throws Exception{
	public @ResponseBody List<CommentVo> list(Model model,@RequestParam(value="bno") Integer bno, @RequestParam(value="boardcode") String boardcode,CommentVo commentvo) throws Exception{
		
	
		
		commentvo.setBno(bno);
		commentvo.setBoardcode(boardcode);
		
	return service.c_list(commentvo);
		
		
		
		
		
		
		
	}
	
	
	//@RequestMapping(value="c_delete/{c_bno}",method=RequestMethod.GET)
	//public ResponseEntity<String> c_delete(@PathVariable Integer c_bno) throws Exception{
	@RequestMapping(value="c_delete",method=RequestMethod.GET)
	public ResponseEntity<String> c_delete(@RequestParam(value="c_bno") Integer c_bno,@RequestParam(value="id") String id,HttpSession session) throws Exception{
		
		System.out.println("!!!!!!!!!!!!!!!!!!################");
		ResponseEntity<String> entity=null;
		
		UserVo uservo=(UserVo) session.getAttribute("login");
		String loginid=uservo.getId();
		System.out.println(id);
	
		System.out.println(c_bno);
		//if(loginid.equals("id")){
			try {
				service.c_delete(c_bno);
				entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			
			} catch(Exception e) { }

			//		rttr.addFlashAttribute("bno",bno);
			
		
		
		
		
	
		return entity;
		
	}
	
	
  
}
