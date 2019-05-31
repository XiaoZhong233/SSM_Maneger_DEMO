package util;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import javax.sql.DataSource;
import java.sql.Connection;

/**
 * 连接工具类，用于绑定线程
 */
public class ConnectionUtils {
    private ThreadLocal<Connection> tl = new ThreadLocal<Connection>();

    @Autowired
    @Qualifier("dataSource")
    private DataSource dataSource;

    public Connection getThreadConnection(){
        //1、先从threadLocal上获取连接
        Connection conn = tl.get();
        //2、判断当前线程是否有连接
        try{
            if(conn==null){
                //将连接与当前线程进行绑定
                conn = dataSource.getConnection();
                tl.set(conn);
            }
            return conn;
        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }

    /**
     * 线程与连接进行解绑
     * 在线程回到连接池时调用
     */
    public void removeConnection(){
        tl.remove();
    }

}
