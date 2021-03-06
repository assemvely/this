package kr.ac.assemvely.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
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
import kr.ac.assemvely.vo.Tempcodeandcolorcode;
import kr.ac.assemvely.vo.UserVo;
//메인에서 가는 모든 경로를 지정
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

	@RequestMapping(value = "/notify", method = RequestMethod.GET)
	public @ResponseBody List<NotifyVo> notify(HttpSession session) throws Exception {
		UserVo vo = (UserVo) session.getAttribute("login");
		List<NotifyVo> notify = itemservice.getnotify(vo.getId());
		List<NotifyVo> updatenotify = new ArrayList<>();
		if (notify.isEmpty()) {
			NotifyVo nvo = new NotifyVo();
			nvo.setComment("활동내역이 존재하지 않습니다");
			updatenotify.add(nvo);
		} else {

			for (int i = 0; i < notify.size(); i++) {
				NotifyVo realnotify = notify.get(i);

				if (realnotify.getNotifycode().equals("like")) {

					realnotify.setComment(realnotify.getSendid() + "님이 회원님의 게시물을 좋아합니다.");

				} else if (realnotify.getNotifycode().equals("comment")) {
					realnotify.setComment(realnotify.getSendid() + "님이 회원님의 게시물에 댓글을 달았습니다.");

				} else if (realnotify.getNotifycode().equals("follow")) {
					realnotify.setComment(realnotify.getSendid() + "님이 회원님을 팔로우합니다.");
				} else if (realnotify.getNotifycode().equals("approve")) {

					realnotify.setComment(realnotify.getSendid() + "님이 가입을 요청합니다.");
				}

				updatenotify.add(realnotify);

				if (i > 15) {
					// 15개로 제한
					for (int j = 0; j < i - 15; j++) {
						updatenotify.remove(j);
					}
				}

			}
		}
		return updatenotify;

	}
	   
	 @RequestMapping(value="/changeonoff",method=RequestMethod.GET)
	 public void changeonoff(int[] notifybno)throws Exception{
	 
		 for(int i=0;i<notifybno.length;i++){
			 int bno=notifybno[i];
			 System.out.println("보까"+String.valueOf(bno));
		 itemservice.changeonoff(bno);
		 }
	 }

		//날씨 페이지.     
		//위치, 날씨(하늘, 최고기온, 최저기온  )받아옴.
		@RequestMapping(value = "/weathercodi", method=RequestMethod.GET)
		public String weathercodi(Model model, Locale locale,
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
					//위치 받아옴.
					//conn = new URL("http://ip-api.com/json").openConnection();
					conn = new URL("https://ipapi.co/json/").openConnection();	
					conn.addRequestProperty("User-Agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)");	
				
					br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
					JSONObject br1 = (JSONObject)parser.parse(br);
				//	bw = new BufferedWriter(response.getWriter());
					
				//	System.out.println(br1.toJSONString());
					//System.out.println("br : "+br.toString());

					 String city = (String)br1.get("city");
					 Double lat = (Double)br1.get("latitude");
					 Double lon = (Double)br1.get("longitude");
					
					 model.addAttribute("city", city);
				//	String line = null;
					
	/*				while ((line = br.readLine())!= null) 
					{	
						JSONObject job = (JSONObject)parser.parse(line);
						System.out.println("line : "+line);
										
					//	System.out.println(toString().valueOf(job));
						
						//위도
						Double lat = (Double)job.get("latitude");
						System.out.println(lat);
						//경도
						Double lon = (Double)job.get("longitude");
						System.out.println(lon);
								
						
						bw.write(line);		*/

						
						try
						{
							
							URLConnection weatherconn = null;
							BufferedWriter weatherbw = null;
							BufferedReader weatherbr = null;	

							
							try
							{
								weatherconn = new URL("http://apis.skplanetx.com/weather/forecast/3days?appKey=fe99bc8f-0794-3166-9a98-698cc31c13c3&version=1&lat="+lat+"&lon="+lon).openConnection();
								weatherbr = new BufferedReader(new InputStreamReader(weatherconn.getInputStream(), "utf-8"));							
								weatherbw = new BufferedWriter(response.getWriter());
								String weatherline = null;
								while((weatherline = weatherbr.readLine()) != null)
								{
									
									JSONObject weatherline_job = (JSONObject) parser.parse(weatherline);		
									JSONObject weather = (JSONObject)weatherline_job.get("weather");		
									
									JSONArray forecast3days = (JSONArray) weather.get("forecast3days");						
									
									//4,7,10,13,16시간 뒤의 기온 정보를 각각 가져와서 뿌려준다.
									for(int i=0; i<forecast3days.size(); i++)
									{
										JSONObject forecast3days_job = (JSONObject) forecast3days.get(i);
										JSONObject fcst3hour = (JSONObject)forecast3days_job.get("fcst3hour");	
										JSONObject temperature = (JSONObject)fcst3hour.get("temperature");	

										
										String temp4hour = (String)temperature.get("temp4hour");									
										String temp7hour = (String)temperature.get("temp7hour");																	
										String temp10hour = (String)temperature.get("temp10hour");													
										String temp13hour = (String)temperature.get("temp13hour");														
										String temp16hour = (String)temperature.get("temp16hour");														
									
										model.addAttribute("temp4hour", temp4hour);
										model.addAttribute("temp7hour", temp7hour);
										model.addAttribute("temp10hour", temp10hour);
										model.addAttribute("temp13hour", temp13hour);
										model.addAttribute("temp16hour", temp16hour);
										
										
										//현재 시간을 가져온다.
										Date date = new Date();
										SimpleDateFormat format = new SimpleDateFormat("hh");
										String now =format.format(date);
										
										Integer now_int = Integer.parseInt(now);
										
										Integer fourhoursafter_int = now_int+4;
										Integer sevenhoursafter_int = now_int+7;
										Integer tenhoursafter_int = now_int+10;
										Integer thirteenhoursafter_int = now_int+13;
										Integer sixteenhoursafter_int = now_int+16;
										
										if(fourhoursafter_int>12)
										{
											fourhoursafter_int=fourhoursafter_int-12;
										}
										if(sevenhoursafter_int>12)
										{
											sevenhoursafter_int=sevenhoursafter_int-12;
										}
										
										if(tenhoursafter_int>12)
										{
											tenhoursafter_int=tenhoursafter_int-12;
										}
										
										if(thirteenhoursafter_int>12)
										{
											thirteenhoursafter_int=thirteenhoursafter_int-12;
										}
										
										if(sixteenhoursafter_int>12)
										{
											sixteenhoursafter_int=sixteenhoursafter_int-12;
										}

										
										model.addAttribute("fourhoursafter_int",  fourhoursafter_int);
										model.addAttribute("sevenhoursafter_int",  sevenhoursafter_int);
										model.addAttribute("tenhoursafter_int",  tenhoursafter_int);
										model.addAttribute("thirteenhoursafter_int",  thirteenhoursafter_int);
										model.addAttribute("sixteenhoursafter_int",  sixteenhoursafter_int);
										

									}
								}
								
							}
							catch (Exception e) 
							{
								
								e.printStackTrace();
							}

							
							try
							{
								//그 지역 날씨 받아옴.
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
										
										//*********************************어제 날씨**************************************************
//										JSONObject yesterday = (JSONObject) sumjob.get("yesterday");									
//										JSONObject yesterdaysky = (JSONObject) yesterday.get("sky");									
//										String yesterdayskyname = toString().valueOf(yesterdaysky.get("name"));																	
//										JSONObject yesterdayprecipitation = (JSONObject) yesterday.get("precipitation");
//										String yesterdayprecipitationrain = toString().valueOf(yesterdayprecipitation.get("rain"));
//										String yesterdayprecipitationsnow = toString().valueOf(yesterdayprecipitation.get("snow"));																		
//										JSONObject yesterdaytemperature = (JSONObject) yesterday.get("temperature");
//										String yesterdaytemperaturetmax = toString().valueOf(yesterdaytemperature.get("tmax"));
//										String yesterdaytemperaturetmin = toString().valueOf(yesterdaytemperature.get("tmin"));							
//							
//										model.addAttribute("yesterdayskyname", yesterdayskyname);
//										model.addAttribute("yesterdayprecipitationrain", yesterdayprecipitationrain);
//										model.addAttribute("yesterdayprecipitationsnow", yesterdayprecipitationsnow);
//										model.addAttribute("yesterdaytemperaturetmax", yesterdaytemperaturetmax);
//										model.addAttribute("yesterdaytemperaturetmin", yesterdaytemperaturetmin);
										
									
										//***************************************오늘 날씨***********************************************
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
										
										//기온에 맞는  top, bottom, outer, shoes, bag들을 다 불러온다.					
										
										//기온에 맞는 top또는 dress를 불러온다.
										List<ItemVo> tempcodetoplist = itemservice.select_top_withtempcode(tempcode);
									
	/*									List<ItemVo> tempcodebottomlist = itemservice.select_bottom_withtempcode(tempcode);
										
										List<ItemVo> tempcodeouterlist = itemservice.select_outer_withtempcode(tempcode);
																		
										List<ItemVo> tempcodeshoeslist = itemservice.select_shoes_withtempcode(tempcode);

										List<ItemVo> tempcodebaglist = itemservice.select_bag_withtempcode(tempcode);*/
										
										List<List<ItemVo>> itemlistlist = new ArrayList<List<ItemVo>>();
										Random random = new Random();
										
										ItemVo selected_one_top = tempcodetoplist.get(random.nextInt(tempcodetoplist.size()));
										
										String colorcode = selected_one_top.getColorcode();
										String categorycode = selected_one_top.getCategorycode();
										
										String todayscomment = itemservice.todayscomment(colorcode);
										model.addAttribute("todayscomment", todayscomment);
										
										Tempcodeandcolorcode tempandcolor = new Tempcodeandcolorcode();
										tempandcolor.setColorcode(colorcode);
										tempandcolor.setTempcode(tempcode);
										
										if(categorycode.equals("DRESS"))
										{
											List<ItemVo> tempandcolorouterlist = itemservice.select_outer_withtempcode_and_colorcode(tempandcolor);
											itemlistlist.add(tempandcolorouterlist);
											
											List<ItemVo> tempandcolorshoeslist = itemservice.select_shoes_withtempcode_and_colorcode(tempandcolor);
											itemlistlist.add(tempandcolorshoeslist);
											
											List<ItemVo> tempandcolorbaglist = itemservice.select_bag_withtempcode_and_colorcode(tempandcolor);
											itemlistlist.add(tempandcolorbaglist);
											
											List<ItemVo> selected_tempcode_itemlist = new ArrayList<ItemVo>();
											
											selected_tempcode_itemlist.add(selected_one_top);
											
											for(int j =0; j<itemlistlist.size(); j++)
											{
												List<ItemVo> oneitemlist = itemlistlist.get(j);	
												
												ItemVo selected_one_item = oneitemlist.get(random.nextInt(oneitemlist.size()));
												selected_tempcode_itemlist.add(selected_one_item);
												model.addAttribute("selected_tempcode_itemlist", selected_tempcode_itemlist);
											}
										//	System.out.println("if selected_tempcode_itemlist : "+selected_tempcode_itemlist);
											
										}
										else
										{
											List<ItemVo> tempandcolorbottomlist = itemservice.select_bottom_withtempcode_and_colorcode(tempandcolor);
											itemlistlist.add(tempandcolorbottomlist);
											
											List<ItemVo> tempandcolorouterlist = itemservice.select_outer_withtempcode_and_colorcode(tempandcolor);
											itemlistlist.add(tempandcolorouterlist);
											
											List<ItemVo> tempandcolorshoeslist = itemservice.select_shoes_withtempcode_and_colorcode(tempandcolor);
											itemlistlist.add(tempandcolorshoeslist);
											
											List<ItemVo> tempandcolorbaglist = itemservice.select_bag_withtempcode_and_colorcode(tempandcolor);
											itemlistlist.add(tempandcolorbaglist);
											
											
											
											List<ItemVo> selected_tempcode_itemlist = new ArrayList<ItemVo>();
										
											selected_tempcode_itemlist.add(selected_one_top);
											
											for(int j =0; j<itemlistlist.size(); j++)
											{
												List<ItemVo> oneitemlist = itemlistlist.get(j);	
											
												ItemVo selected_one_item = oneitemlist.get(random.nextInt(oneitemlist.size()));
												selected_tempcode_itemlist.add(selected_one_item);
												model.addAttribute("selected_tempcode_itemlist", selected_tempcode_itemlist);
											}
																					
										}

										
										//list에 집어넣는다.
	/*									itemlistlist.add(tempcodetoplist);														
										itemlistlist.add(tempcodebottomlist);
										itemlistlist.add(tempcodeouterlist);
										itemlistlist.add(tempcodeshoeslist);
										itemlistlist.add(tempcodebaglist);

																			
										//랜덤으로 고른 5개의 아이템을 담을 리스트.
										List<ItemVo> selected_tempcode_itemlist = new ArrayList<ItemVo>();
																	
										for(int j =0; j<itemlistlist.size(); j++)
										{
											
											List<ItemVo> oneitemlist = itemlistlist.get(j);				
											
											//top, bottom, outer, shoes, bag에서 각각 하나씩 가져온다.
											ItemVo selected_one_item = oneitemlist.get(random.nextInt(oneitemlist.size()));
											//하나씩 가져온 아이템들을 리스트에 담는다.
											selected_tempcode_itemlist.add(selected_one_item);
											
											model.addAttribute("selected_tempcode_itemlist", selected_tempcode_itemlist);

										}*/
										

//										********************************내일날씨***************************************
//										JSONObject tomorrow = (JSONObject) sumjob.get("tomorrow");									
//										JSONObject tomorrowsky = (JSONObject) tomorrow.get("sky");						
//										String tomorrowskyname = toString().valueOf(tomorrowsky.get("name"));									
//										JSONObject tomorrowtemperature = (JSONObject) tomorrow.get("temperature");
//										String tomorrowtemperaturetmax = toString().valueOf(tomorrowtemperature.get("tmax"));
//										String tomorrowtemperaturetmin = toString().valueOf(tomorrowtemperature.get("tmin"));								
//								
//										model.addAttribute("tomorrowskyname", tomorrowskyname);
//										model.addAttribute("tomorrowtemperaturetmax", tomorrowtemperaturetmax);
//										model.addAttribute("tomorrowtemperaturetmin", tomorrowtemperaturetmin);
										
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
						
				//	}
					
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
