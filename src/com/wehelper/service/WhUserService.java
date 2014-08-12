package com.wehelper.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wehelper.bean.WhRoleRel;
import com.wehelper.bean.WhRoleRel.RelType;
import com.wehelper.mapper.WhUserMapper;
import com.wehelper.model.WhUserModel;

/**
 * 
 * <br>
 * <b>功能：</b>WhUserService<br>
 */
@Service("whUserService")
public class WhUserService<T> extends BaseService<T> {
	private final static Logger log = Logger.getLogger(WhUserService.class);

	@Autowired
	private WhRoleRelService<WhRoleRel> sysRoleRelService;

	@Override
	public void delete(Object[] ids) throws Exception {
		super.delete(ids);
		for (Object id : ids) {
			sysRoleRelService.deleteByObjId((Integer) id, RelType.USER.key);
		}
	}

	/**
	 * 检查登录
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	public T queryLogin(String username, String password) {
		WhUserModel model = new WhUserModel();
		model.setUsername(username);
		model.setPassword(password);
		return getMapper().queryLogin(model);
	}

	/**
	 * 查询邮箱总数，检查是否存在
	 * 
	 * @param email
	 * @return
	 */
	public int getUserCountByEmail(String email) {
		return getMapper().getUserCountByEmail(email);
	}

	/**
	 * 查询用户权限
	 * 
	 * @param userId
	 * @return
	 */
	public List<WhRoleRel> getUserRole(Integer userId) {
		return sysRoleRelService.queryByObjId(userId, RelType.USER.key);
	}

	/**
	 * 添加用户权限
	 * 
	 * @param userId
	 * @param roleIds
	 * @throws Exception
	 */
	public void addUserRole(Integer userId, Integer[] roleIds) throws Exception {
		if (userId == null || roleIds == null || roleIds.length < 1) {
			return;
		}
		// 清除关联关系
		sysRoleRelService.deleteByObjId(userId, RelType.USER.key);
		for (Integer roleId : roleIds) {
			WhRoleRel rel = new WhRoleRel();
			rel.setRoleId(roleId);
			rel.setObjId(userId);
			rel.setRelType(RelType.USER.key);
			sysRoleRelService.add(rel);
		}
	}

	@Autowired
	private WhUserMapper<T> mapper;

	public WhUserMapper<T> getMapper() {
		return mapper;
	}

}
