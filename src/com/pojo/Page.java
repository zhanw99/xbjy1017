package com.pojo;

import java.util.List;

public class Page<T> {

    public static void main(String[] args) {
        int i =(18/10)+1;
        System.out.println(i);
    }
    /**
     * 当前页,从请求那边传过来。
     */
    private Integer pageNum;
    /**
     * 每页显示个数
     */
    private Integer pageSize;
    /**
     * 总个数。查询数据库得到的数据;
     */
    private Integer totalRecord;

    /**
     * 总页数，通过totalRecord和pageSize计算可以得来
     * 需要计算得来
     */
    private int totalPage;
    /**
     * 开始索引，也就是我们在数据库中要从第几行数据开始拿，有了startIndex和pageSize，
     * 就知道了limit语句的两个数据，就能获得每页需要显示的数据了
     */
    private int startIndex;

    /**
     * 将每页要显示的数据放在list集合中
     */
    private List<T> list;

    /**
     * 开头页
     * 分页显示的页数,比如在页面上显示1，2，3，4，5页，start就为1，end就为5，这个也是算过来的
     */
    private int start;
    /**
     * 结尾页
     */
    private int end;

    //构造方法中将pageNum，pageSize，totalRecord获得
    /**
     * 通过pageNum，pageSize，totalRecord计算得来tatalPage和startIndex
     * @param pageNum 当前页
     * @param pageSize 每页显示个数
     * @param totalRecord 总页数
     */
    public Page(int pageNum,int pageSize,int totalRecord) {
        this.pageNum = pageNum;
        this.pageSize = pageSize;
        this.totalRecord = totalRecord;

        //totalPage 总页数
        if(totalRecord%pageSize==0){
            //说明整除，正好每页显示pageSize条数据，没有多余一页要显示少于pageSize条数据的
            this.totalPage = totalRecord / pageSize;
        }else{
            //不整除，就要在加一页，来显示多余的数据。
            this.totalPage = (totalRecord / pageSize) +1;
        }
        //开始索引,从第几行开始拿
        this.startIndex = (pageNum-1)*pageSize ;
        //显示5页，这里自己可以设置，想显示几页就自己通过下面算法修改
        this.start = 1;
        this.end = 5;
        //显示页数的算法
        if(totalPage <=5){
            //总页数都小于5，那么end就为总页数的值了。
            this.end = this.totalPage;
        }else{
            //总页数大于5，那么就要根据当前是第几页，来判断start和end为多少了，
            this.start = pageNum - 2;
            this.end = pageNum + 2;

            if(start <= 0){
                //比如当前页是第1页，或者第2页，那么就不用这个规则，
                this.start = 1;
                this.end = 5;
            }
            //比如当前页是倒数第2页或者最后一页，也同样不符合上面这个规则
            if(end > this.totalPage){
                this.end = totalPage;
                this.start = end - 4;
            }
        }
    }


    @Override
    public String toString() {
        return "Page{" +
                "当前页=" + pageNum +
                ", 每页个数=" + pageSize +
                ", 总个数=" + totalRecord +
                ", 总页数=" + totalPage +
                ", 第几行数据开始拿=" + startIndex +
                ", list=" + list +
                ", 开头页=" + start +
                ", 结尾页=" + end +
                '}';
    }

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(Integer totalRecord) {
        this.totalRecord = totalRecord;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getStartIndex() {
        return startIndex;
    }

    public void setStartIndex(int startIndex) {
        this.startIndex = startIndex;
    }

    public List getList() {
        return list;
    }

    public void setList(List list) {
        this.list = list;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getEnd() {
        return end;
    }

    public void setEnd(int end) {
        this.end = end;
    }

    public Page(Integer pageNum, Integer pageSize, Integer totalRecord, int totalPage, int startIndex, List list, int start, int end) {
        this.pageNum = pageNum;
        this.pageSize = pageSize;
        this.totalRecord = totalRecord;
        this.totalPage = totalPage;
        this.startIndex = startIndex;
        this.list = list;
        this.start = start;
        this.end = end;
    }

    public Page() {
    }
}
