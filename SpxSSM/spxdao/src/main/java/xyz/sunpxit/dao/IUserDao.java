package xyz.sunpxit.dao;

import org.apache.ibatis.annotations.*;
import xyz.sunpxit.domain.Role;
import xyz.sunpxit.domain.Users;

import java.util.List;

public interface IUserDao {

    @Select("select * from users where username=#{username}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "username", column = "username"),
            @Result(property = "email", column = "email"),
            @Result(property = "password", column = "password"),
            @Result(property = "phoneNum", column = "phoneNum"),
            @Result(property = "status", column = "status"),
            @Result(property = "roles",column = "id",javaType = java.util.List.class,many = @Many(select = "xyz.sunpxit.dao.IRoleDao.findRoleByUserId"))
    })
    Users findByLogin(String username);

    @Select("select * from users")
    List<Users> findAll();



    @Insert("insert into users(id,email,username,password,phoneNum,status) values(null,#{email},#{username},#{password},#{phoneNum},#{status})")
    void save(Users userer) throws Exception;

    @Select("select * from users where id=#{id}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "username", column = "username"),
            @Result(property = "email", column = "email"),
            @Result(property = "password", column = "password"),
            @Result(property = "phoneNum", column = "phoneNum"),
            @Result(property = "status", column = "status"),
            @Result(property = "roles",column = "id",javaType = java.util.List.class,many = @Many(select = "xyz.sunpxit.dao.IRoleDao.findRoleByUserId"))
    })
    Users findById(String id) throws Exception;
    @Select("select * from role where id not in(select roleid from users_role where userid=#{uid} )")
    List<Role> uidAddRoleid(String uid);

    @Insert("insert into users_role(userId,roleId) values(#{userId},#{roleId})")
    void addRoleToUser(@Param("userId") String userId, @Param("roleId") String roleId);
    @Delete("delete from users where id=#{id}")
    void udelete(String id);
}
