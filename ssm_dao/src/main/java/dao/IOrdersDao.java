package dao;
import domain.Orders;
import java.util.List;

public interface IOrdersDao {

    /**
     * 嵌套查询全部信息
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
     * 只查询订单
     * 不包括旅客信息，会员信息，产品信息
     * @return
     * @throws Exception
     */
    List<Orders> getAll() throws Exception;

    /**
     * 根据ID查询订单
     * 包括旅客信息，会员信息，产品信息
     * @param id
     * @return
     * @throws Exception
     */
    Orders findById(String id) throws Exception;
}
