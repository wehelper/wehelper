package com.wehelper.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wehelper.bean.WhMenu;
import com.wehelper.bean.WhRole;
import com.wehelper.bean.WhRoleRel;
import com.wehelper.bean.WhRoleRel.RelType;
import com.wehelper.model.WhRoleModel;
import com.wehelper.service.WhMenuService;
import com.wehelper.service.WhRoleRelService;
import com.wehelper.service.WhRoleService;
import com.wehelper.utils.HtmlUtil;
 
@Controller
@RequestMapping("/whRole") 
public class WhRoleAction extends BaseAction{
	
	private final static Logger log= Logger.getLogger(WhRoleAction.class);
	
	// Servrice start
	@Autowired(required=false) 
	private WhRoleService<WhRole> whRoleService; 
	
	// Servrice start
	@Autowired(required=false) 
	private WhMenuService<WhMenu> whMenuService; 
	@Autowired(required=false) 
	private WhRoleRelService<WhRoleRel> whRoleRelService;
	/**
	 * 
	 * @param url
	 * @param classifyId
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/role")
	public ModelAndView  list(WhRoleModel model,HttpServletRequest request) throws Exception{
		Map<String,Object>  context = getRootMap();
		return forword("wh/whRole",context); 
	}
	
	
	/**
	 * ilook 首页
	 * @param url
	 * @param classifyId
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/dataList") 
	public void  datalist(WhRoleModel model,HttpServletResponse response) throws Exception{
		List<WhRole> dataList = whRoleService.queryByList(model);
		//设置页面数据
		Map<String,Object> jsonMap = new HashMap<String,Object>();
		jsonMap.put("total",model.getPager().getRowCount());
		jsonMap.put("rows", dataList);
		HtmlUtil.writerJson(response, jsonMap);
	}
	
	/**
	 * 添加或修改数据
	 * @param url
	 * @param classifyId
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/save")
	public void save(WhRole bean,Integer[] menuIds,Integer[] btnIds,HttpServletResponse response) throws Exception{
		if(bean.getId() == null){
			whRoleService.add(bean,menuIds,btnIds);
		}else{
			whRoleService.update(bean,menuIds,btnIds);
		}
		sendSuccessMessage(response, "保存成功~");
	}
	
	
	@RequestMapping("/getId")
	public void getId(Integer id,HttpServletResponse response) throws Exception{
		Map<String,Object>  context = new HashMap<String,Object> ();
		WhRole bean  = whRoleService.queryById(id);
		if(bean  == null){
			sendFailureMessage(response, "没有找到对应的记录!");
			return;
		}
		//获取权限关联的菜单
		Integer[] menuIds = null;
		List<WhMenu> menuList =  whMenuService.getMenuByRoleId(id);
		if(menuList != null){
			menuIds = new Integer[menuList.size()];
			int i = 0;
			for(WhMenu item : menuList){
				menuIds[i] = item.getId();
				i++;
			}
		}
		//获取权限下关联的按钮
		Integer[] btnIds = null;
		List<WhRoleRel>  btnList =whRoleRelService.queryByRoleId(id, RelType.BTN.key);
		if(btnList != null){
			btnIds = new Integer[btnList.size()];
			int i = 0;
			for(WhRoleRel item : btnList){
				btnIds[i] = item.getObjId();
				i++;
			}
		}

		//将对象转成Map
		Map<String,Object> data = BeanUtils.describe(bean);
		data.put("menuIds", menuIds);
		data.put("btnIds", btnIds);
		context.put(SUCCESS, true);
		context.put("data", data);
		HtmlUtil.writerJson(response, context);
	}
	
	
	
	@RequestMapping("/delete")
	public void delete(Integer[] id,HttpServletResponse response) throws Exception{
		whRoleService.delete(id);
		sendSuccessMessage(response, "删除成功");
	}
	
	
	
	@RequestMapping("/loadRoleList")
	public void loadRoleList(HttpServletResponse response) throws Exception{
		List<WhRole>  roloList = whRoleService.queryAllList();
		HtmlUtil.writerJson(response, roloList);
	}


	
	
}
