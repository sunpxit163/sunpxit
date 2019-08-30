package xyz.sunpxit.service;

import xyz.sunpxit.domain.SysLog;

import java.util.List;

public interface ISysLogService {

    public void save(SysLog sysLog) throws Exception;

    List<SysLog> findAll(int first1,int ent1)throws Exception;
}
