package kr.co.web.domain;

import java.util.Date;

public class BoardVO {
	private Integer board_number;
	private String title;
	private String contents;
	private Date create_date;
	private int view_count;
	
	public Integer getBoard_number() {
		return board_number;
	}
	
	public void setBoard_number(Integer board_number) {
		this.board_number = board_number;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getContents() {
		return contents;
	}
	
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	public Date getCreate_date() {
		return create_date;
	}
	
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	
	public int getView_count() {
		return view_count;
	}
	
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	
	@Override
	public String toString() {
		return "BoardVO [board_number=" + board_number + ", title=" + title + ", contents=" + contents + ", create_date="
				+ create_date + ", viewcount=" + view_count+ "]";
	}
}
