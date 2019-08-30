package xyz.sunpxit.controller;


import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import xyz.sunpxit.domain.Permission;
import xyz.sunpxit.domain.Role;
import xyz.sunpxit.service.IRoleService;

import javax.annotation.security.RolesAllowed;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    IRoleService roleService;


    @RequestMapping("/bbb.do")
    @ResponseBody
    @RolesAllowed({"MANAGE"})
    public  void dele(@RequestBody HashMap<String, String[]> username){
        String[] ids = username.get("id");

        roleService.udelete(ids);

    }


    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "first1", required = true ,defaultValue="1")Integer first, @RequestParam(name = "end1", required = true,defaultValue = "5")Integer end){
        ModelAndView mv=new ModelAndView();
        List<Role> all = roleService.findAll(first,end);
        PageInfo pageInfo=new PageInfo(all);
        mv.addObject("roleList",pageInfo);
        mv.setViewName("role-list");
        return mv;

    }


    @RequestMapping("/findUserByIdAndAllRole.do")
    public ModelAndView findUserByIdAndAllRole(@RequestParam(name = "id",required = true) String rid) throws Exception {
     ModelAndView mv=new ModelAndView();
       Role role=  roleService.findById(rid);

       List<Permission> perURL=roleService.findUserByIdAndAllRole(rid);

       mv.addObject("role",role);
       mv.addObject("permissionList",perURL);
       mv.setViewName("role-permission-add");
       return mv;

    }


    @RequestMapping("/addPermissionToRole.do")
    public String addPermissionToRole(@RequestParam(name = "roleId",required = true) String rid ,@RequestParam(name = "idp",required = true) String[] arr) throws Exception {
        roleService.addPermissionToRole(rid,arr);
        return "redirect:findAll.do";


    }

    //用户添加
    @RequestMapping("/save.do")
    public String save(Role urole) throws Exception {
        roleService.save(urole);
        return "redirect:findAll.do";
    }


}
