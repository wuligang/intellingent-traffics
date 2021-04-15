package com.hr.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hr.pojo.Bus;
import com.hr.pojo.BusCompany;
import com.hr.pojo.BusDriver;
import com.hr.pojo.BusLine;
import com.hr.pojo.BusTeam;
import com.hr.pojo.Export;
import com.hr.service.BusTeamService;
import com.hr.util.EasyUi;

/**
 * 汽车大队管理控制层
 * 
 * @author Administrator
 * 
 */
@Controller("busTeamController")
@RequestMapping("busTeam")
public class BusTeamController {

	@Autowired
	private BusTeamService busTeamService;

	/* 导入车队 */
	@RequestMapping("/LeadInUser")
	@ResponseBody
	public String leadInExcel(@RequestParam(value = "file") MultipartFile file,
			HttpServletRequest request) throws Exception {
		System.out.println(111111111);
		/*InputStream is = null;
		int count = 0;
		try {
			is = file.getInputStream();
			String fileName = file.getOriginalFilename();//获取文件后缀名
			String filePath = request.getSession().getServletContext()
					.getRealPath("upload");//上传保存位置		
			String tarFileName = FileUtils.uploadFile(is, fileName, filePath);
			ReadExcel readExcel = new ReadExcel();
			List<List<String>> lList = readExcel.getExcelInfo(filePath + "/"
					+ tarFileName,fileName);
			for (List<String> list : lList) {
				BcRegion region = new BcRegion();
				region.setProvince(list.get(1));
				region.setCity(list.get(2));
				region.setDistrict(list.get(3));
				region.setPostcode(list.get(4));
				region = getBcRegion(region);
				count += regionService.add(region);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}*/
		try {
            //转换成输入流
            InputStream in = file.getInputStream();
            XSSFWorkbook readWb = new XSSFWorkbook(in);
            /*HSSFWorkbook readWb = new HSSFWorkbook(in);*/
            //遍历该表格中所有的工作表，i表示工作表的数量 getNumberOfSheets表示工作表的总数
            for (int i = 0; i < readWb.getNumberOfSheets(); i++) {
                XSSFSheet sheet = readWb.getSheetAt(i);
                // 循环行Row
                for (int rowNum = 1; rowNum <= sheet.getLastRowNum(); rowNum++) {
                    XSSFRow hssfRow = sheet.getRow(rowNum);
                    if (hssfRow != null) {
                        for (int colNum = 0; colNum < hssfRow.getPhysicalNumberOfCells(); colNum++) {
                            System.out.println(hssfRow.getCell(colNum));
                        }
                        //赋值实例对象 做插入数据库操作
                    }
                }
            }
           
        } catch (Exception e) {
           
            e.printStackTrace();
        }
		return "";
	}

	/* 移除车辆 */
	@RequestMapping("updatato")
	@ResponseBody
	public Map<String, String> updatato(@RequestParam("ids") List<Object> ids) {
		Map<String, String> map = new HashMap<String, String>();
		Integer integer = busTeamService.teamupdatato(ids);
		if (integer != 0) {
			map.put("status", "200");
		} else {
			map.put("status", "500");
		}
		return map;
	}

	/* 添加车辆 */
	@RequestMapping("updata")
	@ResponseBody
	public Map<String, String> updata(@RequestParam("ids") List<Object> ids,
			@RequestParam(value = "teamId", required = false) Integer teamId) {
		Map<String, String> map = new HashMap<String, String>();
		Integer integer = busTeamService.teamupdata(ids, teamId);
		if (integer != 0) {
			map.put("status", "200");
		} else {
			map.put("status", "500");
		}
		return map;
	}

	/* 搜索车队 */
	@RequestMapping("serach")
	@ResponseBody
	public List<BusTeam> serach(
			@RequestParam(value = "serach1", required = false) String serach1,
			@RequestParam(value = "serach2", required = false) String serach2) {
		return this.busTeamService.getserach(serach1, serach2);
	}

	/* 显示所有本队车辆 */
	@RequestMapping("all")
	@ResponseBody
	public EasyUi SendAllBus(
			@RequestParam(value = "page", defaultValue = "1") Integer total,
			@RequestParam(value = "rows", defaultValue = "2") Integer rows,
			@RequestParam(value = "teamId", required = false) Integer teamId,
			@RequestParam(value = "serach1", required = false) String serach1,
			@RequestParam(value = "serach2", required = false) String serach2) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("DriverName", serach2);
		map.put("BusNumber", serach1);
		map.put("BusTeam", teamId);
		return this.busTeamService.getAllBus(total, rows, map);
	}

	/* 显示所有非本队车辆 */
	@RequestMapping("noall")
	@ResponseBody
	public EasyUi SendnoAllBus(
			@RequestParam(value = "page", defaultValue = "1") Integer total,
			@RequestParam(value = "rows", defaultValue = "2") Integer rows,
			@RequestParam(value = "teamId", required = false) Integer teamId,
			@RequestParam(value = "serach1", required = false) String serach1,
			@RequestParam(value = "serach2", required = false) String serach2,
			@RequestParam(value = "serach3", required = false) String serach3,
			@RequestParam(value = "serach4", required = false) String serach4) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("CompanyName", serach4);
		map.put("TeamName", serach3);
		map.put("DriverName", serach2);
		map.put("BusNumber", serach1);
		map.put("BusTeam", teamId);
		return this.busTeamService.getnoAllBus(total, rows, map);
	}

	/* 更改车队信息 */
	@RequestMapping("edit")
	@ResponseBody
	public Map<String, String> edit(@RequestParam("teamId") String teamId,
			@RequestParam("teamName") String teamName,
			@RequestParam("companyName") Integer companyName) {
		Map<String, String> map = new HashMap<String, String>();
		Integer integer = busTeamService.edit(teamId, teamName, companyName);
		if (integer == 1) {
			map.put("status", "200");
		} else {
			map.put("status", "500");
		}
		return map;
	}

	/* 导出 */
	@RequestMapping("chu/excel")
	public ModelAndView chu(
			@RequestParam(value = "page", defaultValue = "1") Integer page,
			@RequestParam(value = "rows", defaultValue = "5") Integer rows) {
		ModelAndView mv = new ModelAndView();
		List<Export> list = busTeamService.select();
		mv.addObject("list", list);
		mv.setViewName("UserExcelView");
		return mv;
	}

	/* 删除车队 */
	@RequestMapping("delect")
	@ResponseBody
	public Map<String, String> dele(@RequestParam("ids") List<Object> ids) {
		Map<String, String> map = new HashMap<String, String>();
		Integer integer = busTeamService.teamdelete(ids);
		if (integer == 0) {
			map.put("status", "200");
		} else {
			map.put("status", "500");
		}
		return map;
	}

	/* 插入新车队 */
	@RequestMapping("add")
	@ResponseBody
	public Map<String, String> cha(@RequestParam("teamName") String teamName,
			@RequestParam("companyName") Integer companyName,
			@RequestParam("lineName") Integer lineName) {
		Map<String, String> map = new HashMap<String, String>();
		Integer integer = busTeamService.userAdd(teamName, companyName,
				lineName);
		if (integer == 1) {
			map.put("status", "200");
		} else {
			map.put("status", "500");
		}
		return map;
	}

	/* 根据公司id查线路名 */
	@RequestMapping("Sendbusline")
	@ResponseBody
	public List<BusLine> cha(@RequestParam("companyId") Integer companyId) {
		return busTeamService.getbusline(companyId);
	}

	/* 根据id查车队名 */
	@RequestMapping("BusTeamByCompanyId")
	@ResponseBody
	public List<BusTeam> SendBusTeamByCompanyId(
			@RequestParam("companyId") Integer companyId) {
		return this.busTeamService.getTeamByCompanyId(companyId);
	}

}
