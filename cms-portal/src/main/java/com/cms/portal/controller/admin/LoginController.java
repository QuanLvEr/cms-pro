package com.cms.portal.controller.admin;

import com.google.code.kaptcha.Producer;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;

@Controller
@Slf4j
public class LoginController {


    @Autowired
    private Producer kaptchaProducer;

    @GetMapping("login.do")
    public String toLogin(){
        return "/admin/login";
    }

    @GetMapping("producer.do")
    public void doProducer(HttpServletResponse httpServletResponse){
        //代码难看
        /*String text = kaptchaProducer.createText();
        BufferedImage image = kaptchaProducer.createImage(text);
        ServletOutputStream outputStream = null;
        try{
            outputStream = httpServletResponse.getOutputStream();
            ImageIO.write(image,"jpg",outputStream);
        }catch (IOException e){
            e.printStackTrace();
        }finally {
            try {
                outputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }*/

        //采用语法糖(jdk1.7以上)编写
        // try(Object o;Object o2){do some;}catch(Exception e){}自动关闭资源
        String text = kaptchaProducer.createText();
        BufferedImage image = kaptchaProducer.createImage(text);
        try(ServletOutputStream outputStream =httpServletResponse.getOutputStream()){
            ImageIO.write(image,"jpg",outputStream);
        }catch (IOException e){
          log.error("验证码生成失败！");
        }

    }







}
