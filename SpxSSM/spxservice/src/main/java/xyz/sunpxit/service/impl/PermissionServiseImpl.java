package xyz.sunpxit.service.impl;

import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import xyz.sunpx.utlis.Mypasword;
import xyz.sunpxit.dao.IPermissionDao;
import xyz.sunpxit.domain.Permission;
import xyz.sunpxit.service.IPermissionServise;

import java.util.List;

@Service
@Transactional
public class PermissionServiseImpl implements IPermissionServise {
   @Autowired
   private IPermissionDao iPermissionDao;
    @Override
    public List<Permission> findAll(int f ,int e) {
        PageHelper.startPage(f,e);

        return iPermissionDao.findAll();
    }

    @Override
    public void save(Permission permission) {
        permission.setId(Mypasword.myUUID(32));
        iPermissionDao.save(permission);
    }
    public void udelete(String[] ids) {
        for (int i =0;i<ids.length;i++) {
            iPermissionDao.udelete(ids[i]);

        }
    }
}
