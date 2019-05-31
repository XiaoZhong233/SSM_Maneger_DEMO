package dao;

import domain.SysLog;

import java.util.List;

public interface ISysLogDao {
    /**
     * 保存日志
     * @param sysLog
     */
    void save(SysLog sysLog);

    /**
     * 查询所有日志
     */
    List<SysLog> findAll();
}
