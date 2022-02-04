package com.jointree.example.Vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FileInfoDto {
	private String saveFolder;
	private String originFile;
	private String saveFile;
	private String roomId;
	private int uploadNum;
	private String menu;
	private String changeFile;
	private String useYn;
}
