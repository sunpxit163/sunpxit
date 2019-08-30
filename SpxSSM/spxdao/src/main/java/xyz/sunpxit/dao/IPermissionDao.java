package xyz.sunpxit.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import xyz.sunpxit.domain.Permission;

import java.util.List;

public interface IPermissionDao {

    @Select("select * from permission where id in (select permissionId from role_permission where roleId=#{id} )")
    public List<Permission> findPermissionByRoleId(String id) throws Exception;

    @Select("select * from Permission")
    List<Permission> findAll();
    @Insert("insert into Permission values(#{id},#{permissionName},#{url})")
    void save(Permission permission);

    @Delete("delete from permission where id=#{id}")
    void udelete(String id);
}
