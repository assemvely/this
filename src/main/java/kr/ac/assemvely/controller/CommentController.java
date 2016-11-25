package kr.ac.assemvely.controller;



import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.assemvely.service.CommentService;
import kr.ac.assemvely.vo.CommentVo;
import kr.ac.assemvely.vo.UserVo;

@Controller
@RequestMapping("/comment")
public class CommentController {

	
	@Inject
	CommentService service;
	
	
	//sns ?Œ“ê¸?
	@RequestMapping("/c_list")
	public String c_list(Model model,@ModelAttribute("bno")Integer bno,CommentVo commentvo) throws Exception{
	
		commentvo.setBno(bno);
		
		String boardcode="s";
		commentvo.setBoardcode("s");
		
		
		List<CommentVo> comment=service.c_list(commentvo);
		List<UserVo> userimg=service.c_list_img(commentvo);
		
		
		model.addAttribute("img",userimg);
		
		model.addAttribute("comment",comment);
		model.addAttribute("bno",bno);
		model.addAttribute("boardcode",boardcode);
		return "comment";
		
	}
	
	
	@RequestMapping(value="c_insert", method=RequestMethod.POST)
	public String c_insert(HttpSession session,CommentVo commentvo,Model model,@ModelAttribute("bno")Integer bno,@ModelAttribute("boardcode") String boardcode) throws Exception{
		
		UserVo vo=(UserVo) session.getAttribute("login");
		String id=vo.getId();
		commentvo.setBno(bno);
		commentvo.setId(id);
		commentvo.setBoardcode(boardcode);
		service.c_insert(commentvo);
		
		
		return "redirect:/comment/c_list";
		
		
		
		
	}
	@RequestMapping(value="c_delete")
	public String c_delete(@ModelAttribute("c_bno") Integer c_bno,@ModelAttribute("bno")Integer bno,RedirectAttributes rttr) throws Exception{
		
		
		service.c_delete(c_bno);
		rttr.addFlashAttribute("bno",bno);
		System.out.println(bno);
		return "redirect:/comment/c_list";
	
	}
	
	//seller board ?›„ê¸? ?Œ“ê¸?
	@RequestMapping("/b_list")
	public String b_list(Model model,@ModelAttribute("bno")Integer bno,CommentVo commentvo) throws Exception{
	
		commentvo.setBno(bno);
		
		String boardcode="b";
		commentvo.setBoardcode("b");
		
		
		List<CommentVo> comment=service.c_list(commentvo);
		List<UserVo> userimg=service.c_list_img(commentvo);
		
		
		model.addAttribute("img",userimg);
		
		model.addAttribute("comment",comment);
		model.addAttribute("bno",bno);
		model.addAttribute("boardcode",boardcode);
		return "comment";
		
	}
	
	
	
}
