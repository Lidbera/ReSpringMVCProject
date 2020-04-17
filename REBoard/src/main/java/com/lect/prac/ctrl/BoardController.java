package com.lect.prac.ctrl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.lect.prac.domain.BoardVO;
import com.lect.prac.service.BoardService;
import com.lect.prac.service.FileUploadService;

import util.Log;

@Controller
public class BoardController {
	@Inject
	private BoardService svc;
	@Autowired
	private FileUploadService uploadsvc;

	@GetMapping("board")
	public String boardPage() {
		return "board/boardPage";
	}

	@GetMapping("board/write")
	public String boardWrite() {
		return "board/boardPage_write";
	}

	@PostMapping("board/write/new")
	public String insert(@ModelAttribute BoardVO vo, @RequestParam("uploadfile") MultipartFile file, Model model) {
		String url = null;
		try {
			url = uploadsvc.upload(file);
			vo.setFilename(url);
			svc.write(vo);
		} catch (Exception e2) {
			Log.info(String.format("board_write_error: id(%s), filename(%s)", vo.getWriter_id(), url));
			return "redirect:/board";
		}
		List<BoardVO> list = svc.selectList(1);
		model.addAttribute("list", list);
		return "board/boardPage";
	}

	@GetMapping("board/{index:[\\d]+}")
	public String board_one(@PathVariable int index) {
		return "board/boardPage_one";
	}

	@PostMapping("board/select")
	public String select(int index, Model model) {
		BoardVO vo = svc.select(index);
		if (vo == null) {
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

	@PostMapping("board/update")
	public String modify(BoardVO vo) {
		svc.modify(vo);
		return "board/boardPage";
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
