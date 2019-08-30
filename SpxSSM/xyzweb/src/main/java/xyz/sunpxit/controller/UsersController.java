package xyz.sunpxit.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import xyz.sunpxit.domain.Role;
import xyz.sunpxit.domain.Users;
import xyz.sunpxit.service.IUserService;

import javax.annotation.security.RolesAllowed;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UsersController {
    @Autowired
    private IUserService userService;
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "first1", required = true ,defaultValue="1")Integer first,@RequestParam(name = "end1", required = true,defaultValue = "5")Integer end){
        ModelAndView mv=new ModelAndView();
        List<Users> all = userService.findAll(first,end);
        PageInfo ps=new PageInfo(all);
        mv.addObject("userList",ps);
        mv.setViewName("user-list");
        return mv;
    }

    @RequestMapping("findUserByIdAndAllRole.do")
    public ModelAndView findUserByIdAndAllRole(@RequestParam(name = "id",required = true)String id) throws Exception {
        ModelAndView mv=new ModelAndView();
        //根据user id查询内容
        Users users = userService.findById(id);
        System.out.println(users);
        //根据user id 查询未分配的角色
        List<Role> ruser=userService.uidAddRoleid(id);
        System.out.println(ruser);
        mv.addObject("user",users);
        mv.addObject("rolrList",ruser);
        mv.setViewName("user-role-add");


        return mv;
    }


    //用户添加
    @RequestMapping("/save.do")
    public String save(Users userInfo) throws Exception {
        userService.save(userInfo);
        return "redirect:findAll.do";
    }


    @RequestMapping("/findById.do")
    public ModelAndView findById(String id) throws Exception {
        ModelAndView mv =new ModelAndView();
        Users byId = userService.findById(id);
        mv.addObject("user",byId);
        mv.setViewName("user-show1");


        return mv;
    }


        @RequestMapping("/addRoleToUser.do")
        public String addRoleToUser(@RequestParam(name = "userId",required = true) String uid,@RequestParam(name = "ids",required = true) String[] arr){

            userService.addRoleToUser(uid,arr);
            return "redirect:findAll.do";
        }

    @RequestMapping("/updet.do")
    @ResponseBody
    @RolesAllowed({"MANAGE"})
    public  void dele(@RequestBody HashMap<String,String[]> username){
        String[] ids = username.get("id");
        System.out.println(username);
        userService.udelete(ids);

    }

    //测试500
    @RequestMapping("/st.do")
    public void st(int i){
        System.out.println(i);
    }




}
