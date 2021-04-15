package com.hr.util;

import java.util.List;

import com.hr.pojo.News;

/**
 * 分页专用
 * @author Administrator
 *
 */
public class NewsList {
	
	private long number;
	private Long total;
	private List<News> rows;

	public long getNumber() {
		return number;
	}
	public void setNumber(long number) {
		this.number = number;
	}
	public Long getTotal() {
		return total;
	}
	public void setTotal(Long total) {
		this.total = total;
	}
	public List<News> getRows() {
		return rows;
	}
	public void setRows(List<News> rows) {
		this.rows = rows;
	}

}
