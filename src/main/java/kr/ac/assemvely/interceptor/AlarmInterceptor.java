package kr.ac.assemvely.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AlarmInterceptor extends HandlerInterceptorAdapter{

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	 
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		 
		//1)a->b �ȷ��� �Ҷ�
		// b���� �˸�ǥ�� 1�� �����Ѵ�. 
		//�������� 1�� �����ΰ�?
		
		int count=0;//�ϴ� ī��Ʈ
	 
		
		return true;
	}

}
