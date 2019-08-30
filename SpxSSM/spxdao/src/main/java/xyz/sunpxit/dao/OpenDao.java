package xyz.sunpxit.dao;


import org.apache.ibatis.annotations.Update;

public interface OpenDao {
    @Update("UPDATE users SET  STATUS =1 WHERE id=#{id}")
    void uopen( String id);
    @Update("UPDATE product SET  productStatus =1 WHERE id=#{id}")
    void popen(String ids);
    @Update("UPDATE orders SET  orderStatus =1 WHERE id=#{id}")
    void oopen(String ids);
}
