package xyz.sunpxit.controller;

import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Insert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import xyz.sunpxit.domain.Orders;
import xyz.sunpxit.service.IOrdersServise;

import javax.annotation.security.RolesAllowed;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/orders")
public class OrdersController {
    @Autowired
    private IOrdersServise servise;
    @RequestMapping("/findAll.do")
    public ModelAndView test(@RequestParam(name = "first", required = true, defaultValue = "1") Integer first, @RequestParam(name = "end", required = true, defaultValue = "5") Integer end){
        ModelAndView modelAndView=new ModelAndView();
        List<Orders> all = servise.findAll(first,end);
        PageInfo pageInfo=new PageInfo(all);
        modelAndView.addObject("ordersList",pageInfo);
        modelAndView.setViewName("orders-list");
        return modelAndView;

    }
    @RequestMapping("/findById.do")
    public ModelAndView minute(@RequestParam(name = "id",required = true) String ordersId){
        ModelAndView mv=new ModelAndView();
        final List<Orders> byId = servise.findById(ordersId);
        mv.addObject("orders",byId);
        System.out.println(byId);
        mv.setViewName("orders-show");

        return mv;
    }


    @RequestMapping("/del.do")
    @ResponseBody
    @RolesAllowed({"MANAGE"})
    public  void dele(@RequestBody HashMap<String,String[]> username){
        String[] ids = username.get("id");
//        System.out.println(ids);
        servise.udelete(ids);

    }
}
