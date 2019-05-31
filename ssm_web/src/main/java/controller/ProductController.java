package controller;


import com.github.pagehelper.PageInfo;
import domain.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import service.IProductService;

import javax.annotation.security.RolesAllowed;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("product")
public class ProductController {


    @Autowired
    private IProductService productService;


    @RequestMapping("findAll.do")
    @RolesAllowed("ROLE_SUPER")
    @Secured("ROLE_SUPER")
    @PreAuthorize("hasAuthority('ROLE_SUPER')")
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1")Integer page,
                                @RequestParam(name = "size",required = true,defaultValue = "4")Integer size) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Product> products = productService.findAllInPage(page,size);
        //获取分页bean
        PageInfo pageInfo = new PageInfo(products);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("product-page-list");
        return mv;
    }

    @RequestMapping("insert.do")
    public String insert(Product product) throws Exception{
        System.out.println(product);
        productService.insert(product);
        return "redirect:findAll.do";
    }
}
