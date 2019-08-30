package xyz.sunpxit.service.impl;

import com.github.pagehelper.PageHelper;
import jdk.jfr.Timestamp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.sunpxit.dao.ISysLogDao;
import xyz.sunpxit.domain.SysLog;
import xyz.sunpxit.service.ISysLogService;

import java.util.List;

@Service
@Timestamp
public class SysLogServiceImpl implements ISysLogService {
    @Autowired
    ISysLogDao sysLogDao;
    @Override
    public void save(SysLog sysLog) {

        sysLogDao.save(sysLog);
    }

    @Override
    public List<SysLog> findAll(int first1,int ent1) {
        PageHelper.startPage(first1,ent1);

        return sysLogDao.findAll();
    }
}
