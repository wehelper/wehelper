package com.wehelper.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wehelper.mapper.IndexMapper;
/**
 * 
 * <br>
 * <b>功能：</b>indexService<br>
 * <b>作者：</b>刘树华<br>
 */
@Service("indexService")
public class IndexService<T> extends BaseService<T> {
	private final static Logger log= Logger.getLogger(IndexService.class);
	

	

	@Autowired
    private IndexMapper<T> mapper;

		
	public IndexMapper<T> getMapper() {
		return mapper;
	}

}
