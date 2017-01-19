package kr.ac.assemvely.controller;

import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
 
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.tools.FileObject;

import org.apache.commons.io.IOUtils;
import org.json.simple.ItemList;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.Base64Encoder;

import kr.ac.assemvely.service.CodiService;
import kr.ac.assemvely.service.ItemService;
import kr.ac.assemvely.vo.CodiVo;
import kr.ac.assemvely.vo.CodiandItemVo;
import kr.ac.assemvely.vo.CodiandwritedateVo;
import kr.ac.assemvely.vo.CodicommentVo;
import kr.ac.assemvely.vo.CodiimgVo;
import kr.ac.assemvely.vo.CodiimgVo2;
import kr.ac.assemvely.vo.Criteria;
import kr.ac.assemvely.vo.ItemVo;
import kr.ac.assemvely.vo.PageMaker;
import kr.ac.assemvely.vo.UserVo;

@Controller
@RequestMapping("/codi")
public class CodiController 
{
   @Inject
   private CodiService codiservice;
   
   @Inject
   private ItemService itemservice;
   
   @RequestMapping(value="/mycodipage")
   public String mycodipage(HttpSession session, Model model) throws Exception
   {
   
      UserVo uservo = (UserVo) session.getAttribute("login");
      String id = uservo.getId();
      
      List<CodiimgVo> codilist =codiservice.select_my_codi_list(id);
      List<CodiimgVo2> newcodilist = new ArrayList<CodiimgVo2>(); 
      
      for(int i=0; i<codilist.size(); i++)
      {
      
         CodiimgVo onecloth = codilist.get(i);
         
         
         Date thisdate = onecloth.getWritedate();

         SimpleDateFormat dateformat = new SimpleDateFormat("yy-MM-dd-HH-mm");
                        
         String resultdate = dateformat.format(thisdate);      
         
         String path  = "C://android//codi//"+onecloth.getCodicapture();
         
         InputStream in = new BufferedInputStream(new FileInputStream(path));
      
         byte[] info =IOUtils.toByteArray(in);   
         
         String encodeBase64 = Base64Encoder.encode(info);

         CodiimgVo2 thisonecloth = new CodiimgVo2();
 
         thisonecloth.setCodicapture(encodeBase64);
         thisonecloth.setCodicomment(onecloth.getCodicomment());
         thisonecloth.setId(id);
         thisonecloth.setWritedate(resultdate);
         
         newcodilist.add(thisonecloth); 

      }
      
      
      model.addAttribute("codilist", newcodilist);

      return "mycodilist";   
   }
   
   
   @RequestMapping(value="/codimodify", method={RequestMethod.GET,RequestMethod.POST})
   public String codimodify(HttpSession session, Model model, @ModelAttribute("cri")Criteria cri,
         HttpServletRequest request, HttpServletResponse response
         //@ModelAttribute("writedate")Date writedate) 
         )
               throws Exception
   {
   
      UserVo uvo = (UserVo) session.getAttribute("login");      
      String id = uvo.getId();
      
      String writedate = request.getParameter("writedate");
      
   //   System.out.println("writedate : "+writedate);
      
      CodiandwritedateVo vo = new CodiandwritedateVo();
       vo.setId(id);
       vo.setWritedate(writedate);
       
   //   System.out.println("vo : "+vo);
       
      List<CodiVo> codilist = codiservice.select_codi_list_by_writedate(vo);
      System.out.println("codilist : "+codilist);
      
      List<ItemVo> itemlist = new ArrayList<ItemVo>();
      List<CodiandItemVo> codiinfolist = new ArrayList<CodiandItemVo>();
      
      for(int i =0; i<codilist.size(); i++)
      {
         CodiVo oneitem = codilist.get(i);
         
         int thisclothcode = oneitem.getClothcode();
         String thiscoordinate_x = toString().valueOf(oneitem.getCoordinate_x());
         String thiscoordinate_y = toString().valueOf(oneitem.getCoordinate_y());
         String thiswidth = toString().valueOf(oneitem.getWidth());
         String thisheight = toString().valueOf(oneitem.getHeight());
         String thisarrayindex = toString().valueOf(oneitem.getArrayindex());
         String thisid = toString().valueOf(oneitem.getId());
         String thismagnify = toString().valueOf(oneitem.getRatiomagnify());
         
         ItemVo thisitem = itemservice.readposting(thisclothcode);
         
         String path = "C://android//item//"+thisitem.getImgname();
         System.out.println("path : "+path);
         
         
         InputStream in = new BufferedInputStream(new FileInputStream(path));
         byte[] info =IOUtils.toByteArray(in);   
         String encodeBase64 = Base64Encoder.encode(info);
         
         CodiandItemVo codiinfo = new CodiandItemVo();
         codiinfo.setArrayindex(oneitem.getArrayindex());
         codiinfo.setCoordinate_x(oneitem.getCoordinate_x());
         codiinfo.setCoordinate_y(oneitem.getCoordinate_y());
         codiinfo.setClothcode(oneitem.getClothcode());
         codiinfo.setHeight(oneitem.getHeight());
         codiinfo.setId(oneitem.getId());
         codiinfo.setImgname(encodeBase64);
         codiinfo.setWidth(oneitem.getWidth());
         codiinfo.setWritedate(oneitem.getWritedate());
         codiinfo.setRatiomagnify(oneitem.getRatiomagnify());
         
         codiinfolist.add(codiinfo);
      //   System.out.println("codiinfo : "+codiinfo);
         
         itemlist.add(thisitem);
         
         model.addAttribute("codiinfolist", codiinfolist);
      }
      

   //   System.out.println("codiinfolist : "+codiinfolist);
      
      
      model.addAttribute("codilist", codilist);
      model.addAttribute("itemlist", itemlist);
      model.addAttribute("SELECTCATEGORY", itemservice.item_list_page(cri));
      
      PageMaker pagemaker = new PageMaker();
      pagemaker.setCri(cri);
      pagemaker.setTotalCount(itemservice.countitem(cri));
      
      model.addAttribute("pagemaker", pagemaker);

      
      return "codimodify";   
   }
   
   //코디, 좌표로 저장.
   @RequestMapping(value="/savecodi", method=RequestMethod.POST)
   public void save(@RequestParam(value="data")String data, @RequestParam(value="comment")String codicomment,
      //   CodiVo vo, 
         HttpServletRequest request, HttpServletResponse response,
         HttpSession session
         ) throws Exception
   {
      
      request.setCharacterEncoding("UTF-8");
      //String jsonInfo = request.getParameter("jsonInfo");
       response.setContentType("text/html;charset=UTF-8");
       
       JSONParser parser = new JSONParser();
       JSONArray jarr = (JSONArray)parser.parse(data);
       UserVo uvo =  (UserVo)session.getAttribute("login");
       String id = uvo.getId();
      
       
       for(int i=0; i<jarr.size(); i++)
       {
          JSONObject job = (JSONObject)jarr.get(i);
          
           CodiVo codivo = new CodiVo();

           
           Integer arrayindex = (int)job.get("arrayindex");
           
           String string_clothcode = (String)job.get("clothcode");
           Integer clothcode = Integer.parseInt(string_clothcode);
           
           Integer coordinate_x = (int)job.get("x");
           
           Integer coordinate_y = (int)job.get("y");
           
           Integer width = (int)job.get("width");

           
           Integer height = (int)job.get("height");


           codivo.setAngle(0);
           codivo.setArrayindex(arrayindex);
           codivo.setClothcode(clothcode);
           codivo.setCoordinate_x(coordinate_x);
           codivo.setCoordinate_y(coordinate_y);
           codivo.setWidth(width);
           codivo.setHeight(height);
           codivo.setId(id);
           
          // System.out.println(toString().valueOf(codivo));
           
           codiservice.new_codi_save(codivo);

       }
       
       
       CodicommentVo codicommentvo = new CodicommentVo();
       codicommentvo.setId(id);
       codicommentvo.setCodicomment(codicomment);       
    
       codiservice.new_codi_comment(codicommentvo);
       

    //   System.out.println(data);
       
      
   }
   

   
 /*  @RequestMapping(value="/savecodi2" )
   public void new_codi_img(HttpSession session, Model model, @RequestParam(value="data")String data, CodiimgVo codiimgvo) throws Exception
   {
      
       UserVo uvo =  (UserVo)session.getAttribute("login");
       
       String id=uvo.getId();
      
      JSONParser parser = new JSONParser();
      // JSONObject job = (JSONObject) parser.parse(data);
      JSONArray jarr = (JSONArray)parser.parse(data); 
      
      for(int i=0; i<jarr.size(); i++)
      {
         String codiimg =(String) jarr.get(i);
         
         System.out.println("job : "+codiimg);
         
      //   String codiimg = (String) job.get("data");
         
          codiimgvo.setId(id);
          codiimgvo.setCodiimg(codiimg);
          
          codiservice.new_codi_img(codiimgvo);

      }
      


   }*/
   
   //******************************************************************************************
   //***********************코디tb와 코디tb3에 각각 데이터들이 들어간다. **********************************
   //******************************************************************************************
   @RequestMapping(value = "/slip", method = RequestMethod.POST)
   public void slip(HttpServletRequest request, HttpServletResponse response, HttpSession session, 
         CodiimgVo codiimgvo, Locale locale
         //@RequestParam(value="comment")String codicomment
         ) throws Exception 
   {
          try 
          {
             UserVo uvo = (UserVo)session.getAttribute("login");             
             String id = uvo.getId();

             //정보 받아옴.
              String data = request.getParameter("data");           
              String codijsonarray = request.getParameter("codijsonarray");      
              String codicomment = request.getParameter("comment");
              
              JSONParser parser = new JSONParser();
              JSONArray jarr = (JSONArray)parser.parse(data);
              JSONArray codi_item_list = (JSONArray)parser.parse(codijsonarray);
                            
              for(int i=0; i<jarr.size(); i++)
              {
                 //codiimg = 받아온 정보
                 String codiimg = (String)jarr.get(i);
                       
                 File savePath = new File("/android/codi/");
                               
                 //받아온 정보 디코딩.
                 codiimg = codiimg.replaceAll("data:image/jpeg;base64,", "");
                 
                 //file = 디코딩된 이미지 정보.
                 byte [] file = Base64.getDecoder().decode(codiimg); 
         
                 //randomid= 랜덤으로 정해질 이미지 이름                 
                 String randomid=UUID.randomUUID().toString();
                 
                 //filePath = 이미지가 저장될 경로
                 String filePath = savePath+"/"+randomid+".jpeg";

                 String filename = randomid+".jpeg";
                 
                 FileOutputStream osf = new FileOutputStream(new File(filePath));
                 
                 //경로에 파일 저장.
                 osf.write(file);

                 ByteArrayInputStream is = new ByteArrayInputStream(file);
                
                 response.setContentType("image/jpeg");      
              //   response.setHeader("Content-Disposition", "attachment; filename=data.png"); 
                 
              //   IOUtils.copy(is, response.getOutputStream());
              //   response.flushBuffer();

                 String from = "2013-04-08 10:10:10";
                 SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                 Date to = (Date) transFormat.parse(from);
                                  
                 codiimgvo.setWritedate(to);
                 codiimgvo.setCodicapture(filename);
                 codiimgvo.setId(id);
                 codiimgvo.setCodicomment(codicomment);
                 
      //           System.out.println("codiimgvo : "+codiimgvo);
                 
                 codiservice.new_codi_img(codiimgvo);
                 
                 osf.close();
                 osf.flush();
              
              }
             for(int i=0; i<codi_item_list.size(); i++)
             {
                JSONObject job = (JSONObject)codi_item_list.get(i);
                
                 CodiVo codivo = new CodiVo();

                 String stringarrayindex = Long.toString((long) job.get("arrayindex"));
                 Integer arrayindex = Integer.parseInt((String) stringarrayindex);
                 
                 String string_clothcode = (String)job.get("clothcode");
                 Integer clothcode = Integer.parseInt(string_clothcode);
                 
                 String stringcoordinate_x = Long.toString((long)job.get("x"));
                 String stringcoordinate_y = Long.toString((long)job.get("y"));
                 
                 Integer coordinate_x = Integer.parseInt(stringcoordinate_x);
                 Integer coordinate_y = Integer.parseInt(stringcoordinate_y);
                 
                 String stringwidth = Long.toString((long)job.get("width"));
                 String stringheight = Long.toString((long)job.get("height"));
                 
                 Integer width = Integer.parseInt(stringwidth);
                 Integer height = Integer.parseInt(stringheight);
                 
                 Double ratiomagnify = (Double)job.get("ratiomagnify");

                 String from = "2013-04-08 10:10:10";
                 SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                 Date to = (Date) transFormat.parse(from);
                 
                 codivo.setWritedate(to);
                 codivo.setAngle(0);
                 codivo.setArrayindex(arrayindex);
                 codivo.setClothcode(clothcode);
                 codivo.setCoordinate_x(coordinate_x);
                 codivo.setCoordinate_y(coordinate_y);
                 codivo.setWidth(width);
                 codivo.setHeight(height);
                 codivo.setId(id);
                 codivo.setRatiomagnify(ratiomagnify);
                 
          //       System.out.println(toString().valueOf("저장된 codivo : "+codivo));
                 
                 codiservice.new_codi_save(codivo);
                 
             }
              
          }
          
          catch(IOException e) 
          {
              e.printStackTrace();
          }

          
   }
 
   
   
}