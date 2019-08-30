package xyz.sunpxit.service.impl;

import com.github.pagehelper.PageHelper;
import org.aspectj.weaver.SimpleAnnotationValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import xyz.sunpx.utlis.Mypasword;
import xyz.sunpxit.dao.IUserDao;

import xyz.sunpxit.domain.Role;
import xyz.sunpxit.domain.Users;
import xyz.sunpxit.service.IUserService;

import java.util.ArrayList;
import java.util.List;

@Service("userService")
@Transactional
public class UserServiceImpl implements IUserService {
    @Autowired
    IUserDao userDao;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public List<Users> findAll(int f,int e) {
        PageHelper.startPage(f,e);
       return userDao.findAll();
    }



    @Override
    public void save(Users users) throws Exception {
        if (users!=null) {


            users.setPassword(bCryptPasswordEncoder.encode(users.getPassword()));
            userDao.save(users);
        }
    }

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
            Users byLogin =null;
                try {
                  byLogin=  userDao.findByLogin(s);
                    System.out.println(byLogin);
                }catch (Exception E){
                    E.printStackTrace();
                }

//        User user=new User(byLogin.getUsername(),"{noop}"+byLogin.getPassword(),getPower());
        User user = new User(byLogin.getUsername(),  byLogin.getPassword(), byLogin.getStatus() == 0 ? false : true, true, true, true, getPower(byLogin.getRoles()));
        return user;
    }


    @Override
    public Users findById(String id) throws Exception {
        Users byId = userDao.findById(id);
        return byId;
    }

    public List<SimpleGrantedAuthority> getPower(List<Role> roles){
        List<SimpleGrantedAuthority> list=new ArrayList<>();
        list.add(new SimpleGrantedAuthority("ROLE_"+roles.get(0).getRoleName()));
        return list;
    }


    @Override
    public List<Role> uidAddRoleid(String uid) {

        return userDao.uidAddRoleid(uid);
    }

    @Override
    public void addRoleToUser(String uid, String[] arr) {
        for (int i=0;i<arr.length;i++){
            userDao.addRoleToUser(uid,arr[i]);
        }
    }

    public void udelete(String[] ids) {
        for (int i =0;i<ids.length;i++) {
            userDao.udelete(ids[i]);

        }
    }
}
