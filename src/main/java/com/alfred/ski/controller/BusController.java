package com.alfred.ski.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * 业务管理的路由跳转页面
 */
@Controller
@RequestMapping("ski")
public class BusController {
    /**
     * 跳转到客户管理
     * @return
     */
    @RequestMapping("toCustomerManager")
    public String toCustomerManager(){
        return "business/customer/customerManager";
    }
    /**
     * 跳转到雪具管理
     * @return
     */
    @RequestMapping("toskiManager")
    public String toskiManager(){
        return "business/Ski/skiManager";
    }

    /**
     * 跳转到雪具出租
     * @return
     */
    @RequestMapping("toRentskiManager")
    public String toRentskiManager(){
        return "business/rent/rentskiManager";
    }

    /**
     * 跳转到出租单管理的页面
     * @return
     */
    @RequestMapping("toRentManager")
    public String toRentManager(){
        return "business/rent/rentManager";
    }

    /**
     * 跳转到雪具入库管理的页面
     * @return
     */
    @RequestMapping("toCheckskiManager")
    public String toCheckskiManager(){
        return "business/check/checkskiManager";
    }

    /**
     * 跳转到检查单管理的页面
     * @return
     */
    @RequestMapping("toCheckManager")
    public String toCheckManager(){
        return "business/check/checkManager";
    }



}
