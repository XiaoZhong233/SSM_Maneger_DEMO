import dao.IProductDao;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import service.IProductService;

public class TestSpring {

    private IProductService productService;

    @Test
    public void testService(){
        //加载配置文件
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        //获取对象
        productService = (IProductService)ac.getBean("productService");
        System.out.println(productService);
    }

    @Test
    public void testMybatis() throws Exception {
        //加载配置文件
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        //获取对象
        productService = (IProductService)ac.getBean("productService");
        System.out.println(productService.findAll());
    }

}
