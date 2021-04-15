package com.hr.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.hr.pojo.News;

/**
 * 首页新闻接口
 * 
 * @author Administrator
 * 
 */
@Repository("newsMapper")
public interface NewsMapper {

	// 分页分类查
	public List<News> AllNews(Integer newsAssortment);

	// 查询所有新闻
	public List<News> quaryAllNews();

	// 查新闻详情
	public News cha(Integer newsId);

	// 分页查失物招领
	public List<News> lostNews(@Param("newsTitle") String newsTitle,
			@Param("newsId") Integer newsId);

	// 删除新闻
	public Integer quarydelete(@Param("newsId") Integer newsId);

	// 查询全部信息或根据news_assortment查询该类的所有的新闻
	public List<News> selectAllNews(
			@Param("newsAssortment") String newsAssortment);

	//添加新闻
	public Integer quaryadd(@Param("news")News news);

	//修改新闻
	public Integer quaryupdata(@Param("news")News news);
}
