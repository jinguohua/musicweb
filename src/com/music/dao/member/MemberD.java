package com.music.dao.member;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.music.dao.database.DataBase;
import com.music.entity.FSongs;
import com.music.entity.MemberEntity;
@Repository
public class MemberD extends DataBase  {

	public String selectNumByUser(String userName, String passWord) {
		// TODO Auto-generated method stub
		String hql="from MemberEntity m where m.userName=:name and m.passWord=:pwd";
		Session session=this.getSession();
		
		Query query=session.createQuery(hql);
		query.setParameter("name", userName);
		query.setParameter("pwd", passWord);
		MemberEntity member=(MemberEntity) query.uniqueResult();
		if(member != null){
			return member.getUserId();	
		}else {
			return "-1";
		}
		
	}

	public int insertSongInfo(FSongs fs, String userId) {
		String num = null;
		String hql = "select f.songId from fsongs f where f.userId =? and f.songId =?";
		Session session=this.getSession();
		Query query=session.createSQLQuery(hql);
		query.setParameter(0, userId);
		query.setParameter(1, fs.getSongId());
		num=  (String) query.uniqueResult();
		//System.out.println(num.getFsongId());
		 if(num != null){
			// System.out.println(num);
			 return 0;
		 }else {

				String sql = "insert into fsongs(songId,songAname,songName,duration,userId) values(?,?,?,?,?)";
				Session session1=this.getSession();
				Query query1=session1.createSQLQuery(sql);
				/*fs.setSongId("12342");
				fs.setSongName("最后一次");
				fs.setSongAname("群星");
				fs.setDuration(435423);*/
				
				query1.setParameter(0, fs.getSongId());
				query1.setParameter(1, fs.getSongAname());
				query1.setParameter(2, fs.getSongName());
				query1.setParameter(3, fs.getDuration());
				query1.setParameter(4, userId);
				int num1=  query1.executeUpdate();
				//List<CustomerInfo> custs = query.list();
				return num1;
		}
		
		
	}

	public List<FSongs> getSongsByuserId(String userId) {
		String sql = "select * from fsongs where userId=? ";
		Session session = this.getSession();
		Query query = session.createSQLQuery(sql);
		query.setParameter(0, userId);
		List<FSongs> fSongs = query.list();
		System.out.println(fSongs.size()+"!!!!dao");
		return fSongs;
	}

}
