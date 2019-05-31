package service.impl;

import com.github.pagehelper.PageHelper;
import dao.IOrdersDao;
import domain.Orders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import service.IOrderService;

import java.util.List;

@Transactional
@Service
public class OrderService implements IOrderService {

    @Autowired
    @Qualifier("orderMapper")
    private IOrdersDao ordersDao;

    public List<Orders> findAll() throws Exception {
        return ordersDao.findAll();
    }

    public List<Orders> findAll1() throws Exception {
        return ordersDao.findAll1();
    }

    public List<Orders> findAll2(int page, int size) throws Exception {
        //注意pageHelper静态使用方法一定要在dao“真正”查询的上一句
        PageHelper.startPage(page,size);
        return ordersDao.findAll1();
    }

    public List<Orders> getAll() throws Exception {
        return ordersDao.getAll();
    }

    public Orders findById(String id) throws Exception {
        return ordersDao.findById(id);
    }


}
