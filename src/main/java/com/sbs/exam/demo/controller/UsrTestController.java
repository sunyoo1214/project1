package com.sbs.exam.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.sbs.exam.demo.service.BoardService;
import com.sbs.exam.demo.service.MemberService;

import com.sbs.exam.demo.util.Ut;

import com.sbs.exam.demo.vo.Board;
import com.sbs.exam.demo.vo.Member;
import com.sbs.exam.demo.vo.Rq;

@Controller
public class UsrTestController {
	private BoardService boardService;
	private MemberService memberService;
	private Rq rq;
	
	
	public UsrTestController(BoardService boardService, MemberService memberService, Rq rq) {
		this.boardService = boardService;
		this.memberService = memberService;
		this.rq = rq;
	}

	@RequestMapping("/usr/test/list")
	public String showList(Model model, @RequestParam(defaultValue = "3") int boardId,
			@RequestParam(defaultValue = "3,7") String searchKeywordTypeCode,
			@RequestParam(defaultValue = "") String searchKeyword, @RequestParam(defaultValue = "1") int page) {
		Board board = boardService.getBoardById(boardId);

		if (board == null) {
			return rq.historyBackJsOnView(Ut.f("%d번 게시판은 존재하지 않습니다.", boardId));
		}
		
		int membersCount = memberService.getMembersCount(boardId, searchKeywordTypeCode, searchKeyword);
		
		int itemsCountInAPage = 10;
		int pagesCount = (int) Math.ceil((double) membersCount / itemsCountInAPage);
		Member members = memberService.getForPrintMembers(rq.getLoginedMemberId(), boardId,
				searchKeywordTypeCode, searchKeyword, itemsCountInAPage, page);

		model.addAttribute("boardId", boardId);
		model.addAttribute("page", page);
		model.addAttribute("board", board);
		model.addAttribute("pagesCount", pagesCount);
		model.addAttribute("membersCount", membersCount);
		model.addAttribute("members", members);
		
		

		return "usr/test/list";
	}

}
