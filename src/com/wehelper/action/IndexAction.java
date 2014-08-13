package com.wehelper.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.manager.util.SessionUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wehelper.bean.BaseBean.DELETED;
import com.wehelper.bean.Index;
import com.wehelper.model.IndexModel;
import com.wehelper.service.IndexService;
import com.wehelper.utils.DateUtil;
import com.wehelper.utils.HtmlUtil;
 
@Controller
@RequestMapping("/dashboard") 
public class IndexAction extends BaseAction{
	
	private final static Logger log= Logger.getLogger(IndexAction.class);
	
	// Servrice start
	@Autowired(required=false) //自动注入，不需要生成set方法了，required=false表示没有实现类，也不会报错。
	private IndexService<Index> indexService; 
	
	/**
	 * 
	 * @param url
	 * @param classifyId
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/index") 
	public ModelAndView  list(IndexModel model,HttpServletRequest request) throws Exception{
		Map<String,Object>  context = getRootMap(request);
		return forword("index/index",context); 
	}
	
}
