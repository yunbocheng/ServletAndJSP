package com.yunbocheng.controller;

public class Stuent {
    private int id;
    private String name;
    private int password;

    public Stuent(int id, String name, int password) {
        this.id = id;
        this.name = name;
        this.password = password;
    }

    public Stuent() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPassword() {
        return password;
    }

    public void setPassword(int password) {
        this.password = password;
    }
}
