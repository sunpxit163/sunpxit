package xyz.sunpxit.service.impl;

import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import xyz.sunpx.utlis.Mypasword;
import xyz.sunpxit.dao.IRoleDao;
import xyz.sunpxit.domain.Permission;
import xyz.sunpxit.domain.Role;
import xyz.sunpxit.service.IRoleService;

import java.util.List;
@Service
@Transactional
public class RoleServiceImpl implements IRoleService {
    @Autowired
    private IRoleDao roleDao;
    @Override
    public List<Role> findAll(int f,int e) {
        PageHelper.startPage(f,e);
        return roleDao.findAll();
    }

    @Override
    public Role findById(String roleId)throws Exception{

        return roleDao.findById(roleId);
    }

    @Override
    public List<Permission> findUserByIdAndAllRole(String rid) throws Exception {
       return roleDao.findUserByIdAndAllRole(rid);

    }

    @Override
    public void addPermissionToRole(String rid, String[] arr) {
        for (int i=0;i<arr.length;i++){
            roleDao.addPermissionToRole(rid,arr[i]);
        }
    }


    public void udelete(String[] ids) {
       for (int i =0;i<ids.length;i++) {
           roleDao.udelete(ids[i]);

       }
    }

    @Override
    public void save(Role urole) {
       urole.setId( Mypasword.myUUID(32));
        roleDao.save(urole);
    }
}
