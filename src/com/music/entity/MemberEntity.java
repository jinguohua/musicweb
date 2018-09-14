package com.music.entity;

import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "memberInfo")
//@GenericGenerator(name="g1",strategy="GenerationType.AUTO")
public class MemberEntity {
	private String userId;
	private String userName;
	private String passWord;
	
      
    private List<FSongs> songs;  //多对一设置外键   --用户最喜欢的歌曲

	private List<CommentEntity> comment;  //多对一外键 --用户多次提交的评论
	public MemberEntity(){};
	
	public MemberEntity(String userId,String userName,String passWord){
		setUserId(userId);
		setUserName(userName);
		setPassWord(passWord);
		
	}
	 
	@Override
	public String toString() {
		return "MemberEntity [userId=" + userId + ", userName=" + userName + ", passWord=" + passWord + ", songs="
				+ songs + ", comment=" + comment + "]";
	}

	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	@OneToMany(cascade= {CascadeType.ALL},fetch=FetchType.LAZY)
    @JoinColumn(name="userId")  
	public List<FSongs> getSongs() {
		return songs;
	}

	public void setSongs(List<FSongs> songs) {
		this.songs = songs;
	}
	@OneToMany(cascade= {CascadeType.ALL},fetch=FetchType.LAZY)
    @JoinColumn(name="userId")
	public List<CommentEntity> getComment() {
		return comment;
	}

	public void setComment(List<CommentEntity> comment) {
		this.comment = comment;
	}

	
	
}
