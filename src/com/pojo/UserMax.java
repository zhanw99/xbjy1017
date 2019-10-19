package com.pojo;

import java.io.Serializable;

public class UserMax implements Serializable {
    private static  final long serialVersionUID = 755965300969019985L;
    /**
     * 账号
     */
    private String account;
    /**
     * 真实姓名
     */
    private  String  name;
    /**
     * 年龄
     */
    private  Integer  age;
    /**
     * 性别
     */
    private  Integer  sex;
    /**
     * 生日日期
     */
    private String birthDate;
    /**
     * 创建时间
     */
    private String createTime;
    /**
     * 销毁时间
     */
    private String createBy;
    /**
     * 部门
     */
    private String deptName;

    @Override
    public String toString() {
        return "UserMax{" +
                "account='" + account + '\'' +
                ", name='" + name + '\'' +
                ", age=" + age +
                ", sex=" + sex +
                ", birthDate='" + birthDate + '\'' +
                ", createTime='" + createTime + '\'' +
                ", createBy='" + createBy + '\'' +
                ", deptName='" + deptName + '\'' +
                '}';
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public UserMax(String account, String name, Integer age, Integer sex, String birthDate, String createTime, String createBy, String deptName) {
        this.account = account;
        this.name = name;
        this.age = age;
        this.sex = sex;
        this.birthDate = birthDate;
        this.createTime = createTime;
        this.createBy = createBy;
        this.deptName = deptName;
    }

    public UserMax() {
    }
}
