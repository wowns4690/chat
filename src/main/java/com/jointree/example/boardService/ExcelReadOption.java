package com.jointree.example.boardService;

import java.util.ArrayList;
import java.util.List;

public class ExcelReadOption {
	private String filePath;
	private List<String> outputCloumns;
	private int startRow;
	
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public List<String> getOutputCloumns() {
		List<String> temp = new ArrayList<String>();
		temp.addAll(outputCloumns);
		return temp;
	}
	public void setOutputCloumns(List<String> outputCloumns) {
		List<String> temp = new ArrayList<String>();
		temp.addAll(outputCloumns);
		this.outputCloumns = temp;
	}
	public void setOutputColumns(String ...outputColumns) {
		if(this.outputCloumns == null) {
			this.outputCloumns = new ArrayList<String>();
		}
		for(String ouputColumn : outputColumns) {
			this.outputCloumns.add(ouputColumn);
		}
	}
	
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	
}
