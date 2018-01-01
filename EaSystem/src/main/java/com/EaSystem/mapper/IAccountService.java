package com.EaSystem.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.EaSystem.beans.Account;

public interface IAccountService {
	public List<Account> getAll();
	public Account Login(@Param("UserName") String UserName,@Param("UserPass")String UserPass);
}
