package service;

import domain.Product;

import java.util.List;

public interface IProductService {


    List<Product> findAll() throws Exception;

    void insert(Product product) throws Exception;

    Product findById(String id);

    List<Product> findAllInPage(int page, int size) throws Exception;
}
