package kr.ac.assemvely.controller;

import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.assemvely.service.BoardService;
import kr.ac.assemvely.service.ItemService;
import kr.ac.assemvely.vo.BoardVo;

@Controller
@RequestMapping("/customerboard")
public class BoardController {

	@Inject
	private BoardService boardservice;

	@RequestMapping(value = "/listall", method = RequestMethod.GET)
	public String boardlistGET(Model model) throws Exception {
		
		int countitem = boardservice.countitem();
		model.addAttribute("COUNTITEM", countitem);
		
		int countcodi = boardservice.countcodi();
		model.addAttribute("COUNTCODI", countcodi);

		List<BoardVo> listall = boardservice.listall();
		model.addAttribute("LISTALL", listall);
		return "listall";
	}
	
	@RequestMapping(value="/boardreadone")
	public String read(@ModelAttribute("bno")Integer bno, Model model)throws Exception{
		
		int countitem = boardservice.countitem();
		model.addAttribute("COUNTITEM", countitem);
		
		int countcodi = boardservice.countcodi();
		model.addAttribute("COUNTCODI", countcodi);
		
		BoardVo boardvo = boardservice.read(bno);
		model.addAttribute("boardVo", boardvo);
		
		return "boardreadone";
	}
	

	@RequestMapping(value = "/boardwrite")
	public String write(Model model) throws Exception {
		
		int countitem = boardservice.countitem();
		model.addAttribute("COUNTITEM", countitem);
		
		int countcodi = boardservice.countcodi();
		model.addAttribute("COUNTCODI", countcodi);
		
		
		return "boardwrite";
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(BoardVo vo, HttpSession session, Model model) throws Exception {
		
		int countitem = boardservice.countitem();
		model.addAttribute("COUNTITEM", countitem);
		
		int countcodi = boardservice.countcodi();
		model.addAttribute("COUNTCODI", countcodi);

		System.out.println("write들어왔습니다.");

		if (vo.getContent() == null) {

			return "redirect:/customerboard/boardwrite";
		} else {
			boardservice.create(vo);
		}
		return "redirect:/customerboard/listall";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam(value="bno")Integer bno) throws Exception {
		
		boardservice.delete(bno);
		System.out.println("delete 했습니다.");
		return "redirect:/customerboard/listall";
	}
	
	@RequestMapping(value = "/boardupdate")
	public String boardupdate(@ModelAttribute("bno") Integer bno, Model model)throws Exception {
		
		int countitem = boardservice.countitem();
		model.addAttribute("COUNTITEM", countitem);
		
		int countcodi = boardservice.countcodi();
		model.addAttribute("COUNTCODI", countcodi);
		
		BoardVo boardVo = boardservice.read(bno);
		model.addAttribute("boardVo", boardVo);
		return "boardupdate";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(BoardVo boardVo)throws Exception{
		
		boardservice.update(boardVo);
		return "redirect:/customerboard/listall";

	}
	
}
