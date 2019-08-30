package xyz.sunpxit.dao;


import org.apache.ibatis.annotations.Update;

public interface CloseDao {
    @Update("UPDATE users SET  STATUS =0 WHERE id=#{id}")
    void uclose(String id);
    @Update("UPDATE product SET  productStatus =0 WHERE id=#{id}")
    void pclose(String ids);
    @Update("UPDATE orders SET  orderStatus =0 WHERE id=#{id}")
    void oclose(String ids);
}
