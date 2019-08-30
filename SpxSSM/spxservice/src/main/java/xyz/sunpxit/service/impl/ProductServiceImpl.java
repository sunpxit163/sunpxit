package xyz.sunpxit.service.impl;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import xyz.sunpx.utlis.Mypasword;
import xyz.sunpxit.dao.IProductDao;
import xyz.sunpxit.domain.Product;
import xyz.sunpxit.service.IProductService;

import java.util.List;
@Service
@Transactional
public class ProductServiceImpl implements IProductService {
    @Autowired
    private IProductDao productDao;

    @Override
    public void save(Product product) {
        product.setId(Mypasword.myUUID(32));
        productDao.save(product);
    }

    @Override
    public void udelete(String[] ids) {
        for (int i =0;i<ids.length;i++) {
            productDao.udelete(ids[i]);

        }
    }

    @Override
    public List<Product> fandAll(int first1,int ent1) throws Exception {
        PageHelper.startPage(first1,ent1);



        return  productDao.fandAll();
    }
}
