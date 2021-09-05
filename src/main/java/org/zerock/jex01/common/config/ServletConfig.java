package org.zerock.jex01.common.config;


import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Import;
import org.springframework.format.FormatterRegistry;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.zerock.jex01.board.config.BoardServletConfig;
import org.zerock.jex01.common.converter.StringToLocalDateTimeConverter;

@EnableWebMvc //configuration 설정 포함됨.
@Import(BoardServletConfig.class)
@ComponentScan(basePackages = "org.zerock.jex01.common.exception")
public class ServletConfig implements WebMvcConfigurer {
    //이해 필요 코드
    @Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addConverter(new StringToLocalDateTimeConverter());
    }

    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {

        InternalResourceViewResolver bean = new InternalResourceViewResolver(); //InternalResourceViewResolver는 default
        bean.setViewClass(JstlView.class);
        bean.setPrefix("/WEB-INF/views/");
        bean.setSuffix(".jsp");
        registry.viewResolver(bean);
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {

        //resources/**은 spring으로 처리하지 않는다는 의미
        //webapp\resources
        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");

    }


}
