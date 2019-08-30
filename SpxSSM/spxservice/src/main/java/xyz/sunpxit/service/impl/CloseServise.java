package xyz.sunpxit.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import xyz.sunpxit.dao.CloseDao;
import xyz.sunpxit.service.ICloseServise;
@Service
@Transactional
public class CloseServise implements ICloseServise {
    @Autowired
    CloseDao closeDao;
    @Override
    public void uclose(String id) {
        closeDao.uclose(id);
    }

    @Override
    public void pclose(String id) {
        closeDao.pclose(id);
    }

    @Override
    public void oclose(String id) {
        closeDao.oclose(id);
    }
}
