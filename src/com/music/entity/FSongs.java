package com.music.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="FSongs")
//@GenericGenerator(name="g1",strategy="GenerationType.AUTO")
public class FSongs {
	private int FsongId;
	private String songId;
	private String songName;
	private String songAname;
	private float duration;
	

	public float getDuration() {
		return duration;
	}

	public void setDuration(float duration) {
		this.duration = duration;
	}
	
	public FSongs(){}
	
	public FSongs(Integer FsongId,String songId,String songName,String songAname, float duration){
		this.songId = songId;
		this.songName = songName;
		this.songAname = songAname;
		this.FsongId = FsongId;
		this.duration=  duration;
	}
	
	 

	@Override
	public String toString() {
		return "FSongs [FsongId=" + FsongId + ", songId=" + songId + ", songName=" + songName + ", songAname="
				+ songAname + ", duration=" + duration + "]";
	}

	public String getSongId() {
		return songId;
	}

	public void setSongId(String songId) {
		this.songId = songId;
	}

	public String getSongName() {
		return songName;
	}

	

	public void setSongName(String songName) {
		this.songName = songName;
	}

	public String getSongAname() {
		return songAname;
	}

	public void setSongAname(String songAname) {
		this.songAname = songAname;
	}
/*	@Id
	@GeneratedValue(generator = "uuid") 
	@GenericGenerator(name = "uuid", strategy = "uuid")*/
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public int getFsongId() {
		return FsongId;
	}

	public void setFsongId(int fsongId) {
		FsongId = fsongId;
	}
	 
}
