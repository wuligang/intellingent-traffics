package com.hr.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hr.mapper.NewsMapper;
import com.hr.pojo.BusStop;
import com.hr.pojo.News;
import com.hr.service.NewsService;
import com.hr.util.EasyUi;
import com.hr.util.NewsList;

@Service("newsService")
public class NewsServiceImpl implements NewsService {
	
	@Autowired
	private NewsMapper newsMapper;
	
	@Override
	public List<News> newss() {
		return this.newsMapper.quaryAllNews();
	}
	/**
	 * 分页查新闻
	 */
	@Override
	public NewsList queryAllUser(Integer page, Integer rows,Integer newsAssortment) {
		NewsList list=new NewsList();
		PageHelper.startPage(page, rows);
		List<News> list2=newsMapper.AllNews(newsAssortment);
		PageInfo<News> pageInfo = new PageInfo<News>(list2);
		if(pageInfo.getTotal()%rows==0){
			list.setNumber(pageInfo.getTotal()/rows);
		}else{
			list.setNumber(pageInfo.getTotal()/rows+1);
		}
		list.setTotal(pageInfo.getTotal());
		list.setRows(pageInfo.getList());
		return list;
	}
	/**
	 * 查新闻详情
	 */
	
	@Override
	public News check(Integer newsId) {
		News news=newsMapper.cha(newsId);
		return news;
	}
	
	/**
	 * 分页查失物招领
	 */
	@Override
	public NewsList querylost(Integer page, Integer rows,String newsTitle,Integer newsId) {
		NewsList list=new NewsList();
		PageHelper.startPage(page, rows);
		List<News> list2=newsMapper.lostNews(newsTitle,newsId);
		PageInfo<News> pageInfo = new PageInfo<News>(list2);
		list.setTotal(pageInfo.getTotal());
		list.setRows(pageInfo.getList());
		return list;
	}
	
	/**
	 * 删除新闻
	 */
	@Override
	public Integer teamdelete(Integer newsId) {
		return this.newsMapper.quarydelete(newsId);
	}
	
	/**
	 * 添加新闻
	 */
	@Override
	public Integer addjia(News news) {
		return this.newsMapper.quaryadd(news);
	}
	// 查询全部信息或根据news_assortment查询该类的所有的新闻
	@Override
	public EasyUi selectAllBusStop(Integer pageNum, Integer pageSize,
			String newsAssortment) {
		EasyUi easyUi = new EasyUi();
		//1.开启分页查询
		PageHelper.startPage(pageNum, pageSize);
		List<News> news = this.newsMapper.selectAllNews(newsAssortment);
		
		//2.获取分页信息
		PageInfo<News> pageInfo = new PageInfo<News>(news);		
		easyUi.setPageNum(pageInfo.getPageNum());//当前页
		easyUi.setPages(pageInfo.getPages());//总页数
		easyUi.setTotal(pageInfo.getTotal());//总记录数
		easyUi.setRows(news);//结果集
		return easyUi;
	}
	
	//修改数据
	@Override
	public Integer updata(News news) {
		return this.newsMapper.quaryupdata(news);
	}

}
