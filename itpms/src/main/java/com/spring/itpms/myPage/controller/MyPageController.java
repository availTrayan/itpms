package com.spring.itpms.myPage.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.itpms.member.dto.MemberDto;
import com.spring.itpms.member.service.MemberService;
import com.spring.itpms.myPage.dto.CartDto;
import com.spring.itpms.myPage.dto.FavorDto;
import com.spring.itpms.myPage.service.MyPageService;

@Controller
@RequestMapping("/myPage")
public class MyPageController {

	@Autowired
	private MyPageService myPageService;
	
	@Autowired
	private MemberService memberService;
	

	@RequestMapping(value = "/myInfo", method = RequestMethod.GET)
	public ModelAndView myInfo(@RequestParam("memberId") String memberId) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/myPage/myInfo");
		mv.addObject("memberDto", myPageService.getMyInfo(memberId));
		
		return mv;
	}
	
	@RequestMapping(value = "/modifyInfo", method = RequestMethod.POST)
	public ResponseEntity<Object> modifyInfo(MemberDto memberDto, HttpServletRequest request) throws Exception {
		myPageService.modifyMyInfo(memberDto);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		String jsScript  = "<script>";
		jsScript += " alert('정보가 수정되었습니다.');";
		jsScript += " location.href='" + request.getContextPath() + "/myPage/myInfo?memberId=" + memberDto.getMemberId() +  "';";
		jsScript += " </script>";
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}

	@RequestMapping(value = "/removeMember", method = RequestMethod.GET)
	public ResponseEntity<Object> removeMember(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.invalidate();
		
		myPageService.removeMember(request.getParameter("memberId"));
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		String jsScript  = "<script>";
		jsScript += " alert('회원 탈퇴되었습니다.');";
		jsScript += " location.href='" + request.getContextPath() + "/';";
		jsScript += " </script>";
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
		
	}
	
	@RequestMapping(value = "/addCart", method = RequestMethod.GET)
	public @ResponseBody String addCart(@RequestParam ("goodsCd") int goodsCd, @RequestParam ("cartGoodsQty") int cartGoodsQty, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		String memberId = (String)session.getAttribute("memberId");
		
		CartDto cartDto = new CartDto();
		cartDto.setMemberId(memberId);
		cartDto.setGoodsCd(goodsCd);
		cartDto.setCartGoodsQty(cartGoodsQty);
		
		String result = "duple";
		if (!myPageService.checkDuplicatedCart(cartDto)) {
			myPageService.addCart(cartDto);
			session.setAttribute("myCartCnt" , memberService.getMyCartCnt((memberId)));
			result = "notDuple";
		} 
		return result;
	}
	
	@RequestMapping(value = "/myCartList", method = RequestMethod.GET)
	public ModelAndView showCartList(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/cart/myCartList");
		
		String memberId = (String)session.getAttribute("memberId");
		mv.addObject("myCartList" , myPageService.getMyCartList(memberId));
		mv.addObject("countCartList" , myPageService.countCartList(memberId)); 
		
		return mv;
	}
	
	@RequestMapping(value = "/removeCart", method = RequestMethod.GET)
	public ResponseEntity<Object> removeCart(@RequestParam("cartCdList")String cartCdList, HttpServletRequest request) throws Exception {
		
		String[] temp = cartCdList.split(",");
		int[] deleteCartCdList = new int[temp.length];

		for (int i = 0; i < temp.length; i++) {
			deleteCartCdList[i] = Integer.parseInt(temp[i]);
		}
		
		myPageService.removeCart(deleteCartCdList);
		
		HttpSession session = request.getSession();
		session.setAttribute("myCartCnt" , memberService.getMyCartCnt((String)session.getAttribute("memberId")));
		
		String jsScript = "<script>";
			   jsScript += "alert('장바구니 품목이 삭제되었습니다.'); ";
			   jsScript += "location.href='myCartList'";
			   jsScript += "</script>";
		
	    HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}

	@RequestMapping(value = "/modifyCartGoodsQty", method=RequestMethod.GET)
	public ResponseEntity<Object> modifyGoodsQty(@RequestParam Map<String, Object> updateMap) throws Exception {
		myPageService.modifyCartGoodsQty(updateMap);
		return new ResponseEntity<Object>(HttpStatus.OK);
	}
	
	@RequestMapping(value="/myOrderList" , method=RequestMethod.GET)
	public ModelAndView myOrderList(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/myPage/myOrderList");
		mv.addObject("myOrderList", myPageService.getMyOrderList((String)session.getAttribute("memberId")));
		
		return mv;
	}
	
	@RequestMapping(value="/myOrderDetail" , method=RequestMethod.GET)
	public ModelAndView myOrderDetail(@RequestParam Map<String, Object> orderDetailMap) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/myPage/myOrderDetail");
		mv.addObject("myOrder", myPageService.getMyOrderDetail(orderDetailMap));
		
		return mv;
		
	}
	
	@RequestMapping(value = "/addFavor", method = RequestMethod.GET)
	public @ResponseBody String addFavor(@RequestParam("goodsCd") int goodsCd, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		String memberId = (String)session.getAttribute("memberId");
		
		FavorDto favorDto = new FavorDto();
		favorDto.setMemberId(memberId);
		favorDto.setGoodsCd(goodsCd);
		
		String result = "duple";
		if (!myPageService.checkDuplicatedFavor(favorDto)) {
			myPageService.addFavor(favorDto);
			session.setAttribute("myFavorCnt" , memberService.getMyFavorCnt((memberId)));
			result = "notDuple";
		} 
		return result;
	}
	
	@RequestMapping(value = "/myFavorList", method = RequestMethod.GET)
	public ModelAndView showFavorList(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/favor/myFavorList");
		
		String memberId = (String)session.getAttribute("memberId");
		mv.addObject("myFavorList" , myPageService.getMyFavorList(memberId));
		mv.addObject("countFavorList" , myPageService.countFavorList(memberId)); 

		return mv;
	}
	
	@RequestMapping(value = "/removeFavor", method = RequestMethod.GET)
	public ResponseEntity<Object> removeFavor(@RequestParam("favorCdList")String favorCdList, HttpServletRequest request) throws Exception {
		
		String[] temp = favorCdList.split(",");
		int[] deleteFavorCdList = new int[temp.length];

		for (int i = 0; i < temp.length; i++) {
			deleteFavorCdList[i] = Integer.parseInt(temp[i]);
		}
		
		myPageService.removeFavor(deleteFavorCdList);
		
		String jsScript = "<script>";
			   jsScript += "alert('찜목록에서 삭제되었습니다.'); ";
			   jsScript += "location.href='myFavorList'";
			   jsScript += "</script>";
		
	    HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}

	
}
