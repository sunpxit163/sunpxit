package xyz.sunpxit.service;

import xyz.sunpxit.domain.Product;

import java.util.List;

public interface IProductService {
    public List<Product> fandAll(int ks,int js) throws Exception;

    void save(Product product);

    void udelete(String[] ids);
}
