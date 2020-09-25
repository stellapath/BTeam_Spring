package com.project.bteam.qna;

import java.util.List;

import org.springframework.stereotype.Component;

import com.project.bteam.common.PageVO;

@Component
public class QnaPage extends PageVO{
	private List<PageVO> list;

	public List<PageVO> getList() {
		return list;
	}

	public void setList(List<PageVO> list) {
		this.list = list;
	}
}
