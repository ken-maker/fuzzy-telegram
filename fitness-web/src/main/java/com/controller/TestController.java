package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
public class TestController {


    @RequestMapping("/list1")
    @ResponseBody
    public List list1(){
        List<Object> list = new ArrayList<>();
        list.add(1,"aaa");
        list.add(2,"bbb");
        list.add(3,"ccc");
        return list;
    }
}
