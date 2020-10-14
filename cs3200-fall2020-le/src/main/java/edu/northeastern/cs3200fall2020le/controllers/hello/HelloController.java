package edu.northeastern.cs3200fall2020le.controllers.hello;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
  @RequestMapping("/api/hello/string")
  public String sayHello() {
    return "Hello Phillip Le!";
  }
  @RequestMapping("/api/hello/object")
  public HelloObject sayHelloObject() {
    HelloObject obj = new HelloObject("Hello Phillip Le!");
    return obj;
  }

}

