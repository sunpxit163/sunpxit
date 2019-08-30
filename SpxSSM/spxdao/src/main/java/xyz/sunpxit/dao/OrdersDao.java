package xyz.sunpxit.dao;

import org.apache.ibatis.annotations.*;
import xyz.sunpxit.domain.Member;
import xyz.sunpxit.domain.Orders;
import xyz.sunpxit.domain.Product;

import java.util.List;

public interface OrdersDao {
    @Select("select * from orders")
    @Results({
            @Result(id=true,property = "id",column = "id"),
            @Result(property = "orderNum",column = "orderNum"),
            @Result(property = "orderTime",column = "orderTime"),
            @Result(property = "orderStatus",column = "orderStatus"),
            @Result(property = "peopleCount",column = "peopleCount"),
            @Result(property = "payType",column = "payType"),
            @Result(property = "orderDesc",column = "orderDesc"),
            @Result(property = "product",column = "productId",javaType = Product.class,one = @One(select = "xyz.sunpxit.dao.IProductDao.findById")),
    })
    List<Orders> findAll();

    @Select("select * from orders where id=#{ordersId}")
    @Results({
            @Result(id=true,property = "id",column = "id"),
            @Result(property = "orderNum",column = "orderNum"),
            @Result(property = "orderTime",column = "orderTime"),
            @Result(property = "orderStatus",column = "orderStatus"),
            @Result(property = "peopleCount",column = "peopleCount"),
            @Result(property = "payType",column = "payType"),
            @Result(property = "orderDesc",column = "orderDesc"),
            @Result(property = "product",column = "productId",javaType = Product.class,one = @One(select = "xyz.sunpxit.dao.IProductDao.findById")),
            @Result(property = "member",column = "memberId" ,javaType = Member.class,one = @One(select = "xyz.sunpxit.dao.IMemberDao.findById")),
            @Result(property = "travellers",column ="id",javaType = java.util.List.class ,many = @Many(select = "xyz.sunpxit.dao.ITravellersDao.findByOrdersId"))
    })
    List<Orders> findByid(String ordersId);

    @Delete("DELETE FROM orders WHERE id=#{id}")
    void udelete(String id);
}
