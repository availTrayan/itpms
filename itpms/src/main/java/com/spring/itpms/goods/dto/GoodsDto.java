package com.spring.itpms.goods.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class GoodsDto {
	
	private int goodsCd;
	private String goodsNm;
	private String company;
	private int price;
	private int discountRate;
	private int stock;
	private String sort;
	private int point;
	private Date publishedDt;
	private int deliveryPrice;
	private String category;
	private String goodsSpec;
	private String intro;
	private String goodsFileName;
	private Date enrollDt;
	
	public int getGoodsCd() {
		return goodsCd;
	}
	public void setGoodsCd(int goodsCd) {
		this.goodsCd = goodsCd;
	}
	public String getGoodsNm() {
		return goodsNm;
	}
	public void setGoodsNm(String goodsNm) {
		this.goodsNm = goodsNm;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDiscountRate() {
		return discountRate;
	}
	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public Date getPublishedDt() {
		return publishedDt;
	}
	public void setPublishedDt(Date publishedDt) {
		this.publishedDt = publishedDt;
	}
	public int getDeliveryPrice() {
		return deliveryPrice;
	}
	public void setDeliveryPrice(int deliveryPrice) {
		this.deliveryPrice = deliveryPrice;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getGoodsSpec() {
		return goodsSpec;
	}
	public void setGoodsSpec(String goodsSpec) {
		this.goodsSpec = goodsSpec;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getGoodsFileName() {
		return goodsFileName;
	}
	public void setGoodsFileName(String goodsFileName) {
		this.goodsFileName = goodsFileName;
	}
	public Date getEnrollDt() {
		return enrollDt;
	}
	public void setEnrollDt(Date enrollDt) {
		this.enrollDt = enrollDt;
	}
	
	@Override
	public String toString() {
		return "GoodsDto [goodsCd=" + goodsCd + ", goodsNm=" + goodsNm + ", company=" + company + ", price=" + price
				+ ", discountRate=" + discountRate + ", stock=" + stock + ", sort=" + sort + ", point=" + point
				+ ", publishedDt=" + publishedDt + ", deliveryPrice=" + deliveryPrice + ", category=" + category
				+ ", goodsSpec=" + goodsSpec + ", intro=" + intro + ", goodsFileName=" + goodsFileName + ", enrollDt="
				+ enrollDt + "]";
	}
	
	
	
	
}
