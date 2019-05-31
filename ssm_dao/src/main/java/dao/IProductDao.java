package dao;

import domain.Product;

import java.util.List;

public interface IProductDao {

    //查询所有商品信息
    List<Product> findAll() throws Exception;

    void insert(Product product) throws Exception;

    Product findById(String id);
}
