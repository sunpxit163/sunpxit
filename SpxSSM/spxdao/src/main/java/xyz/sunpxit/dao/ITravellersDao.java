package xyz.sunpxit.dao;

import org.apache.ibatis.annotations.Select;
import xyz.sunpxit.domain.Traveller;

import java.util.List;

public interface ITravellersDao {
    @Select("select * from traveller where id in (select travellerId from order_traveller where orderId=#{ordersId})")
    List<Traveller> findByOrdersId(String ordersId);
}
