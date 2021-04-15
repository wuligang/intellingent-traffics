/**
 * 
 */
package com.hr.util;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.hr.pojo.BusStop;
import com.hr.pojo.Export;


/**
 *下午2:36:32
 *Administrator 
 * @author zjq
 * @date 下午2:36:32
 */
public class BusShopExcelView extends AbstractExcelView{

	/* 页面内容导出
	 */
	@Override
	protected void buildExcelDocument(Map<String, Object> model,
			HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
				// 从model对象中获取userList
				@SuppressWarnings("unchecked")
				List<BusStop> busStops = (List<BusStop>) model.get("busStops");
				// 创建Excel的sheet
				HSSFSheet sheet = workbook.createSheet("站点信息表");
				System.out.println("1345654321");
				// 创建标题行
				HSSFRow header = sheet.createRow(0);
				header.createCell(0).setCellValue("站点id");
				header.createCell(1).setCellValue("站点名称");
				header.createCell(2).setCellValue("所属区划-省");
				header.createCell(3).setCellValue("所属区划-市");
				header.createCell(4).setCellValue("所属区划-区县");
				header.createCell(5).setCellValue("状态");

				// 填充数据
				int rowNum = 1;
				for (BusStop busStop : busStops) {
					HSSFRow row = sheet.createRow(rowNum);
					row.createCell(0).setCellValue(busStop.getStopId());
					row.createCell(1).setCellValue(busStop.getStopName());
					row.createCell(2).setCellValue(busStop.getArea().getCity().getProvince().getProvince());
					row.createCell(3).setCellValue(busStop.getArea().getCity().getCity());
					row.createCell(4).setCellValue(busStop.getArea().getArea());
					row.createCell(5).setCellValue(busStop.getStopStatus());
					rowNum++;
				}
				// 设置相应头信息，以附件形式下载并且指定文件名
				response.setHeader("Content-Disposition", "attachment;filename=" + new String("站点信息.xls".getBytes(),"ISO-8859-1"));
			}
	}


