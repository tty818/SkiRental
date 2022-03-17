package com.alfred.ski.domain;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class ski {
    private String skinumber;

    private String skitype;

    private String color;

    private Double price;

    private Double rentprice;

    private Double deposit;

    private Integer isrenting;

    private String description;

    private String skiimg;

    @JsonFormat(pattern = "yyyy-MM-dd HH-mm-ss",timezone = "GTM+8")
    private Date createtime;

    public String getskinumber() {
        return skinumber;
    }

    public void setskinumber(String skinumber) {
        this.skinumber = skinumber == null ? null : skinumber.trim();
    }

    public String getskitype() {
        return skitype;
    }

    public void setskitype(String skitype) {
        this.skitype = skitype == null ? null : skitype.trim();
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color == null ? null : color.trim();
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double getRentprice() {
        return rentprice;
    }

    public void setRentprice(Double rentprice) {
        this.rentprice = rentprice;
    }

    public Double getDeposit() {
        return deposit;
    }

    public void setDeposit(Double deposit) {
        this.deposit = deposit;
    }

    public Integer getIsrenting() {
        return isrenting;
    }

    public void setIsrenting(Integer isrenting) {
        this.isrenting = isrenting;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getskiimg() {
        return skiimg;
    }

    public void setskiimg(String skiimg) {
        this.skiimg = skiimg == null ? null : skiimg.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}