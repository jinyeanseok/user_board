package kr.co.web.domain;

import java.util.Date;

public class ReplyVO {
	private Integer reply_number;
	private Integer board_number;
	private String replytext;
	private String replyer;
	private Date create_date;
	private Date update_date;

	
	public Integer getReply_number() {
		return reply_number;
	}
	public void setReply_number(Integer reply_number) {
		this.reply_number = reply_number;
	}
	public Integer getBoard_number() {
		return board_number;
	}
	public void setBoard_number(Integer board_number) {
		this.board_number = board_number;
	}
	public String getReplytext() {
		return replytext;
	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}


}
