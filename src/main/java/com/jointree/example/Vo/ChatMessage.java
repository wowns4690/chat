package com.jointree.example.Vo;


import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class ChatMessage {
	private String chatRoomId;
	private String writer;
	private String message;
	private String rank;
	private String mberId;
	private MessageType type;
	
	public enum MessageType{
		Enter, Quit, Talk, Select, Delete, UserEnter, UserQuit
	}
}

