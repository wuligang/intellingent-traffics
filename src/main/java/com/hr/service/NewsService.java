package com.hr.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.hr.pojo.News;
import com.hr.util.EasyUi;
import com.hr.util.NewsList;

/**
 * 新闻service的接口
 * 
 * @author Administrator
 * 
 */
public interface NewsService {

	// 查询所有新闻
	public List<News> newss();

	// 分页查新闻
	public NewsList queryAllUser(Integer page, Integer rows,
			Integer newsAssortment);

	// 查新闻详情
	public News check(Integer newsId);

	// 分页查失物招领
	public NewsList querylost(Integer page, Integer rows, String newsTitle,
			Integer newsId);

	// 删除新闻
	public Integer teamdelete(Integer newsId);

	// 添加新闻
	public Integer addjia(News news);

	// 查询全部信息或根据news_assortment查询该类的所有的新闻
	public EasyUi selectAllBusStop(Integer pageNum, Integer pageSize,String newsAssortment);

	//修改数据
	public Integer updata(News news);
	
}
