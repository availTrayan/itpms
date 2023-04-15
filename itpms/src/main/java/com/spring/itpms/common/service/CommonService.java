package com.spring.itpms.common.service;

import java.util.List;
import java.util.Map;

import com.spring.itpms.common.dto.ContactDto;
import com.spring.itpms.common.dto.NoticeDto;

public interface CommonService {
	
	public void addNewContact(ContactDto contactDto) throws Exception;
	public List<ContactDto> getContactList() throws Exception;
	public void removeContact(int[] deleteContactCdList) throws Exception;
	public void addNewNotice(NoticeDto noticeDto) throws Exception;
	public List<NoticeDto> getNoticeList() throws Exception;
	public void removeNotice(int[] deleteNoticeCdList) throws Exception;
	public ContactDto getContactDetail(int contactCd) throws Exception;
	public NoticeDto getNoticeDetail(int noticeCd) throws Exception;
	public int getNewProductCnt() throws Exception;
	public int getGeneralProductCnt() throws Exception;
	public int getBestProductCnt() throws Exception;
	public List<Map<String,Object>> getNewGoodsMainInfo() throws Exception;
	public List<Map<String,Object>> getBestGoodsMainInfo() throws Exception;
	public List<Map<String,Object>> getGeneralGoodsMainInfo() throws Exception;
	
	

}
