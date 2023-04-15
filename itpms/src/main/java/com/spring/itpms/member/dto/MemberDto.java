package com.spring.itpms.member.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class MemberDto {
	
	private String memberId;
	private String memberNm;
	private String passwd;
	private String sex;
	private String dateBirth;
	private String hp;
	private String smsstsYn;
	private String email;
	private String emailstsYn;
	private String postalcode;
	private String roadAddress;
	private String jibunAddress;
	private String restAddress;
	private int point;
	private Date joinDt;
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberNm() {
		return memberNm;
	}
	public void setMemberNm(String memberNm) {
		this.memberNm = memberNm;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getDateBirth() {
		return dateBirth;
	}
	public void setDateBirth(String dateBirth) {
		this.dateBirth = dateBirth;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getSmsstsYn() {
		return smsstsYn;
	}
	public void setSmsstsYn(String smsstsYn) {
		this.smsstsYn = smsstsYn;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmailstsYn() {
		return emailstsYn;
	}
	public void setEmailstsYn(String emailstsYn) {
		this.emailstsYn = emailstsYn;
	}
	public String getPostalcode() {
		return postalcode;
	}
	public void setPostalcode(String postalcode) {
		this.postalcode = postalcode;
	}
	public String getRoadAddress() {
		return roadAddress;
	}
	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}
	public String getJibunAddress() {
		return jibunAddress;
	}
	public void setJibunAddress(String jibunAddress) {
		this.jibunAddress = jibunAddress;
	}
	public String getRestAddress() {
		return restAddress;
	}
	public void setRestAddress(String restAddress) {
		this.restAddress = restAddress;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public Date getJoinDt() {
		return joinDt;
	}
	public void setJoinDt(Date joinDt) {
		this.joinDt = joinDt;
	}
	
	@Override
	public String toString() {
		return "MemberDto [memberId=" + memberId + ", memberNm=" + memberNm + ", passwd=" + passwd + ", sex=" + sex
				+ ", dateBirth=" + dateBirth + ", hp=" + hp + ", smsstsYn=" + smsstsYn + ", email=" + email
				+ ", emailstsYn=" + emailstsYn + ", postalcode=" + postalcode + ", roadAddress=" + roadAddress
				+ ", jibunAddress=" + jibunAddress + ", restAddress=" + restAddress + ", point=" + point + ", joinDt="
				+ joinDt + "]";
	}
	
	
	
}
