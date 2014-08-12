package com.wehelper.mapper;

import com.wehelper.model.WhUserModel;

/**
 * WhUser Mapper
 * @author Administrator
 *
 */
public interface WhUserMapper<T> extends BaseMapper<T> {

	/**
	 * 检查登录
	 * @param email
	 * @param pwd
	 * @return
	 */
	public T queryLogin(WhUserModel model);
	
	
	/**
	 * 查询邮箱总数，检查是否存在
	 * @param email
	 * @return
	 */
	public int getUserCountByEmail(String email);
	
}
