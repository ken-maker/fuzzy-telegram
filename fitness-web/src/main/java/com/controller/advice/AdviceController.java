package com.controller.advice;

import org.springframework.format.datetime.DateFormatter;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.InitBinder;

@ControllerAdvice
public class AdviceController {
    @InitBinder
    public void xxxx(WebDataBinder dataBinder) {
        dataBinder.addCustomFormatter(new DateFormatter());//这就是类型转换器);
        DateFormatter df=new DateFormatter();
        df.setPattern("yyyy-MM-dd");
        dataBinder.addCustomFormatter(df);
    }
}
