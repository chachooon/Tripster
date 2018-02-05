package com.tripster.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.tripster.domain.MemberVO;
import com.tripster.domain.ScrapVO;
import com.tripster.service.ContentsService;
import com.tripster.service.ScrapService;

// 기능 구현 controller
@RestController
public class ScrapModuleController {
	
	@Inject
	private ScrapService scrapService;
	@Inject
	private ContentsService contentsService;
	
	private static final Logger loger = LoggerFactory.getLogger(ScrapModuleController.class);

	// 스크랩 추가 
	@RequestMapping(value="/scrap/{contentsID}",method=RequestMethod.POST)
	public ResponseEntity<Integer> scrap(@PathVariable("contentsID") Integer contentsID,HttpSession session) {
		
		ResponseEntity<Integer> entity = null;
		System.out.println("scrap controller");
		try {
			// session의 회원정보 가져오기
			MemberVO memberVO = (MemberVO) session.getAttribute("login");
			// id 값을 받아서 스크랩 추가 
			scrapService.scrap(memberVO.getMemberID(),contentsID);
			
			loger.info("scrap success");
			entity = new ResponseEntity<>(contentsService.getScrapCnt(contentsID),HttpStatus.OK);
			
			
		}catch(Exception e){
			
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;
		
	}
	
	// 스크랩 제거 
	@RequestMapping(value="/scrapDelete/{contentsID}",method=RequestMethod.POST)
	public ResponseEntity<Integer> scrapDelete(@PathVariable("contentsID") Integer contentsID,HttpSession session) {
		
		ResponseEntity<Integer> entity = null;
		
		try {
			// session의 회원정보 가져오기
			MemberVO memberVO = (MemberVO) session.getAttribute("login");
			// 컨텐츠 스크랩 제거 서비스
			scrapService.scrapDelete(memberVO.getMemberID(),contentsID);
			loger.info("scrap remove");
			entity = new ResponseEntity<>(contentsService.getScrapCnt(contentsID),HttpStatus.OK);
			
		}catch(Exception e){
			
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;
		
	}
	
	// 스크랩 리스트 조회 
	@RequestMapping(value="/scraplist/",method=RequestMethod.GET)
	public ResponseEntity<List<ScrapVO>> scrapList(HttpSession session, Model model){
		
		ResponseEntity<List<ScrapVO>> entity = null;
		
		try {
			
//			loger.info("scrap list");
			MemberVO memberVO = (MemberVO) session.getAttribute("login");
			// 멤버 id를 받아 리스트를 조회하여 뷰단으로 전송
			
			entity = new ResponseEntity<>(scrapService.listAll(memberVO.getMemberID()),HttpStatus.OK);
			
		}catch(Exception e) {
			
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;
		
	}
	
	// 카테고리별 스크랩 리스트 조회 
	@RequestMapping(value="/scraplist/{categoryID}",method=RequestMethod.GET)
	public ResponseEntity<List<ScrapVO>> scrapByCategory(@PathVariable("categoryID") Integer categoryID, HttpSession session, Model model){
		
		ResponseEntity<List<ScrapVO>> entity = null;
		
		try {
			
			MemberVO memberVO = (MemberVO) session.getAttribute("login");
			// 멤버 id를 받아 리스트를 조회하여 뷰단으로 전송
			entity = new ResponseEntity<>(scrapService.listByCategory(memberVO.getMemberID(), categoryID),HttpStatus.OK);
			
		}catch(Exception e) {
			
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;
		
	}
	
	// 스크랩 리스트에서 스크랩 제거 
	@RequestMapping(value="/scrapIDremove/{scrapID}",method=RequestMethod.POST)
	public ResponseEntity<String> scrapIDRemove(@PathVariable("scrapID") Integer scrapID){
		
		ResponseEntity<String> entity = null;
		
		try {
			
			loger.info("scrpalist scrap remove");
			scrapService.scrapIDRemove(scrapID);
			
			entity = new ResponseEntity<>("scrapIDRemove",HttpStatus.OK);
			
		}catch(Exception e){
			
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;
		
	}
	
	// 스크랩 체크
	@RequestMapping(value="/scrapCheck/{contentsID}",method=RequestMethod.POST)
	public ResponseEntity<Integer> scrapCheck(@PathVariable ("contentsID") Integer contentsID,HttpSession session){
		
		ResponseEntity<Integer> entity = null;
		// 현재 회원
		// session의 회원정보 가져오기
		MemberVO memberVO = (MemberVO) session.getAttribute("login");
		Integer memberID = memberVO.getMemberID();
		
		try {
			Integer check = scrapService.scrapCheck(contentsID, memberID);
			entity = new ResponseEntity<>(check,HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
 
}
