package com.spring.itpms.common.controller;

import java.io.File;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.itpms.common.dto.ContactDto;
import com.spring.itpms.common.dto.NoticeDto;
import com.spring.itpms.common.service.CommonService;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class CommonController {
	
	@Autowired
	private CommonService commonService;
	
	// private final String CURR_IMAGE_REPO_PATH = "C:\\goodsFile_repo";
	// private final String SEPERATOR = "\\";											// window

	private final String CURR_IMAGE_REPO_PATH = "/var/lib/tomcat9/goodsFile_repo";
	private final String SEPERATOR = "/";											// linux
	
	@RequestMapping(value="/" , method=RequestMethod.GET)
	public ModelAndView home() throws Exception{
		
		ModelAndView mv = new ModelAndView("/main");
		
		Map<String, String> goodsListMap = new HashMap<String, String>();
		goodsListMap.put("sort", "all");
		goodsListMap.put("part", "all");
		
		mv.addObject("newProductCnt" , commonService.getNewProductCnt());
		mv.addObject("generalProductCnt" , commonService.getGeneralProductCnt());
		mv.addObject("bestProductCnt" , commonService.getBestProductCnt());
		mv.addObject("newProductsInfo", commonService.getNewGoodsMainInfo());
		mv.addObject("bestProductsInfo", commonService.getBestGoodsMainInfo());
		mv.addObject("generalProductsInfo", commonService.getGeneralGoodsMainInfo());
		
		return mv;
		
	}
	
	@RequestMapping(value = "thumbnails")
	public void thumbnails(@RequestParam("goodsFileName")String goodsFileName, HttpServletResponse response) throws Exception {
		
		OutputStream out = response.getOutputStream();
		String filePath = CURR_IMAGE_REPO_PATH + SEPERATOR + goodsFileName;
		
		File image = new File(filePath);
		
		if (image.exists()) {
			Thumbnails.of(image).size(800, 800).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
		
	}
	
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public ModelAndView contact() throws Exception {
		return new ModelAndView("/contact");
	}
	
	
	@RequestMapping(value="/contact" , method=RequestMethod.POST)
	public ResponseEntity<Object> contact(ContactDto contactDto , HttpServletRequest request) throws Exception{
		
		commonService.addNewContact(contactDto);
		String jsScript  = "<script>";
				jsScript += " alert('문의가 등록 되었습니다.');";
				jsScript += " location.href='" + request.getContextPath() + "/';";
				jsScript += " </script>";
 
	   HttpHeaders responseHeaders = new HttpHeaders();
	   responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	
	   return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
		
	}
	
	@RequestMapping(value = "/contactList", method = RequestMethod.GET)
	public ModelAndView contactList() throws Exception{
		ModelAndView mv = new ModelAndView("/common/contactList");
		mv.setViewName("/contactList");
		mv.addObject("contactList", commonService.getContactList());
		return mv;
	}
	
	@RequestMapping(value = "/removeContact", method = RequestMethod.GET)
	public ResponseEntity<Object> removeCart(@RequestParam("contactCdList")String contactList) throws Exception {
		
		String[] temp = contactList.split(",");
		int[] deleteContactCdList = new int[temp.length];
		
		for (int i = 0; i < temp.length; i++) {
			deleteContactCdList[i] = Integer.parseInt(temp[i]);
			
		}
			commonService.removeContact(deleteContactCdList);
			
			String jsScript  = "<script>";
					jsScript += "alert('문의가 삭제 되었습니다.');";
					jsScript += "location.href='contactList'";
					jsScript += "</script>";

		   HttpHeaders responseHeaders = new HttpHeaders();
		   responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		   return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public ModelAndView notice() throws Exception {
		return new ModelAndView("/notice");
	}
	
	@RequestMapping(value="/notice" , method=RequestMethod.POST)
	public ResponseEntity<Object> notice(NoticeDto noticeDto , HttpServletRequest request) throws Exception{
		
		commonService.addNewNotice(noticeDto);
		String jsScript  = "<script>";
				jsScript += " alert('공지가 등록 되었습니다.');";
				jsScript += " location.href='" + request.getContextPath() + "/';";
				jsScript += " </script>";
 
	   HttpHeaders responseHeaders = new HttpHeaders();
	   responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	
	   return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
		
	}
	
	@RequestMapping(value = "/noticeList", method = RequestMethod.GET)
	public ModelAndView noticeList() throws Exception {
		ModelAndView mv = new ModelAndView("/common/noticeList");
		mv.setViewName("/noticeList");
		mv.addObject("noticeList", commonService.getNoticeList());
		return mv;
	}

	@RequestMapping(value = "/removeNotice", method = RequestMethod.GET)
	public ResponseEntity<Object> removeNotice(@RequestParam("noticeCdList")String noticeList) throws Exception {
		
		String[] temp = noticeList.split(",");
		int[] deleteNoticeCdList = new int[temp.length];
		
		for (int i = 0; i < temp.length; i++) {
			deleteNoticeCdList[i] = Integer.parseInt(temp[i]);
			
		}
			commonService.removeNotice(deleteNoticeCdList);
			
			String jsScript  = "<script>";
					jsScript += "alert('공지가 삭제 되었습니다.');";
					jsScript += "location.href='noticeList'";
					jsScript += "</script>";

		   HttpHeaders responseHeaders = new HttpHeaders();
		   responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		   return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	
	@RequestMapping(value="/contactDetail" , method=RequestMethod.GET)
	public ModelAndView contactDetail(@RequestParam("contactCd") int contactCd) throws Exception{
		ModelAndView mv = new ModelAndView("/common/contactList");
		mv.setViewName("/contactDetail");
		mv.addObject("contactDto", commonService.getContactDetail(contactCd));
		return mv;
	}
	
	@RequestMapping(value="/noticeDetail" , method=RequestMethod.GET)
	public ModelAndView noticeDetail(@RequestParam("noticeCd") int noticeCd) throws Exception{
		ModelAndView mv = new ModelAndView("/common/noticeList");
		mv.setViewName("/noticeDetail");
		mv.addObject("noticeDto", commonService.getNoticeDetail(noticeCd));
		return mv;
	}
	

	@RequestMapping(value = "/companyMap", method = RequestMethod.GET)
	public ModelAndView companyMap() throws Exception {
		return new ModelAndView("/companyMap");
	}
	
	
}
