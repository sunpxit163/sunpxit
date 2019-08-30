package xyz.sunpxit.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import xyz.sunpxit.domain.Product;
import xyz.sunpxit.service.IProductService;

import javax.annotation.security.RolesAllowed;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private IProductService productService;

    @RequestMapping("save.do")
    public String save(Product product){
        productService.save(product);
        return "redirect:fandAll.do";
    }

    @RequestMapping("/fandAll.do")
    public ModelAndView fandAll(@RequestParam(name = "first1", required = true ,defaultValue="1")Integer first,@RequestParam(name = "end1", required = true,defaultValue = "5")Integer end) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Product> ps = productService.fandAll(first,end);
        PageInfo pageInfo =new PageInfo(ps);
        mv.addObject("ps",pageInfo);
        mv.setViewName("product-list");
        return mv;
    }

    @RequestMapping("/bbb.do")
    @ResponseBody
    @RolesAllowed({"MANAGE"})
    public  void dele(@RequestBody HashMap<String, String[]> username){
        String[] ids = username.get("id");

        productService.udelete(ids);

    }

}
