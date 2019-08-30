package xyz.sunpxit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import xyz.sunpxit.service.ICloseServise;


import javax.annotation.security.RolesAllowed;
import java.util.HashMap;

@Controller
@RequestMapping("/close")
@RolesAllowed({"MANAGE"})
public class CloseController {
    @Autowired
    ICloseServise closeServise;
    @RequestMapping("/userclose.do")
    @ResponseBody
    public  void uopen(@RequestBody HashMap<String,String[]> username){
        String[] ids = username.get("id");
       for (int i=0;i<ids.length;i++) {

           closeServise.uclose(ids[i]);
       }

    }
    @RequestMapping("/productclose.do")
    @ResponseBody
    public  void pclose(@RequestBody HashMap<String,String[]> username){
        String[] ids = username.get("id");
        for (int i=0;i<ids.length;i++) {
            closeServise.pclose(ids[i]);
        }

    }
    @RequestMapping("/ordersclose.do")
    @ResponseBody
    public  void oclose(@RequestBody HashMap<String,String[]> username){
        String[] ids = username.get("id");
        for (int i=0;i<ids.length;i++) {

            closeServise.oclose(ids[i]);
        }

    }

}
