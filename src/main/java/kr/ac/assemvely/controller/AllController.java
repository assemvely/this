package kr.ac.assemvely.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

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

import kr.ac.assemvely.service.BoardService;
import kr.ac.assemvely.service.ItemService;
import kr.ac.assemvely.service.UserService;
import kr.ac.assemvely.vo.ItemVo;
import kr.ac.assemvely.vo.NotifyVo;
import kr.ac.assemvely.vo.UserVo;
//���ο��� ���� ��� ��θ� ����
@Controller
@RequestMapping("/all")
public class AllController {

	@Inject
	private UserService userservice;
	
	@Inject
	private ItemService itemservice;
	
	
	@Inject
	private BoardService boardservice;
	
	@RequestMapping(value="/main")
	public String main(){
		return "redirect:/item/main";
	}
	
	@RequestMapping(value="/alert")
	public String alert(){
		return "alert";
	}
	@RequestMapping(value="/posting")
	public String posting(HttpSession session){
		UserVo vo=(UserVo) session.getAttribute("login");
		  
		
		String post = null;
	  
		if(vo.getBsm().equals("m")){
			post="redirect:/manager/posting"; 
		}else if(vo.getBsm().equals("s")){
			post="redirect:/item/posting";
		} 
	 
	 return post;
	}
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String search(Model model, String keyword) throws Exception
	{
		int countitem = boardservice.countitem();
		model.addAttribute("COUNTITEM", countitem);
		
		int countcodi = boardservice.countcodi();
		model.addAttribute("COUNTCODI", countcodi);
		String id = keyword;
	 
		List<UserVo> searchuserlist = userservice.searchuser(id);
		model.addAttribute("searchuserlist", searchuserlist);
		
		String name = keyword;
		 
		List<ItemVo> searchitemlist = itemservice.searchitem(name);
		model.addAttribute("searchitemlist", searchitemlist);
		
		return "searchpage";
	}
	 @RequestMapping(value="/notify", method=RequestMethod.GET)
	 public @ResponseBody List<NotifyVo> notify(HttpSession session) throws Exception{
		 UserVo vo=(UserVo)session.getAttribute("login");
		 List<NotifyVo> notify=itemservice.getnotify(vo.getId());

		 System.out.println("djfalkdjaeil"+notify.toString()); 
		 return notify;
		 
	 }
	  
	   //���� ������.     
	   //��ġ, ����(�ϴ�, �ְ���, �������  )�޾ƿ�.
	   @RequestMapping(value = "/weathercodi", method=RequestMethod.GET)
	   public String weathercodi(Model model,
	         HttpServletRequest request, HttpServletResponse response) throws Exception
	   {
	      
	      JSONParser parser = new JSONParser();
	      
	      try
	      {
	         request.setCharacterEncoding("utf-8");
	         response.setContentType("text/xml;charset=utf-8");

	         try
	         {
	            
	            URLConnection conn = null;         
	            BufferedReader br = null;   
	            BufferedWriter bw = null;
	            //��ġ �޾ƿ�.
	            //conn = new URL("http://ip-api.com/json").openConnection();
	            conn = new URL("https://ipapi.co/json/").openConnection();   
	            conn.addRequestProperty("User-Agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)");   
	         
	            br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
	            JSONObject br1 = (JSONObject)parser.parse(br);
	         //   bw = new BufferedWriter(response.getWriter());
	            
	            //System.out.println(br1.toJSONString());
	            //System.out.println("br : "+br.toString());

	             Double lat = (Double)br1.get("latitude");
	             Double lon = (Double)br1.get("longitude");
	            
	         //   String line = null;
	            
	/*            while ((line = br.readLine())!= null) 
	            {   
	               JSONObject job = (JSONObject)parser.parse(line);
	               System.out.println("line : "+line);
	                           
	            //   System.out.println(toString().valueOf(job));
	               
	               //����
	               Double lat = (Double)job.get("latitude");
	               System.out.println(lat);
	               //�浵
	               Double lon = (Double)job.get("longitude");
	               System.out.println(lon);
	                     
	               
	               bw.write(line);      */

	               
	               try
	               {
	                  
	                  URLConnection weatherconn = null;
	                  BufferedWriter weatherbw = null;
	                  BufferedReader weatherbr = null;   

	                  try
	                  {
	                     //�� ���� ���� �޾ƿ�.
	                     weatherconn = new URL("http://apis.skplanetx.com/weather/summary?appKey=fe99bc8f-0794-3166-9a98-698cc31c13c3&version=1&lat="+lat+"&lon="+lon).openConnection();
	                     weatherbr = new BufferedReader(new InputStreamReader(weatherconn.getInputStream(), "utf-8"));                     
	                     weatherbw = new BufferedWriter(response.getWriter());
	                     String weatherline = null;
	                     while ((weatherline = weatherbr.readLine()) != null) 
	                     {
	                        
	                        JSONObject result = (JSONObject) parser.parse(weatherline);         
	                        JSONObject weather = (JSONObject) result.get("weather");                     
	                        JSONArray summary = (JSONArray)weather.get("summary");                        
	                        String tostringsummary = toString().valueOf(summary);
	                                                                     
	                        
	                        for(int i =0; i<summary.size(); i++)
	                        {
	                           JSONObject sumjob =(JSONObject)summary.get(i);
	                           
	                           String tostringsumjob = toString().valueOf(sumjob);
	                           
	                           //*********************************���� ����**************************************************
//	                           JSONObject yesterday = (JSONObject) sumjob.get("yesterday");                           
//	                           JSONObject yesterdaysky = (JSONObject) yesterday.get("sky");                           
//	                           String yesterdayskyname = toString().valueOf(yesterdaysky.get("name"));                                                   
//	                           JSONObject yesterdayprecipitation = (JSONObject) yesterday.get("precipitation");
//	                           String yesterdayprecipitationrain = toString().valueOf(yesterdayprecipitation.get("rain"));
//	                           String yesterdayprecipitationsnow = toString().valueOf(yesterdayprecipitation.get("snow"));                                                      
//	                           JSONObject yesterdaytemperature = (JSONObject) yesterday.get("temperature");
//	                           String yesterdaytemperaturetmax = toString().valueOf(yesterdaytemperature.get("tmax"));
//	                           String yesterdaytemperaturetmin = toString().valueOf(yesterdaytemperature.get("tmin"));                     
//	                  
//	                           model.addAttribute("yesterdayskyname", yesterdayskyname);
//	                           model.addAttribute("yesterdayprecipitationrain", yesterdayprecipitationrain);
//	                           model.addAttribute("yesterdayprecipitationsnow", yesterdayprecipitationsnow);
//	                           model.addAttribute("yesterdaytemperaturetmax", yesterdaytemperaturetmax);
//	                           model.addAttribute("yesterdaytemperaturetmin", yesterdaytemperaturetmin);
	                           
	                        
	                           //***************************************���� ����***********************************************
	                           JSONObject today = (JSONObject) sumjob.get("today");                           
	                           JSONObject todaysky = (JSONObject) today.get("sky");                           
	                           String todayskyname = toString().valueOf(todaysky.get("name"));                           
	                           JSONObject todaytemperature = (JSONObject) today.get("temperature");
	                           String todaytemperaturetmax = toString().valueOf(todaytemperature.get("tmax"));
	                           String todaytemperaturetmin = toString().valueOf(todaytemperature.get("tmin"));                        
	                        
	                           model.addAttribute("todayskyname", todayskyname);
	                           model.addAttribute("todaytemperaturetmax", todaytemperaturetmax);
	                           model.addAttribute("todaytemperaturetmin", todaytemperaturetmin);
	                           
	                           Double todaytemperaturetmax_double = Double.parseDouble(todaytemperaturetmax);
	                           Double todaytemperaturetmin_double = Double.parseDouble(todaytemperaturetmin);
	                           
	                           Integer todaytemperaturetmax_int = Integer.parseInt(toString().valueOf(Math.round(todaytemperaturetmax_double)));
	                           Integer todaytemperaturetmin_int = Integer.parseInt(toString().valueOf(Math.round(todaytemperaturetmin_double)));
	                           
	                           Integer tempsort = (Integer)((todaytemperaturetmax_int+todaytemperaturetmin_int)/2);
	                           
	                           Integer tempcode = 0;
	                           
	                           if(tempsort<=5)
	                           {
	                              tempcode = 1;
	                           }
	                           else if(5<tempsort && tempsort<=9)
	                           {
	                              tempcode = 2;
	                           }
	                           else if(9<tempsort && tempsort<=11)
	                           {
	                              tempcode = 3;
	                           }
	                           else if(11<tempsort && tempsort<=16)
	                           {
	                              tempcode = 4;
	                           }
	                           else if(16<tempsort && tempsort<=19)
	                           {
	                              tempcode = 5;
	                           }
	                           else if(19<tempsort && tempsort<=22)
	                           {
	                              tempcode = 6;
	                           }
	                           else if(22<tempsort && tempsort<=26)
	                           {
	                              tempcode = 7;
	                           }
	                           else if(26<tempsort)
	                           {
	                              tempcode = 8;
	                           }
	                           
	                           //��¿� �´�  top, bottom, outer, shoes, bag���� �� �ҷ��´�.                                 
	                           List<ItemVo> tempcodetoplist = itemservice.select_top_withtempcode(tempcode);
	                        
	                           List<ItemVo> tempcodebottomlist = itemservice.select_bottom_withtempcode(tempcode);
	                           
	                           List<ItemVo> tempcodeouterlist = itemservice.select_outer_withtempcode(tempcode);
	                                                   
	                           List<ItemVo> tempcodeshoeslist = itemservice.select_shoes_withtempcode(tempcode);

	                           List<ItemVo> tempcodebaglist = itemservice.select_bag_withtempcode(tempcode);
	                           
	                           List<List<ItemVo>> itemlistlist = new ArrayList<List<ItemVo>>();
	                           
	                           //list�� ����ִ´�.
	                           itemlistlist.add(tempcodetoplist);                                          
	                           itemlistlist.add(tempcodebottomlist);
	                           itemlistlist.add(tempcodeouterlist);
	                           itemlistlist.add(tempcodeshoeslist);
	                           itemlistlist.add(tempcodebaglist);
	                                 
	                           
	                                                      
	                           //�������� �� 5���� �������� ���� ����Ʈ.
	                           List<ItemVo> selected_tempcode_itemlist = new ArrayList<ItemVo>();
	                                                
	                           for(int j =0; j<itemlistlist.size(); j++)
	                           {
	                              
	                              List<ItemVo> oneitemlist = itemlistlist.get(j);                     

	                              Random random = new Random();
	                              //top, bottom, outer, shoes, bag���� ���� �ϳ��� �����´�.
	                              ItemVo selected_one_item = oneitemlist.get(random.nextInt(oneitemlist.size()));

	                              //�ϳ��� ������ �����۵��� ����Ʈ�� ��´�.
	                              selected_tempcode_itemlist.add(selected_one_item);

	                              
	                              model.addAttribute("selected_tempcode_itemlist", selected_tempcode_itemlist);

	                           }
	                           

//	                           ********************************���ϳ���***************************************
//	                           JSONObject tomorrow = (JSONObject) sumjob.get("tomorrow");                           
//	                           JSONObject tomorrowsky = (JSONObject) tomorrow.get("sky");                  
//	                           String tomorrowskyname = toString().valueOf(tomorrowsky.get("name"));                           
//	                           JSONObject tomorrowtemperature = (JSONObject) tomorrow.get("temperature");
//	                           String tomorrowtemperaturetmax = toString().valueOf(tomorrowtemperature.get("tmax"));
//	                           String tomorrowtemperaturetmin = toString().valueOf(tomorrowtemperature.get("tmin"));                        
//	                     
//	                           model.addAttribute("tomorrowskyname", tomorrowskyname);
//	                           model.addAttribute("tomorrowtemperaturetmax", tomorrowtemperaturetmax);
//	                           model.addAttribute("tomorrowtemperaturetmin", tomorrowtemperaturetmin);
	                           
	                        }
	                                                
	                        weatherbw.write(weatherline);      

	                     }
	                     
	                  }
	                  catch (Exception e) 
	                  {
	                     e.printStackTrace();
	                  }

	               }
	               catch (Exception e) 
	               {
	                  e.printStackTrace();
	               }
	               
	         //   }
	            
	         }
	         catch (Exception e) 
	         {
	            e.printStackTrace();
	         }

	      }
	      catch (Exception e) 
	      {
	         e.printStackTrace();
	      }
	      

	      return "weathercodi2";
	      
	   }
	   
	   
	   

		
}
