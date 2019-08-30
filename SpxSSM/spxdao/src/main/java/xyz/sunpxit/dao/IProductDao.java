package xyz.sunpxit.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import xyz.sunpxit.domain.Product;

import java.util.List;

public interface IProductDao  {

    @Select("select * from product where id=#{id}")
    Product findById(String id) throws Exception;

    @Select("select * from product")
    List<Product> fandAll() throws Exception;


    @Insert("insert into product(id,productNum,productName,cityName,departureTime,productPrice,productDesc,productStatus) values(#{id},#{productNum},#{productName},#{cityName},#{departureTime},#{productPrice},#{productDesc},#{productStatus})")
    void save(Product product);
    @Delete("delete from product where id=#{id}")
    void udelete(String id);
}
