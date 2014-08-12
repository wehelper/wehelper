package com.wehelper.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.servlet.ModelAndView;

import com.wehelper.bean.TreeNode;
import com.wehelper.bean.WhMenu;
import com.wehelper.bean.WhMenuBtn;
import com.wehelper.bean.WhUser;
import com.wehelper.service.WhMenuBtnService;
import com.wehelper.service.WhMenuService;
import com.wehelper.service.WhUserService;
import com.wehelper.utils.Constant.SuperAdmin;
import com.wehelper.utils.HtmlUtil;
import com.wehelper.utils.MyEditor;
import com.wehelper.utils.SessionUtils;
import com.wehelper.utils.TreeUtil;
import com.wehelper.utils.URLUtils;

public class BaseAction{
	
	public final static String SUCCESS ="success";  
	
	public final static String MSG ="msg";  
	
	public final static String DATA ="data";  
	
	public final static String LOGOUT_FLAG = "logoutFlag";  
	
	// Servrice start

   @InitBinder  
   protected void initBinder(WebDataBinder binder) {  
		 binder.registerCustomEditor(Date.class, new CustomDateEditor(
                new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));  
		 binder.registerCustomEditor(int.class,new MyEditor()); 
   }  

	/**
	 * 获取IP地址
	 * 
	 * @param request
	 * @return
	 */
	public String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}
	

	/**
	 * 所有ActionMap 统一从这里获取
	 * 
	 * @return
	 */
	public Map<String, Object> getUrlMap() {
		Map<String, Object> rootMap = new HashMap<String, Object>();
		// 添加url到 Map中
		rootMap.putAll(URLUtils.getUrlMap());
		return rootMap;
	}
	
	/**
	 * 所有ActionMap 统一从这里获取
	 * 
	 * @return
	 */
	public Map<String, Object> getRootMap(HttpServletRequest request) {
		Map<String, Object> rootMap = new HashMap<String, Object>();
		// 添加url到 Map中
		rootMap.putAll(URLUtils.getUrlMap());
		rootMap.put("menuList", SessionUtils.getAttr(request, "menuList"));
		return rootMap;
	}

	public ModelAndView forword(String viewName, Map context) {
		return new ModelAndView(viewName, context);
	}

	public ModelAndView error(String errMsg) {
		return new ModelAndView("error");
	}
	
	/**
	 *
	 * 提示成功信息
	 *
	 * @param message
	 *
	 */
	public void sendSuccessMessage(HttpServletResponse response,  String message) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put(SUCCESS, true);
		result.put(MSG, message);
		HtmlUtil.writerJson(response, result);
	}

	/**
	 *
	 * 提示失败信息
	 *
	 * @param message
	 *
	 */
	public void sendFailureMessage(HttpServletResponse response,String message) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put(SUCCESS, false);
		result.put(MSG, message);
		HtmlUtil.writerJson(response, result);
	}
	
	/**
	 * 构建树形数据
	 * @return
	 */
	private List<TreeNode> treeMenu(List<WhMenu> rootMenus,List<WhMenu> childMenus){
		TreeUtil util = new TreeUtil(rootMenus,childMenus);
		return util.getTreeNode();
	}
	
	
	/**
	 * 构建树形数据
	 * @return
	 */
	private void buildData(List<WhMenu> childMenus,List<WhMenuBtn> childBtns,HttpServletRequest request){
		//能够访问的url列表
		List<String> accessUrls  = new ArrayList<String>();
		//菜单对应的按钮
		Map<String,List> menuBtnMap = new HashMap<String,List>(); 
		for(WhMenu menu: childMenus){
			//判断URL是否为空
			if(StringUtils.isNotBlank(menu.getUrl())){
				List<String> btnTypes = new ArrayList<String>();
				for(WhMenuBtn btn  : childBtns){
					if(menu.getId().equals(btn.getMenuid())){
						btnTypes.add(btn.getBtnType());
						URLUtils.getBtnAccessUrls(menu.getUrl(), btn.getActionUrls(),accessUrls);
					}
				}
				menuBtnMap.put(menu.getUrl(), btnTypes);
				URLUtils.getBtnAccessUrls(menu.getUrl(), menu.getActions(),accessUrls);
				accessUrls.add(menu.getUrl());
			}
		}
		SessionUtils.setAccessUrl(request, accessUrls);//设置可访问的URL
		SessionUtils.setMemuBtnMap(request, menuBtnMap); //设置可用的按钮
	}
}
