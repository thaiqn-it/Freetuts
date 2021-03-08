package com.mockproject.freetutsproject.dto;

import java.util.Date;

public class CommentDTO extends AbstractDTO<CommentDTO> {
	private String commenterName;
	private String commenterEmail;
	private Date date;
	private String comment;
	private PostDTO post;
	/**
	 * @return the commenterName
	 */
	public String getCommenterName() {
		return commenterName;
	}
	/**
	 * @param commenterName the commenterName to set
	 */
	public void setCommenterName(String commenterName) {
		this.commenterName = commenterName;
	}
	/**
	 * @return the commenterEmail
	 */
	public String getCommenterEmail() {
		return commenterEmail;
	}
	/**
	 * @param commenterEmail the commenterEmail to set
	 */
	public void setCommenterEmail(String commenterEmail) {
		this.commenterEmail = commenterEmail;
	}
	/**
	 * @return the date
	 */
	public Date getDate() {
		return date;
	}
	/**
	 * @param date the date to set
	 */
	public void setDate(Date date) {
		this.date = date;
	}
	/**
	 * @return the comment
	 */
	public String getComment() {
		return comment;
	}
	/**
	 * @param comment the comment to set
	 */
	public void setComment(String comment) {
		this.comment = comment;
	}
	/**
	 * @return the post
	 */
	public PostDTO getPost() {
		return post;
	}
	/**
	 * @param post the post to set
	 */
	public void setPost(PostDTO post) {
		this.post = post;
	}
	
	
}