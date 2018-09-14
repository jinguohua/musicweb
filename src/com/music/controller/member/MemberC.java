package com.music.controller.member;

import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.music.entity.FSongs;
import com.music.service.member.MemberS;
/**
 * 
 * @author ghjin
 * member 会员接口
 *       login() 会员登录
 */
@Controller
@RequestMapping(value="/member")
public class MemberC {
	@Autowired
	private MemberS ms;
	
	@RequestMapping(value="/login")
	public String memberLogin(String userName,String passWord,HttpSession session){
		String res = ms.login(userName,passWord);
		if(res != "-1"){
			session.setAttribute("userName",userName);
			session.setAttribute("userId", res);
			return "nav";
		}else {
			return "redirect:/jsp/index.jsp" ;
		}
	} 
	
	@RequestMapping(value="/myFavoriteSongs")
	@ResponseBody
	public int myFavorite(FSongs fs,HttpSession session){
		/*MemberEntity memberEntity = new MemberEntity();
		memberEntity.setSongs(songs);*/
		String userId = (String) session.getAttribute("userId");
		 int res = ms.insertSongInfo(fs,userId);
		  return res;
	} 
	
	@RequestMapping(value="/getMyFSongs")
	@ResponseBody
	public List<FSongs> myFsongs(HttpSession session){
		/*MemberEntity memberEntity = new MemberEntity();
		memberEntity.setSongs(songs);*/
		String userId = (String) session.getAttribute("userId");
		List<FSongs> res = ms.getSongs(userId);
		return res;
	} 
	
	
	
	@RequestMapping(value = "/myMain")
	public String myMain(){
		return "myMain";
	}
	
}
