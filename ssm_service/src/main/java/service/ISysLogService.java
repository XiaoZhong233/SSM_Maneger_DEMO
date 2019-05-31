package service;

import domain.SysLog;

import java.util.List;

public interface ISysLogService   {

    void save(SysLog sysLog);

    List<SysLog> findAll();

    List<SysLog> findAllInPages(int page,int size);
}
