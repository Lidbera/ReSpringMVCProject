package com.lect.prac.ctrl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.lect.prac.domain.BoardVO;
import com.lect.prac.service.BoardService;

import util.Log;

@Controller
public class BoardController {
	@Inject
	private BoardService svc;

	@GetMapping("board")
	public String boardPage() {
		return "board/boardPage";
	}
	
	@GetMapping("board/write")
	public String boardWrite() {
		return "board/boardPage_write";
	}
	
	@PostMapping(value = "board/write", params = {"vo"})
	public String insert(BoardVO vo, Model model) {
		try{
			svc.write(vo);
			model.addAttribute("wricheck", true);
		} catch (Exception e) {
			model.addAttribute("wricheck", false);
		}
		List<BoardVO> list = svc.selectList(1);
		model.addAttribute("list", list);
		return "board/boardPage";
	}
	
	@GetMapping(value = "board/{index:[\\d]+}")
	public String board_one(@PathVariable int index) {
		Log.info("boardPage_one called: index=" + index);
		return "board/boardPage_one";
	}
	
	@PostMapping("board/select")
	public String select(int index, Model model) {
		Log.info("select index: " + index);
		BoardVO vo = svc.select(index);
		if(vo == null) {
			return "board/board_select_fail";
		} else {
			model.addAttribute("vo", vo);
			return "board/board_select";
		}
	}
	
	@PostMapping("board/modify")
	public String modifyPage(int index, Model model) {
		BoardVO boardDTO = svc.select(index);
		model.addAttribute("board", boardDTO);
		return "board/board_modify";
	}
	
	//
	
	@GetMapping("board/modify")
	public String modify(BoardVO vo, Model model) {
		svc.modify(vo);
		model.addAttribute("index", vo.getIndex());
		return "board/boardPage_one";
	}
	
	@GetMapping("board/boardList")
	public String list(int tnum, Model model) {
		List<BoardVO> list = svc.selectList(tnum);
		model.addAttribute("list", list);
		return "board/board_list";
	}
	
	@GetMapping("board/paging")
	public String count(int num, Model model) {
		model.addAttribute("num", num);
		model.addAttribute("count", svc.count());
		return "board/board_paging";
	}
}
