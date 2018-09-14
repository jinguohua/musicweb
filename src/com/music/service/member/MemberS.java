package com.music.service.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.music.dao.member.MemberD;
import com.music.entity.FSongs;
@Service
public class MemberS {
	/**
	 * 
	 * @param userName 
	 * @param passWord
	 */
	@Autowired
	private MemberD md;
	public String login(String userName, String passWord) {
		return md.selectNumByUser(userName,passWord);
	}
	public int insertSongInfo(FSongs fs, String userId) {
		int res = md.insertSongInfo(fs,userId);
	//	System.out.println(res);
		return res;
	}
	public List<FSongs> getSongs(String userId) {
		List<FSongs> fSongs = md.getSongsByuserId(userId);
		return fSongs;
	}

}
