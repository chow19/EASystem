package com.EaSystem.mapper;

import org.apache.ibatis.annotations.Param;

import com.EaSystem.beans.Account_role;

public interface IAount_roleService {
	public Account_role getAccount_role(@Param("id")int account_id);
}
