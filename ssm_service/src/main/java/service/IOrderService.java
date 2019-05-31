package service;

import domain.Orders;

import java.util.List;

public interface IOrderService {

    /**
     * 嵌套查询全部
     * 包括旅客信息，会员信息，产品信息
     * @return
     * @throws Exception
     */
    List<Orders> findAll() throws Exception;

    /**
     * 嵌套结果查询全部
     * 包括旅客信息，会员信息，产品信息
     * @return
     * @throws Exception
     */
    List<Orders> findAll1() throws Exception;


    /**
     * 嵌套结果分页查询全部
     * 包括旅客信息，会员信息，产品信息
     * @return
     * @throws Exception
     */
    List<Orders> findAll2(int page,int size) throws Exception;

    /**
     * 只查询订单
     * 不包括旅客信息，会员信息，产品信息
     * @return
     * @throws Exception
     */
    List<Orders> getAll() throws Exception;

    /**
     * 查询订单详情
     * @param id
     * @return
     * @throws Exception
     */
    Orders findById(String id) throws Exception;


}
