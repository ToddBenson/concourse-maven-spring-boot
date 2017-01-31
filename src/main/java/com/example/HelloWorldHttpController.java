package com.example;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloWorldHttpController {

    @RequestMapping("/test")
    public String index() {
        return "Greetings! Hello World";
    }

}
