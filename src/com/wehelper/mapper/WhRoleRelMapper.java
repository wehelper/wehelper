package com.wehelper.mapper;

import java.util.List;

import com.wehelper.bean.WhRoleRel;
/**
 * WhRoleRel Mapper
 * @author Administrator
 *
 */
public interface WhRoleRelMapper<T> extends BaseMapper<T> {
	
	public void deleteByRoleId(java.util.Map<String, Object> param);
	
	public void deleteByObjId(java.util.Map<String, Object> param);
	
	
	public List<WhRoleRel> queryByRoleId(java.util.Map<String, Object> param);
	
	
	public List<WhRoleRel> queryByObjId(java.util.Map<String, Object> param);
	
	
}
