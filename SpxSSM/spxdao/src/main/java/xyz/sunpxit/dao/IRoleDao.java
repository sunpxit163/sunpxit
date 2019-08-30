package xyz.sunpxit.dao;

import org.apache.ibatis.annotations.*;
import org.springframework.security.core.parameters.P;
import xyz.sunpxit.domain.Permission;
import xyz.sunpxit.domain.Role;

import java.util.List;

public interface IRoleDao {

    @Select("select * from role where id in (select roleId from users_role where userId=#{userId})")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "roleName", column = "roleName"),
            @Result(property = "roleDesc", column = "roleDesc"),
            @Result(property = "permissions",column = "id",javaType = java.util.List.class,many = @Many(select = "xyz.sunpxit.dao.IPermissionDao.findPermissionByRoleId"))
    }) public List<Role> findRoleByUserId(String userId) throws Exception;

            @Select("select * from role")
            List<Role> findAll();
    @Select("select * from role where id=#{roleId}")
    Role findById(String roleId);
    @Select("select * from Permission where id not in(select PermissionId from role_Permission where roleid=#{rid} )")
    List<Permission> findUserByIdAndAllRole(String rid);



    @Insert("insert into role_permission(roleId,permissionId) values(#{roleId},#{permissionId})")
    void addPermissionToRole(@Param("roleId") String roleId, @Param("permissionId") String permissionId);
    @Delete("delete from role where id=#{id}")
    void udelete(String id);
    @Insert("insert into role values (#{id},#{roleName},#{roleDesc})")
    void save(Role urole);
}
