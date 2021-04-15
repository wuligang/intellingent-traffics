package com.hr.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hr.pojo.BusStop;
import com.hr.pojo.News;
import com.hr.service.NewsService;
import com.hr.util.EasyUi;
import com.hr.util.NewsList;

/**
 * 新闻控制
 *
 * @author Administrator
 */
@Controller("newsController")
@RequestMapping("news")
public class NewsController {

    @Autowired
    private NewsService newsService;

    /* 修改新闻 */
    @RequestMapping("bian")
    @ResponseBody
    public Map<String, String> updata(
            @RequestParam(value = "newsId") Integer newsId,
            @RequestParam(value = "newsTitle") String newsTitle,
            @RequestParam(value = "newsAuthor") String newsAuthor,
            @RequestParam(value = "newsInfos", defaultValue = "内容已删除") String newsInfos) {
        Map<String, String> map = new HashMap<>();
        News news = new News();
        news.setNewsId(newsId);
        news.setNewsTitle(newsTitle);
        news.setNewsAuthor(newsAuthor);
        news.setNewsInfo(newsInfos);
        Integer integer = newsService.updata(news);
        if (integer != 0) {
            map.put("status", "200");
        } else {
            map.put("status", "500");
        }
        return map;
    }

    /**
     * 添加新闻，包括图片文件上传
     */
    @RequestMapping(value = "/photoUpload/aaa", method = RequestMethod.POST)
    public String photoUpload(
            @RequestParam(value = "newsTitle") String newsTitle,
            @RequestParam(value = "newsAuthor") String newsAuthor,
            @RequestParam(value = "newsPhoto") MultipartFile file,
            @RequestParam(value = "content", defaultValue = "暂无数据") String content,
            @RequestParam(value = "newsStatus", defaultValue = "1") Integer newsStatus,
            HttpServletRequest request)
            throws IllegalStateException, IOException {
        News news = new News();
        String filename = file.getOriginalFilename();
        // 获取文件后缀名
        if (filename != null && filename != "") {
            System.out.println(request.getParameter("newsTitle"));
            // 上传后的地址，注意("/upload")是表示文件上传后的目标文件夹
            String realPath = request.getSession().getServletContext()
                    .getRealPath("/upload");
            System.out.println("打印文件上传的路径" + realPath);
            // 获取文件名
            String extensionname = filename
                    .substring(filename.lastIndexOf(".") + 1);
            System.out.println(extensionname);
            // 给上传的文件起别名，有很多种方式
            String newFilename = String.valueOf(System.currentTimeMillis()) + "."
                    + extensionname;
            // 创建File对象，传入目标路径参数，和新的文件别名
            File dir = new File(realPath, newFilename);
            if (!dir.exists()) {// 如果dir代表的文件不存在，则创建它，
                dir.mkdirs();//创建文件夹
            }
            // 如果存在则直接执行下面操作
            file.transferTo(dir);// 将上传的实体文件复制到指定目录upload下
            System.out.println(newFilename);//输出文件名
            System.out.println("测试是否执行完毕");
            news.setNewsPhoto("intellingent-traffics\\src\\main\\webapp\\upload\\" + newFilename);
        } else {
            news.setNewsPhoto("");
        }
        //开始向数据库存数据
        news.setNewsTitle(newsTitle);
        news.setNewsAuthor(newsAuthor);
        news.setNewsInfo(content);
        news.setNewsStatus(newsStatus);
        Integer integer = newsService.addjia(news);
        return "redirect:/to/Lost";
    }

    /* 删除新闻 */
    @RequestMapping("delect")
    @ResponseBody
    public Map<String, String> dele(@RequestParam("newsId") Integer newsId) {
        Map<String, String> map = new HashMap<String, String>();
        Integer integer = newsService.teamdelete(newsId);
        if (integer != 0) {
            map.put("status", "200");
        } else {
            map.put("status", "500");
        }
        return map;
    }

    // 分页查及搜索失物招领
    @RequestMapping("lost")
    @ResponseBody
    public NewsList lost(
            @RequestParam(value = "page", defaultValue = "1") Integer page,
            @RequestParam(value = "rows", defaultValue = "10") Integer rows,
            @RequestParam(value = "newsId", required = false) Integer newsId,
            @RequestParam(value = "serach1", required = false) String newsTitle) {
        System.out.println(newsId
                + "********************************************");
        return newsService.querylost(page, rows, newsTitle, newsId);
    }

    // 查新闻详情
    @RequestMapping("checks")
    @ResponseBody
    public News news(@RequestParam("newsId") Integer newsId) {
        return newsService.check(newsId);
    }

    // 分页查新闻
    @RequestMapping("paging")
    @ResponseBody
    public NewsList maAndView(
            @RequestParam(value = "page", defaultValue = "1") Integer page,
            @RequestParam(value = "rows", defaultValue = "10") Integer rows,
            @RequestParam("newsAssortment") Integer newsAssortment) {
        return newsService.queryAllUser(page, rows, newsAssortment);
    }

    // 查所有新闻
    @RequestMapping("all")
    @ResponseBody
    public Map<String, List<News>> selectNewsByType() {
        Map<String, List<News>> map = new HashMap<String, List<News>>();
        List<News> news = this.newsService.newss();
        map.put("news", news);
        return map;
    }

    // 查询全部信息或根据news_assortment查询该类的所有的新闻
    @RequestMapping("selectAllBusStop")
    @ResponseBody
    public EasyUi selectAllBusStop(
            @RequestParam(value = "page", defaultValue = "1") int total,
            @RequestParam(value = "rows", defaultValue = "5") int rows,
            @RequestParam(value = "newsAssortment", required = false) String newsAssortment) {
        EasyUi easyUi = this.newsService.selectAllBusStop(total, rows,newsAssortment);
        return easyUi;
    }
}
