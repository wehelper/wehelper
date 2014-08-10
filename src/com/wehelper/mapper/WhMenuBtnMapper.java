package com.wehelper.mapper;

import java.util.List;

/**
 * WhMenuBtn Mapper
 * @author Administrator
 *
 */
public interface WhMenuBtnMapper<T> extends BaseMapper<T> {
	
	public List<T> queryByMenuid(Integer menuid);
	
	public List<T> queryByMenuUrl(String url); 
	
	public void deleteByMenuid(Integer menuid);
	
	public List<T> getMenuBtnByUser(Integer userid); 
	
	
	
	public List<T> queryByAll();
}
