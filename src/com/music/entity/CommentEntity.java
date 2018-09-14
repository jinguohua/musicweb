package com.music.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="CommentInfo")
@GenericGenerator(name="g1",strategy="assigned")
public class CommentEntity {
	private String commentId;
	private String commentInfo;
	private Date commentTime;
	
	private String songId;
	
	public CommentEntity(){}
	public CommentEntity(String commentId,String commentInfo,Date commentTime){
		this.commentId = commentId;
		this.commentInfo = commentInfo;
		this.commentTime = commentTime;
	}
	 
	@Override
	public String toString() {
		return "CommentEntity [commentId=" + commentId + ", commentInfo=" + commentInfo + ", commentTime=" + commentTime
				+ ", songId=" + songId + "]";
	}
	@Id
	@GeneratedValue(generator="g1")
	public String getCommentId() {
		return commentId;
	}
	public void setCommentId(String commentId) {
		this.commentId = commentId;
	}
	public String getCommentInfo() {
		return commentInfo;
	}
	public void setCommentInfo(String commentInfo) {
		this.commentInfo = commentInfo;
	}
	public Date getCommentTime() {
		return commentTime;
	}
	public void setCommentTime(Date commentTime) {
		this.commentTime = commentTime;
	}
	public String getSongId() {
		return songId;
	}
	public void setSongId(String songId) {
		this.songId = songId;
	}
}
