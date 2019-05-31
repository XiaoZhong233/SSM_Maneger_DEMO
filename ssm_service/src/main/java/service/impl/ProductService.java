package service.impl;

import com.github.pagehelper.PageHelper;
import dao.IProductDao;
import domain.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import service.IProductService;

import java.util.Date;
import java.util.List;

@Transactional
@Service
public class ProductService implements IProductService {

    @Autowired
    @Qualifier("productMapper")
    private IProductDao productDao;


    public List<Product> findAll() throws Exception {
        return productDao.findAll();
    }

    /**
     * 分页查询
     * @return
     * @throws Exception
     */
    public List<Product> findAllInPage(int page, int size) throws Exception {
        //注意pageHelper静态使用方法一定要在dao“真正”查询的上一句
        PageHelper.startPage(page,size);
        return productDao.findAll();
    }


    public void insert(Product product) throws Exception{
        productDao.insert(product);
    }

    public Product findById(String id) {
        return productDao.findById(id);
    }

}
