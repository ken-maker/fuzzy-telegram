package com.configs;

/**
 * 得到注解配置 Dispatcher Servlet 初始化映射
 */
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class SystemConfig extends AbstractAnnotationConfigDispatcherServletInitializer {
    protected Class<?>[] getRootConfigClasses() {//得到根配置类
        return new Class[]{AppConfig.class};
    }

    protected Class<?>[] getServletConfigClasses() {//获取Servlet配置类
        return new Class[]{MvcConfig.class};
    }

    protected String[] getServletMappings() {//得到Servlet映射
        return new String[]{"/"};
    }
}
