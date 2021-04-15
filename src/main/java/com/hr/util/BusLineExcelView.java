package com.hr.util;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.hr.pojo.Bus;
import com.hr.pojo.BusLine;

public class BusLineExcelView extends AbstractExcelView {

	@Override
	protected void buildExcelDocument(Map<String, Object> model,
			HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// 从model对象中获取userList
		@SuppressWarnings("unchecked")
		List<BusLine> list = (List<BusLine>) model.get("linelist");
		// 创建Excel的sheet
		HSSFSheet sheet = workbook.createSheet("线路信息表");

		// 创建标题行
		HSSFRow header = sheet.createRow(0);
		header.createCell(0).setCellValue("ID");
		header.createCell(1).setCellValue("线路名称");
		header.createCell(2).setCellValue("所属公司");
		header.createCell(3).setCellValue("线路状态");

		// 填充数据
		int rowNum = 1;
		for (BusLine busLine: list) {
			HSSFRow row = sheet.createRow(rowNum);
			row.createCell(0).setCellValue(busLine.getLineId());
			row.createCell(1).setCellValue(busLine.getLineName());
			row.createCell(2).setCellValue(busLine.getBusCompany().getCompanyName());
			String str = null;
			if(busLine.getLineStatus() == 0){
				str = "停运";
			}else{
				str = "在运";
			}
			row.createCell(3).setCellValue(str);
			rowNum++;
		}
		// 设置相应头信息，以附件形式下载并且指定文件名
		response.setHeader("Content-Disposition", "attachment;filename="
				+ new String("线路信息.xls".getBytes(),"iso-8859-1"));
	}

}
