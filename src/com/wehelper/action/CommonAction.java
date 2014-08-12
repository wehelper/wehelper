package com.wehelper.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wehelper.annotation.Auth;

@Controller
@RequestMapping("/common") 
public class CommonAction extends BaseAction {

	private final static Logger log = Logger.getLogger(CommonAction.class);

	/**
	 * 首页
	 * 
	 * @param url
	 * @param classifyId
	 * @return
	 */
	@Auth(verifyLogin = false, verifyURL = false)
	@RequestMapping("/404")
	public ModelAndView notFound(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> context = getRootMap(request);
		return forword("common/404", context);
	}
	

	@Auth(verifyLogin = false, verifyURL = false)
	@RequestMapping("/500")
	public ModelAndView die(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> context = getRootMap(request);
		return forword("common/500", context);
	}

}
