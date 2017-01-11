package kr.ac.assemvely.mobile;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.assemvely.service.CommentService;
import kr.ac.assemvely.vo.CommentVo;

@Controller
@RequestMapping("/m/comment")
public class McommentController {
	@Inject
	CommentService service;
	
	//sns�뙎湲� �궘�젣�븯湲�
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public @ResponseBody void commentdelete(HttpServletRequest request,HttpServletResponse response) throws Exception{
		System.out.println("dksshdk?");
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html;charset=UTF-8");
	    
		Integer c_bno=Integer.parseInt(request.getParameter("c_bno"));
		System.out.println("�븞�릺�깘");
		service.c_delete(c_bno);
		
	}
	
	
	
	
	

	
	
	
	//�븞�뱶濡쒖씠�뱶 �뙎湲�!!list蹂대뒗寃�@!
	@RequestMapping(value="/list")
	public @ResponseBody List<CommentVo> mobilelist(HttpServletRequest request,CommentVo commentvo,HttpServletResponse response) throws Exception{
	
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html;charset=UTF-8");
	    
		Integer bno=Integer.parseInt(request.getParameter("bno"));
		
		
		commentvo.setBno(bno);
		
		commentvo.setBoardcode("s");
			
		return service.c_list(commentvo);
		
	}
	
	
	
	//�븞�뱶濡쒖씠�뱶 �뙎湲��벐�뒗 遺�遺�!!
		//�븘�뮘�뒗 �씠誘� sharedpreference? 嫄곌린�뿉 �떞湲닿굅 �떞�븯�떎�뒗 媛��젙�븯�뿉...
		@RequestMapping(value="/insert", method=RequestMethod.POST)
		public @ResponseBody void insertcomment(HttpServletRequest request,CommentVo commentvo,HttpServletResponse response) throws Exception{
			
			
			request.setCharacterEncoding("UTF-8");
		    response.setContentType("text/html;charset=UTF-8");

		    
		   Integer bno=Integer.parseInt(request.getParameter("snsbno"));
		  
		    String reply=request.getParameter("reply");
		    String id=request.getParameter("id");
			//bno,reply
			//�븘�뮘 �떞寃쇰떎�뒗 媛��젙�븯�뿉..
			
			String boardcode="s";
			commentvo.setId(id);
			commentvo.setBoardcode(boardcode);
			commentvo.setReply(reply);
			commentvo.setBno(bno);
			
		
			service.c_insert(commentvo);
			
			//return "redirect:/comment/m_list";
	    }
		

		//코디 댓글쓰기
		@RequestMapping(value="/codi_insert")
		public @ResponseBody void codiinsertcomment(String reply,String writedate,String id) throws Exception{
			
		CommentVo commentvo=new CommentVo();
		commentvo.setReply(reply);
		
		DateFormat inputFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
		
		Date date=inputFormat.parse(writedate);
		System.out.println("?"+date);
		commentvo.setCodi_writedate(date);
		commentvo.setBoardcode("c");
		commentvo.setId(id);
		
		
			service.codi_comment(commentvo);
	 	
			
			
			
		}
		
		
		//코디 댓글 목록 불러오기
		@RequestMapping(value="/codi_list")
		public @ResponseBody List<CommentVo> codi_delete(String writedate) throws Exception{
			
			CommentVo commentvo=new CommentVo();
			DateFormat inputFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
			
			Date date=inputFormat.parse(writedate);
			
			System.out.println("왜ㅡ러냐"+date);
			
			commentvo.setCodi_writedate(date);
			commentvo.setBoardcode("c");
			System.out.println("?//");
			
			return service.codi_list(commentvo);
			
			
			
			
		}
		
		
			
}
