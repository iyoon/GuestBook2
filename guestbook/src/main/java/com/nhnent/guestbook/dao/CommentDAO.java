package com.nhnent.guestbook.dao;

import java.util.List;

import com.nhnent.guestbook.vo.Comment;

public interface CommentDAO {
	// 코멘트 리스트 가져오기
	List<Comment> getCommentList();

	// 코멘트 추가
	void addComment(Comment comment);

	// 코멘트 삭제
	void deleteComment(Comment comment);

	// 코멘트 수정
	void updateComment(Comment comment);

}
