package com.library.aspect;

public class LoggingAspect {

    public void beforeManageBooks() {
        System.out.println("Before managing books...");
    }

    public void afterManageBooks() {
        System.out.println("After managing books...");
    }
}
