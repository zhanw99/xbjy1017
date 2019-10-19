package com.pojo;

public class Menu {
    private Integer id;
    private Integer pId;
    private String name;
    private String url;
    private Integer type;

    @Override
    public String toString() {
        return "Menu{" +
                "id=" + id +
                ", pId=" + pId +
                ", name='" + name + '\'' +
                ", url='" + url + '\'' +
                ", type=" + type +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Menu() {
    }

    public Menu(Integer id, Integer pId, String name, String url, Integer type) {
        this.id = id;
        this.pId = pId;
        this.name = name;
        this.url = url;
        this.type = type;
    }
}
