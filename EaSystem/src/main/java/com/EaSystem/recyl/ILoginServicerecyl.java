package com.EaSystem.recyl;

import org.apache.ibatis.annotations.Param;

import com.EaSystem.beans.Account;

public interface ILoginServicerecyl {
	public Account Login(@Param("UserName") String UserName,@Param("UserPass")String UserPass);
}
