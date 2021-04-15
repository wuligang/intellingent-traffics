package com.hr.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hr.mapper.BusSiteMapper;
import com.hr.pojo.BusStop;
import com.hr.pojo.HatArea;
import com.hr.service.BusSiteService;
import com.hr.util.EasyUi;
import com.hr.util.ExcelUtils;


/**
 *上午11:27:50
 *Administrator 
 * @author lvbing
 * @date 上午11:27:50
 */
@Service(value="busSiteService")
public class BusSiteServiceImpl implements BusSiteService{
	@Autowired
	private BusSiteMapper busSiteMapper;

	@Override
	public EasyUi selectAllBusStop(Integer pageNum,Integer pageSize,String stopName) {
		EasyUi easyUi = new EasyUi();
		//1.开启分页查询
		PageHelper.startPage(pageNum, pageSize);
		List<BusStop> busStop = busSiteMapper.selectAllBusStop(stopName);
		
		//2.获取分页信息
		PageInfo<BusStop> pageInfo = new PageInfo<BusStop>(busStop);		
		easyUi.setPageNum(pageInfo.getPageNum());//当前页
		easyUi.setPages(pageInfo.getPages());//总页数
		easyUi.setTotal(pageInfo.getTotal());//总记录数
		easyUi.setRows(busStop);//结果集
		return easyUi;
	}

	/* 插入站点
	 */
	@Override
	public int addBusStop(BusStop busStop) {
		int i = this.busSiteMapper.addBusStop(busStop);
		int j;
		if(i==1){
			j=1;
		}else{
			j=0;
		}
		return j;
	}

	/* 修改站点信息
	 */
	@Override
	public int updateBusStop(BusStop busStop) {
		int i = this.busSiteMapper.updateBusStop(busStop);
		int j;
		if(i==1){
			j=1;
		}else{
			j=0;
		}
		return j;
	}

	/*删除站点
	 */
	@Override
	public int delBusStop(Integer stopId) {
		int i = this.busSiteMapper.delBusStop(stopId);
		return i;
	}

	//execl导入
	public String ajaxUploadExcel(HttpServletRequest request,HttpServletResponse response){
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;    
        
        MultipartFile file = multipartRequest.getFile("upfile");  
        if(file.isEmpty()){  
            try {
				throw new Exception("文件不存在！");
			} catch (Exception e) {
				e.printStackTrace();
			}  
        }  
          
        InputStream in =null;  
        try {
			in = file.getInputStream();
		} catch (IOException e) {
			e.printStackTrace();
		}  
        
		List<List<Object>> listob = null; 
		try {
			listob = new ExcelUtils().getBankListByExcel(in,file.getOriginalFilename());
			System.out.println(listob);
		} catch (Exception e) {
			e.printStackTrace();
		}   
	    //该处可调用service相应方法进行数据保存到数据库中，现只对数据输出  
        for (int i = 0; i < listob.size(); i++) {  
            List<Object> lo = listob.get(i); 
            BusStop vo = new BusStop(); 
            BusStop j = null;
            
            try {
            	System.out.println(Integer.valueOf(String.valueOf(lo.get(0))));
				j = busSiteMapper.selectByPrimaryKey(Integer.valueOf(String.valueOf(lo.get(0))));
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				System.out.println("没有新增");
			}
            
			    vo.setStopId(Integer.valueOf(String.valueOf(lo.get(0))));  
	            vo.setStopName(String.valueOf(lo.get(1)));  
	            vo.setStopAddress(String.valueOf(lo.get(2)));   
	            vo.setStopInfo(String.valueOf(String.valueOf(lo.get(3))));  
	            vo.setStopStatus(Integer.valueOf(String.valueOf(lo.get(4))));
	            vo.setStopArea(String.valueOf(String.valueOf(lo.get(5))));
			if(j == null){
				busSiteMapper.addBusStop(vo);
			}else{
				busSiteMapper.updateBusStop(vo);
			}
        }   
        return "文件导入成功！";
	}
}
