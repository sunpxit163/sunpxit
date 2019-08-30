package xyz.sunpxit.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import xyz.sunpxit.dao.OpenDao;
import xyz.sunpxit.service.IOpenServise;
@Service
@Transactional
public class OpenServiseImpl implements IOpenServise {
    @Autowired
    OpenDao openDao;
    @Override
    public void uopen( String ids) {

            openDao.uopen(ids);



    }

    @Override
    public void popen( String ids) {

        openDao.popen(ids);



    }

    @Override
    public void oopen(String id) {
        openDao.oopen(id);
    }
}
