package com.EaSystem.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.EaSystem.beans.Users;

public interface IUsersService {
	public List<Users> getAll();
	
	public Users getUser(@Param("userid")int userid);
	
	public void updateinfo(@Param("cfirstname")String cfirstname, @Param("clastname")String clastname, @Param("csex")String csex, @Param("cbirth")Date cbirth, @Param("cphonenumber")String cphonenumber, @Param("cemail")String cemail, @Param("account_id")int account_id );
	
	public void insertinfo(@Param("cfirstname")String cfirstname, @Param("clastname")String clastname, @Param("csex")String csex, @Param("cbirth")Date cbirth, @Param("cphonenumber")String cphonenumber, @Param("cemail")String cemail, @Param("account_id")int account_id );
}
