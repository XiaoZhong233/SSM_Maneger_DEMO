package dao;

import domain.Traveller;

import java.util.List;

public interface ITravellerDao {

    /**
     * 根据订单查询旅客信息
     * @param id
     * @return
     */
    List<Traveller> findTravellerByOrderId(String id);

}
