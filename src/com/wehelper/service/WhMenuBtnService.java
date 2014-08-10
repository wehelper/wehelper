package com.wehelper.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wehelper.mapper.WhMenuBtnMapper;
/**
 * 
 * <br>
 */
@Service("whMenuBtnService")
public class WhMenuBtnService<T> extends BaseService<T> {
	private final static Logger log= Logger.getLogger(WhMenuBtnService.class);
	
	public List<T> queryByAll(){
		return getMapper().queryByAll();
	}
	
	
	
	public List<T> queryByMenuid(Integer menuid){
		return getMapper().queryByMenuid(menuid);
	}
	
	public List<T> queryByMenuUrl(String url){
		return getMapper().queryByMenuUrl(url);
	}
	
	public void deleteByMenuid(Integer menuid){
		getMapper().deleteByMenuid(menuid);
	}
	
	public List<T> getMenuBtnByUser(Integer userid){
		return getMapper().getMenuBtnByUser(userid);
	}

	@Autowired
    private WhMenuBtnMapper<T> mapper;

		
	public WhMenuBtnMapper<T> getMapper() {
		return mapper;
	}

}
