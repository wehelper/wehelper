package com.wehelper.mapper;

import java.util.List;

/**
 * WhRole Mapper
 * @author Administrator
 *
 */
public interface WhRoleMapper<T> extends BaseMapper<T> {
	
	/**
	 *查询全部有效的权限
	 * @return
	 */
	public List<T> queryAllList();
	
	
	/**
	 *根据用户Id查询权限
	 * @return
	 */
	public List<T> queryByUserid(Integer userid);
}
