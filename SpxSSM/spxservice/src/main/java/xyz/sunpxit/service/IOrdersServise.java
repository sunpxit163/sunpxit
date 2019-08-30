package xyz.sunpxit.service;

import org.apache.ibatis.annotations.Insert;
import xyz.sunpxit.domain.Orders;

import java.util.List;

public interface IOrdersServise {
    public List<Orders> findAll(int first, int end);

    public List<Orders> findById(String ordersid);

    public void udelete(String[] ids);
}
