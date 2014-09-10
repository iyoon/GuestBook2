package com.nhnent.guestbook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.nhnent.guestbook.dao.CommentDAO;
import com.nhnent.guestbook.vo.Comment;

@Repository
@Transactional
public class CommentService implements CommentDAO {

	@Autowired
	private CommentDAO commentDAO;

	// 코멘트 가져오기
	public List<Comment> getCommentList() {
		return this.commentDAO.getCommentList();
	}

	// 코멘트 추가 
	public void addComment(Comment comment) {
		this.commentDAO.addComment(comment);
	}

	// 코멘트 삭제
	public void deleteComment(Comment comment) {
		this.commentDAO.deleteComment(comment);
	}

	// 코멘트 수정
	public void updateComment(Comment comment) {
		this.commentDAO.updateComment(comment);
	}

}
