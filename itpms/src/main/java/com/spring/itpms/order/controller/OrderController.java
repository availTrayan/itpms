package com.spring.itpms.order.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.spring.itpms.member.service.MemberService;
import com.spring.itpms.order.dto.OrderDto;
import com.spring.itpms.order.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/orderGoods", method = RequestMethod.GET)
	public ModelAndView orderGoods(@RequestParam("goodsCd")int goodsCd, @RequestParam("orderGoodsQty")int orderGoodsQty, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/order/orderGoods");
		
		HttpSession session = request.getSession();
		
		mv.addObject("orderer" , orderService.getOrdererDetail((String)session.getAttribute("memberId")));
		mv.addObject("goodsDto" , orderService.getGoodsDetail(goodsCd));
		mv.addObject("orderGoodsQty" , orderGoodsQty);
		
		return mv;
		
	}
	
	@RequestMapping(value="/orderGoods" , method=RequestMethod.POST)
	public ResponseEntity<Object> orderGoods(OrderDto orderDto , @RequestParam("point") int point ,  HttpServletRequest request) throws Exception{
		
		orderService.addOrder(orderDto , point);
		
		HttpSession session = request.getSession();
		session.setAttribute("myOrderCnt" , memberService.getMyOrderCnt(orderDto.getMemberId()));
		
		String jsScript= "<script>";
				jsScript += " alert('선택하신 상품을 주문했습니다.');";
				jsScript +=" location.href='" + request.getContextPath() + "/goods/goodsDetail?goodsCd=" + orderDto.getGoodsCd()+"';";
				jsScript +="</script>";
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
		
	}
	
	
	@RequestMapping(value="/orderCartGoods" , method=RequestMethod.GET)
	public ModelAndView orderCartGoods(@RequestParam("goodsCdList") String goodsCds , 
									   @RequestParam("cartGoodsQtyList") String cartGoodsQtyList , 
									   @RequestParam("cartCdList") String cartCdList ,
									   HttpServletRequest request) throws Exception{
		
		String[] temp = goodsCds.split(",");
		int[] goodsCdList = new int[temp.length];
		
		for (int i = 0; i < goodsCdList.length; i++) {
			goodsCdList[i] = Integer.parseInt(temp[i]);
		}
		
		ModelAndView mv = new ModelAndView();  			
		mv.setViewName("/order/orderCartGoods");
		
		HttpSession session = request.getSession();
		session.setAttribute("myOrderCnt" , memberService.getMyOrderCnt((String)session.getAttribute("memberId")));
		session.setAttribute("myCartCnt" , memberService.getMyCartCnt((String)session.getAttribute("memberId")));
		
		
		mv.addObject("orderer" , orderService.getOrdererDetail((String)session.getAttribute("memberId")));
		mv.addObject("goodsList" , orderService.getGoodsListByCart(goodsCdList));
		mv.addObject("orderGoodsQtyList" , cartGoodsQtyList);
		mv.addObject("goodsCdList" , goodsCds);
		mv.addObject("cartCdList" , cartCdList);
		
		return mv;
		
	}
	
	@RequestMapping(value="/orderCartGoods" , method=RequestMethod.POST)
	public ResponseEntity<Object> orderCartGoods(@RequestParam Map<String,String> orderListMap ,  HttpServletRequest request) throws Exception{
		
  		orderService.addOrderByCart(orderListMap);
  		
		HttpSession session = request.getSession();
		session.setAttribute("myOrderCnt" , memberService.getMyOrderCnt(orderListMap.get("memberId")));
		session.setAttribute("myCartCnt" , memberService.getMyCartCnt(orderListMap.get("memberId")));

		
		String jsScript = "<script>";
			   jsScript += "alert('선택하신 상품을 주문했습니다.');";
			   jsScript += "location.href='" + request.getContextPath() + "/myPage/myOrderList'";
			   jsScript +="</script>";
		
	    HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
	    return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
		
	}
	
	

}
