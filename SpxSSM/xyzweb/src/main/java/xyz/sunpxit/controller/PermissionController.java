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
import xyz.sunpxit.service.IPermissionServise;

import javax.annotation.security.RolesAllowed;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/permission")
public class PermissionController {
    @Autowired
    private IPermissionServise prIPermissionServise;

    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "first1", required = true ,defaultValue="1")Integer f, @RequestParam(name = "end1", required = true,defaultValue = "5")Integer e){
        ModelAndView mv=new ModelAndView();

        List<Permission> pres=prIPermissionServise.findAll(f,e);
        PageInfo pageInfo=new PageInfo(pres);
        mv.addObject("permissionList",pageInfo);
        mv.setViewName("permission-list");
        return mv;
        }

        @RequestMapping("/save.do")
    public String save(Permission permission){
        prIPermissionServise.save(permission);
            return "redirect:findAll.do";
        }

    @RequestMapping("/bbb.do")
    @ResponseBody
    @RolesAllowed({"MANAGE"})
    public  void dele(@RequestBody HashMap<String,String[]> username){
        String[] ids = username.get("id");

        prIPermissionServise.udelete(ids);

    }
}
