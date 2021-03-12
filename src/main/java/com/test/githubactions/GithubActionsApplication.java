package com.test.githubactions;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
public class GithubActionsApplication {

    public static void main(String[] args) {
        SpringApplication.run(GithubActionsApplication.class, args);
    }

    @RestController
    @RequestMapping("/test")
    static class TestController {
        @GetMapping
        public String test() {
            return "Hello git hub";
        }
    }

}
