package com.spring.itpms.myPage.dto;

import org.springframework.stereotype.Component;

@Component
public class FavorDto {
	
	private int favorCd;
	private String memberId;
	private int goodsCd;
	
	public int getFavorCd() {
		return favorCd;
	}
	public void setFavorCd(int favorCd) {
		this.favorCd = favorCd;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getGoodsCd() {
		return goodsCd;
	}
	public void setGoodsCd(int goodsCd) {
		this.goodsCd = goodsCd;
	}
	
	@Override
	public String toString() {
		return "FavorDto [favorCd=" + favorCd + ", memberId=" + memberId + ", goodsCd=" + goodsCd + "]";
	}
	
	

}
