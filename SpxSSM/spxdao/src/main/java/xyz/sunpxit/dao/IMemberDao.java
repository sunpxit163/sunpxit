package xyz.sunpxit.dao;

import org.apache.ibatis.annotations.Select;
import xyz.sunpxit.domain.Member;

public interface IMemberDao {

    @Select("select * from member where id=#{id}")
    Member findById(String id);
}
