package com.spring.itpms.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.itpms.member.dto.MemberDto;
import com.spring.itpms.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView register() throws Exception {
		return new ModelAndView("/member/register");
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ResponseEntity<Object> register(MemberDto memberDto, HttpServletRequest request) throws Exception {
		memberDto.setPasswd(bCryptPasswordEncoder.encode(memberDto.getPasswd()));
		
		memberService.addMember(memberDto);
		
		String message  = "<script>";
		   message += " alert('회원가입되었습니다.');";
		   message += " location.href='" + request.getContextPath() + "/';";
		   message += " </script>";
		   
	   HttpHeaders reponseHeaders = new HttpHeaders();
	   reponseHeaders.add("Content-Type", "text/html; charset=utf-8");
	   return new ResponseEntity<Object>(message, reponseHeaders, HttpStatus.OK);
	}

	@RequestMapping(value = "/checkDuplicatedId", method = RequestMethod.GET)
	public ResponseEntity<String> overlapped(@RequestParam("memberId")String memberId) throws Exception {
	
		return new ResponseEntity<String>(memberService.checkDuplicatedId(memberId), HttpStatus.OK);
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login() throws Exception {
		return new ModelAndView("/member/login");
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ResponseEntity<Object> login(MemberDto memberDto, HttpServletRequest request) throws Exception {
		
		String jsScript = "";
		if (memberService.login(memberDto)) { 	
			
			HttpSession session = request.getSession();		
			session.setAttribute("memberId" , memberDto.getMemberId());
			session.setAttribute("role" , "client");
			session.setAttribute("myOrderCnt" , memberService.getMyOrderCnt(memberDto.getMemberId()));
			session.setAttribute("myCartCnt" , memberService.getMyCartCnt(memberDto.getMemberId()));
			session.setMaxInactiveInterval(60 * 30);
			
			jsScript  = "<script>";
			jsScript += " alert('환영합니다! " +  memberDto.getMemberId() + "님');";
			jsScript += " location.href='" + request.getContextPath() + "/';";
			jsScript += " </script>";
			
		}
		else { 
			
			jsScript  = "<script>";
			jsScript += " alert('아이디와 비밀번호를 확인하세요.');";
			jsScript += " history.go(-1);";
			jsScript += " </script>";
			
		} 
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
	    return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ResponseEntity<Object> logout(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.invalidate();
		
		
		String jsScript = "<script>";
			   jsScript += " alert('로그아웃 되었습니다.');";
			   jsScript += "location.href='" + request.getContextPath() + "/';";
			   jsScript += " </script>";
		   
	   HttpHeaders responseHeaders = new HttpHeaders();
	   responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		   
	   return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
		
	}
	
}
