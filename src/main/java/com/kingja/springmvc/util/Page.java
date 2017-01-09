package com.kingja.springmvc.util;

import java.util.List;

/**
 * Description：TODO
 * Create Time：2016/11/21 16:13
 * Author:KingJA
 * Email:kingjavip@gmail.com
 */
public class Page<T> {
    public static final int DEFAULT_PAGE_SIZE = 10;
    public static final int DEFAULT_VISIBLE_PAGE_SIZE = 10;
    private int pageSize = DEFAULT_PAGE_SIZE;
    private int totelPages;
    private int currentPage;
    private int totelItems;
    private List<T> pageDatas;


    private List<T> allDatas;
    private boolean hasNext;
    private boolean hasPrevious;
    private int startRow;
    private int pageStart;
    private int pageEnd;
    private int visiblePages=10;
    private int rightPages;
    private int leftPages;
    private int nextPage;

    public int getNextPage() {
        return getCurrentPage()+1;
    }

    public int getPreviousPage() {
        return getCurrentPage()-1;
    }

    private int previousPage;

    public int getPageStart() {
        return getCurrentPage()>visiblePages?(getCurrentPage()-leftPages):1;
    }


    public int getPageEnd() {
        return (getCurrentPage()>visiblePages?(getCurrentPage()+rightPages):(getTotelPages()>=visiblePages?visiblePages:getTotelPages()));
    }


    public boolean isHasNext() {
        return getCurrentPage() < getTotelPages();
    }

    public boolean isHasPrevious() {
        return getCurrentPage() > 1;
    }

    public int getStartRow() {
        return (getCurrentPage() - 1) * pageSize;
    }

    @Override
    public String toString() {
        return "Page{" +
                "pageSize=" + pageSize +
                ", totelPages=" + totelPages +
                ", currentPage=" + currentPage +
                ", totelItems=" + totelItems +
                ", pageDatas=" + pageDatas +
                '}';
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotelPages() {
        if (getTotelItems() % pageSize != 0) {
            totelPages = getTotelItems() / pageSize + 1;
        } else {
            totelPages = getTotelItems() / pageSize;
        }
        return totelPages;
    }


    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getTotelItems() {
        if (allDatas != null) {
            return allDatas.size();
        }else{
            return  totelItems;
        }
    }


    public List<T> getPageDatas() {
        return pageDatas;
    }

    public void setPageDatas(List<T> pageDatas) {
        this.pageDatas = pageDatas;
    }

    public List<T> getAllDatas() {
        return allDatas;
    }

    public void setAllDatas(List<T> allDatas) {
        this.allDatas = allDatas;
    }

    public void setTotelItems(int totelItems) {
        this.totelItems = totelItems;
    }

    public int getVisiblePages() {
        return visiblePages;
    }

    public void setVisiblePages(int visiblePages) {
        rightPages = (visiblePages-1)/2;
        leftPages = visiblePages- rightPages -1;
        this.visiblePages = visiblePages;
    }
}
