package com.wehelper.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wehelper.bean.WhMenu;
import com.wehelper.bean.WhMenuBtn;
import com.wehelper.bean.WhRoleRel;
import com.wehelper.bean.WhRoleRel.RelType;
import com.wehelper.mapper.WhMenuMapper;

/**
 * 
 * <br>
 */
@Service("whMenuService")
public class WhMenuService<T> extends BaseService<T> {
	private final static Logger log= Logger.getLogger(WhMenuService.class);


	@Autowired
	private WhRoleRelService<WhRoleRel> whRoleRelService;
	
	@Autowired
	private WhMenuBtnService<WhMenuBtn> whMenuBtnService;
	
	@Autowired
    private WhMenuMapper<T> mapper;
	
	/**
	 * 保存菜单btn
	 * @param btns
	 * @throws Exception 
	 */
	public void saveBtns(Integer menuid,List<WhMenuBtn> btns) throws Exception{
		if(btns == null || btns.isEmpty()){
			return;
		}
		for (WhMenuBtn btn : btns) {
			if(btn.getId()!= null && "1".equals(btn.getDeleteFlag())){
				whMenuBtnService.delete(btn.getId());
				continue;
			}
			btn.setMenuid(menuid);
			if(btn.getId() == null){
				whMenuBtnService.add(btn);
			}else{
				whMenuBtnService.update(btn);
			}
		}
		
	}
	
	
	

	public void add(WhMenu menu) throws Exception {
		super.add((T)menu);
		saveBtns(menu.getId(),menu.getBtns());
	}




	public void update(WhMenu menu) throws Exception {
		super.update((T)menu);
		saveBtns(menu.getId(),menu.getBtns());
	}




	/**
	 * 查询所有系统菜单列表
	 * @return
	 */
	public List<T> queryByAll(){
		return mapper.queryByAll();
	}
	
	/**
	 * 获取顶级菜单
	 * @return
	 */
	public List<T> getRootMenu(Integer menuId){
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("menuId", menuId);
		return mapper.getRootMenu(map);
	}
	
	/**
	 * 获取子菜单
	 * @return
	 */
	public List<T> getChildMenu(){
		return mapper.getChildMenu();
	}
	
	/**
	 * 根据用户id查询父菜单
	 * @param roleId
	 * @return
	 */
	public List<T> getRootMenuByUser(Integer userId){
		return getMapper().getRootMenuByUser(userId);
	}
	
	
	/**
	 * 根据用户id查询子菜单
	 * @param roleId
	 * @return
	 */
	public List<T> getChildMenuByUser(Integer userId){
		return getMapper().getChildMenuByUser(userId);
	}
	
	
	/**
	 * 根据权限id查询菜单
	 * @param roleId
	 * @return
	 */
	public List<T> getMenuByRoleId(Integer roleId){
		return getMapper().getMenuByRoleId(roleId);
	}
	
	
	
	@Override
	public void delete(Object[] ids) throws Exception {
		super.delete(ids);
		//删除关联关系
		for(Object id : ids){
			whRoleRelService.deleteByObjId((Integer)id, RelType.MENU.key);
			whMenuBtnService.deleteByMenuid((Integer)id);
		}
	}

	
	
	
	public WhMenuMapper<T> getMapper() {
		return mapper;
	}

}
