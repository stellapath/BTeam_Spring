package com.project.bteam.board;

import java.util.List;

import org.springframework.stereotype.Component;

import com.project.bteam.common.PageVO;

@Component
public class BoardPage extends PageVO{
	private int board_category;
	private List<PageVO> list;

	public int getBoard_category() {
		return board_category;
	}

	public void setBoard_category(int board_category) {
		this.board_category = board_category;
	}

	public List<PageVO> getList() {
		return list;
	}

	public void setList(List<PageVO> list) {
		this.list = list;
	}
	
}
