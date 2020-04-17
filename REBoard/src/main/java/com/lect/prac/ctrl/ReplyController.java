package com.lect.prac.ctrl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.lect.prac.domain.ReplyVO;
import com.lect.prac.service.ReplyService;

import util.Log;

@Controller
public class ReplyController {

	@Inject
	private ReplyService svc;

	@PostMapping("reply/write")
	public String insert(ReplyVO ReplyVO, Model model) {
		List<ReplyVO> list = svc.list(ReplyVO.getBoardindex());
		int num = 0;
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getNum() != i) {
				num = i;
				break;
			}
			num++;
		}
		ReplyVO.setNum(num);
		svc.insert(ReplyVO);
		list = svc.list(ReplyVO.getBoardindex());
		model.addAttribute("list", list);
		return "reply/reply_list";
	}

	@GetMapping("reply/list")
	public String list(int boardindex, Model model) {
		List<ReplyVO> list = svc.list(boardindex);
		model.addAttribute("list", list);
		return "reply/reply_list";
	}

	@PostMapping("reply/delete")
	public String delete(int boardindex, int num, String writer, Model model) {
		ReplyVO ReplyVO = new ReplyVO();
		ReplyVO.setBoardindex(boardindex);
		ReplyVO.setNum(num);
		ReplyVO.setWriter(writer + " ");
		ReplyVO.setContent("삭제된 댓글입니다.");
		svc.remove(ReplyVO);
		List<ReplyVO> list = svc.list(ReplyVO.getBoardindex());
		model.addAttribute("list", list);
		return "reply/reply_list";
	}

	@PostMapping("reply/modify")
	public String modify(int boardindex, int num, String content, Model model) {
		ReplyVO ReplyVO = new ReplyVO();
		ReplyVO.setBoardindex(boardindex);
		ReplyVO.setNum(num);
		ReplyVO.setContent(content);
		svc.modify(ReplyVO);
		return "reply/null";
	}
}