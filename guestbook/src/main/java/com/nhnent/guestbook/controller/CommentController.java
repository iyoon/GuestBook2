package com.nhnent.guestbook.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nhnent.guestbook.service.CommentService;
import com.nhnent.guestbook.vo.Comment;

@Controller
public class CommentController {

	@Autowired
	CommentService commentService;

	@RequestMapping(value = "/comment/list", method = RequestMethod.POST)
	public @ResponseBody List<Comment> getCommentList(ModelMap modelMap) {
		List<Comment> comments = commentService.getCommentList();
		for (Comment comment : comments) {
			comment.setContents(comment.getContents().replace("\n", "<br>"));
		}
		modelMap.addAttribute("comments", comments);
		return comments;
	}

	@RequestMapping(value = "/addComment", method = RequestMethod.POST)
	public String addComment(HttpServletRequest request, Comment comment, Errors errors, ModelMap modelMap) {
		commentService.addComment(comment);
		return "list";
	}
		
	@RequestMapping(value = "/deleteComment", method = RequestMethod.POST)
	public String deleteComment(@RequestBody Comment comment, ModelMap modelMap) {
		commentService.deleteComment(comment);
		return "list";
	}

	@RequestMapping(value = "/updateComment", method = RequestMethod.POST)
	public String updateComment(HttpServletRequest request, @RequestBody Comment comment, ModelMap modelMap) {
		commentService.updateComment(comment);
		return "list";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String viewTest(HttpServletRequest request, ModelMap modelMap) {
		return "list";
	}
}
