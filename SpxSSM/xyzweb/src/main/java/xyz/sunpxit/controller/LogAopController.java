package xyz.sunpxit.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import xyz.sunpxit.dao.ISysLogDao;
import xyz.sunpxit.domain.SysLog;
import xyz.sunpxit.service.ISysLogService;

import javax.annotation.security.RolesAllowed;
import java.util.List;

@Controller
@RequestMapping("/sysLog")
@RolesAllowed({"MANAGE"})
public class LogAopController {
    @Autowired
    ISysLogService sysLogService;
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "first1", required = true ,defaultValue="1")Integer first, @RequestParam(name = "end1", required = true,defaultValue = "10")Integer end) throws Exception {
        ModelAndView mv=new ModelAndView();
        List<SysLog> all = sysLogService.findAll(first,end);
        PageInfo pageInfo =new PageInfo(all);
        mv.addObject("sysLogs",pageInfo);
        mv.setViewName("syslog-list");


        return mv;

    }
}
