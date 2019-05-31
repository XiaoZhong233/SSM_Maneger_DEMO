package service.impl;

import com.github.pagehelper.PageHelper;
import dao.ISysLogDao;
import domain.SysLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import service.ISysLogService;

import java.util.List;

@Service
@Transactional
public class SysLogService implements ISysLogService {

    @Autowired
    @Qualifier("SysLogMapper")
    private ISysLogDao sysLogDao;

    public void save(SysLog sysLog) {
        sysLogDao.save(sysLog);
    }

    public List<SysLog> findAll() {
        return sysLogDao.findAll();
    }

    public List<SysLog> findAllInPages(int page, int size) {
        //注意pageHelper静态使用方法一定要在dao“真正”查询的上一句
        PageHelper.startPage(page,size);
        return sysLogDao.findAll();
    }
}
