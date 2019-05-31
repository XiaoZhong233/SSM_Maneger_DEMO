package controller;

import com.github.pagehelper.PageInfo;
import domain.Orders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import service.IOrderService;

import java.util.List;

@Controller
@RequestMapping("orders")
public class OrderController {

    @Autowired
    private IOrderService orderService;

    /**
     * 全部订单分页查询
     * 懒加载模式
     * @return
     * @throws Exception
     */
    @RequestMapping("findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1")Integer page,
                                @RequestParam(name = "size",required = true,defaultValue = "4")Integer size) throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Orders> orders = orderService.findAll2(page,size);
        //获取分页bean
        PageInfo pageInfo = new PageInfo(orders);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("orders-page-list");
        return mv;
    }

    /**
     * 订单详情查询
     *
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping("findById.do")
    public ModelAndView findById(@RequestParam(name="id",required = true) String id) throws Exception{
        ModelAndView mv = new ModelAndView();
        System.out.println("查询id: "+id);
        Orders order = orderService.findById(id);
        System.out.println(order);
        mv.addObject("orders",order);
        mv.setViewName("orders-show");
        return mv;
    }

}
