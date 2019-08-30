package xyz.sunpxit.service.impl;

import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import xyz.sunpxit.dao.OrdersDao;
import xyz.sunpxit.domain.Orders;
import xyz.sunpxit.service.IOrdersServise;

import java.util.List;

@Service
@Transactional
public class OrdersServiseImpl implements IOrdersServise {
    @Autowired
    OrdersDao dao;


    @Override
    public List<Orders> findAll(int first,int end) {
        PageHelper.startPage(first,end);
        return dao.findAll();
    }

    @Override
    public List<Orders> findById(String ordersid) {
        return dao.findByid(ordersid);
    }
    @Override
    public void udelete(String[] ids) {
        for (int i =0;i<ids.length;i++) {
            String id=ids[i];
            dao.udelete(id);

        }
    }
}
