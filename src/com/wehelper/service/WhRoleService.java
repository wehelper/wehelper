package com.wehelper.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wehelper.bean.BaseBean.STATE;
import com.wehelper.bean.WhRole;
import com.wehelper.bean.WhRoleRel;
import com.wehelper.bean.WhRoleRel.RelType;
import com.wehelper.mapper.WhRoleMapper;


/**
 * 
 * <br>
 */
@Service("whRoleService")
public class WhRoleService<T> extends BaseService<T> {
	private final static Logger log= Logger.getLogger(WhRoleService.class);
	
	@Autowired
	private WhRoleRelService<WhRoleRel> whRoleRelService;
	
	/**
	 * 添加角色&菜单关系
	 */
	public void addRoleMenuRel(Integer roleId,Integer[] menuIds) throws Exception{
		if(roleId == null ||  menuIds == null || menuIds.length < 1 ){ 
			return;
		}
		for(Integer menuid :menuIds ){ 
			WhRoleRel rel = new WhRoleRel();
			rel.setRoleId(roleId);
			rel.setObjId(menuid);
			rel.setRelType(RelType.MENU.key);
			whRoleRelService.add(rel);
		}
	}
		
	/**
	 * 添加角色&菜单关系
	 */
	public void addRoleBtnRel(Integer roleId,Integer[] btnIds) throws Exception{
		if(roleId == null ||  btnIds == null || btnIds.length < 1 ){ 
			return;
		}
		for(Integer btnid : btnIds ){ 
			WhRoleRel rel = new WhRoleRel();
			rel.setRoleId(roleId);
			rel.setObjId(btnid);
			rel.setRelType(RelType.BTN.key);
			whRoleRelService.add(rel);
		}
	}
		
	
	/**
	 * 添加
	 * @param role
	 * @param menuIds
	 * @throws Exception
	 */
	public void add(WhRole role,Integer[] menuIds,Integer[] btnIds) throws Exception {
		super.add((T)role);
		addRoleMenuRel(role.getId(),menuIds);
		addRoleBtnRel(role.getId(),btnIds);
	}

	/**
	 * 删除
	 * @param id
	 * @throws Exception
	 */
	public void delete(Integer[] ids) throws Exception {
		super.delete(ids);
		for(Integer id : ids){
			//清除关联关系
			whRoleRelService.deleteByRoleId(id);
		}
	}

	/**
	 * 修改
	 * @param role
	 * @param menuIds
	 * @throws Exception
	 */
	public void update(WhRole role,Integer[] menuIds,Integer[] btnIds) throws Exception {
		super.update((T)role);
		//如果角色被禁用则删除关联的用户关系
		if(STATE.DISABLE.key == role.getState()){
			whRoleRelService.deleteByRoleId(role.getId(),RelType.USER.key);
		}
		//清除关联关系
		whRoleRelService.deleteByRoleId(role.getId(),RelType.MENU.key);
		whRoleRelService.deleteByRoleId(role.getId(),RelType.BTN.key);
			addRoleMenuRel(role.getId(),menuIds);
			addRoleBtnRel(role.getId(),btnIds);
		
	}

	
	/**
	 *查询全部有效的权限
	 * @return
	 */
	public List<T> queryAllList(){
		return getMapper().queryAllList();
	}

	

	/**
	 *查询全部有效的权限
	 * @return
	 */
	public List<T> queryByUserid(Integer userid){
		return getMapper().queryByUserid(userid);
	}

	@Autowired
    private WhRoleMapper<T> mapper;

		
	public WhRoleMapper<T> getMapper() {
		return mapper;
	}

}
