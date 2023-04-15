package com.spring.itpms.common.dao;

import java.util.List;
import java.util.Map;

import com.spring.itpms.common.dto.ContactDto;
import com.spring.itpms.common.dto.NoticeDto;

public interface CommonDao {
	
	public void insertContact(ContactDto contactDto) throws Exception;
	public List<ContactDto> selectListContact() throws Exception;
	public void deleteContact(int[] deleteContactCdList) throws Exception;
	public void insertNotice(NoticeDto noticeDto) throws Exception;
	public List<NoticeDto> selectListNotice() throws Exception;
	public void deleteNotice(int[] deleteNoticeCdList) throws Exception;
	public ContactDto selectOneContact(int contactCd) throws Exception;
	public NoticeDto selectOneNotice(int noticeCd) throws Exception;
	public int selectOneNewProductCnt() throws Exception;
	public int selectOneGeneralProductCnt() throws Exception;
	public int selectOneBestProductCnt() throws Exception;
	public List<Map<String,Object>> selectListGoodsNewProducts() throws Exception;
	public List<Map<String,Object>> selectListGoodsBestProducts() throws Exception;
	public List<Map<String,Object>> selectListGoodsGeneralProducts() throws Exception;

}
