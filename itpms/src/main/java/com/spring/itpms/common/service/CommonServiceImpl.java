package com.spring.itpms.common.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.itpms.common.dao.CommonDao;
import com.spring.itpms.common.dto.ContactDto;
import com.spring.itpms.common.dto.NoticeDto;

@Service
public class CommonServiceImpl implements CommonService {
	
	@Autowired
	private CommonDao commonDao;

	@Override
	public void addNewContact(ContactDto contactDto) throws Exception {

		commonDao.insertContact(contactDto);
	}

	@Override
	public List<ContactDto> getContactList() throws Exception {
		return commonDao.selectListContact();
	}

	@Override
	public void removeContact(int[] deleteContactCdList) throws Exception {

		commonDao.deleteContact(deleteContactCdList);
	}

	@Override
	public void addNewNotice(NoticeDto noticeDto) throws Exception {
		commonDao.insertNotice(noticeDto);
		
	}

	@Override
	public List<NoticeDto> getNoticeList() throws Exception {
		return commonDao.selectListNotice();
	}

	@Override
	public void removeNotice(int[] deleteNoticeCdList) throws Exception {
		commonDao.deleteNotice(deleteNoticeCdList);
	}

	@Override
	public ContactDto getContactDetail(int contactCd) throws Exception {
		return commonDao.selectOneContact(contactCd);
	}

	@Override
	public NoticeDto getNoticeDetail(int noticeCd) throws Exception {
		return commonDao.selectOneNotice(noticeCd);
	}

	@Override
	public int getNewProductCnt() throws Exception {
		return commonDao.selectOneNewProductCnt();

	}

	@Override
	public int getGeneralProductCnt() throws Exception {
		return commonDao.selectOneGeneralProductCnt();
	}

	@Override
	public int getBestProductCnt() throws Exception {
		return commonDao.selectOneBestProductCnt();
	}

	@Override
	public List<Map<String, Object>> getNewGoodsMainInfo() throws Exception {
		return commonDao.selectListGoodsNewProducts();
	}

	@Override
	public List<Map<String, Object>> getBestGoodsMainInfo() throws Exception {
		return commonDao.selectListGoodsBestProducts();
	}

	@Override
	public List<Map<String, Object>> getGeneralGoodsMainInfo() throws Exception {
		return commonDao.selectListGoodsGeneralProducts();

	}

}
