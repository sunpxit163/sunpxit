package xyz.sunpxit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import xyz.sunpxit.service.IOpenServise;

import javax.annotation.security.RolesAllowed;
import java.util.HashMap;

@Controller
@RequestMapping("/open")
@RolesAllowed({"MANAGE"})
public class OpenController {
    @Autowired
    IOpenServise openServise;
    @RequestMapping("/useropen.do")
    @ResponseBody
    public  void uopen(@RequestBody HashMap<String,String[]> username){
        String[] ids = username.get("id");
       for (int i=0;i<ids.length;i++) {

           openServise.uopen(ids[i]);
       }

    }
    @RequestMapping("/productopen.do")
    @ResponseBody
    public  void popen(@RequestBody HashMap<String,String[]> username){
        String[] ids = username.get("id");
        for (int i=0;i<ids.length;i++) {
            System.out.println(ids[i]);
            openServise.popen(ids[i]);
        }

    }
    @RequestMapping("/ordersopen.do")
    @ResponseBody
    public  void oopen(@RequestBody HashMap<String,String[]> username){
        String[] ids = username.get("id");
        for (int i=0;i<ids.length;i++) {

            openServise.oopen(ids[i]);
        }

    }

}
