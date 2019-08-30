package xyz.sunpxit.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import xyz.sunpxit.domain.SysLog;

import java.util.List;

public interface ISysLogDao {
    @Insert("insert into syslog values(null,#{visitTime},#{username},#{ip},#{url},#{executionTime},#{method})")
    public void save(SysLog sysLog);
    @Select("select * from syslog")
    List<SysLog> findAll();
}
