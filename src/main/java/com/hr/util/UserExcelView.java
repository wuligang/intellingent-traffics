package com.hr.util;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.joda.time.DateTime;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.hr.pojo.BusTeam;
import com.hr.pojo.Export;

public class UserExcelView extends AbstractExcelView {

	@Override
	protected void buildExcelDocument(Map<String, Object> model,
			HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// 从model对象中获取userList
		@SuppressWarnings("unchecked")
		List<Export> list = (List<Export>) model.get("list");
		// 创建Excel的sheet
		HSSFSheet sheet = workbook.createSheet("车队信息表");

		// 创建标题行
		HSSFRow header = sheet.createRow(0);
		header.createCell(0).setCellValue("ID");
		header.createCell(1).setCellValue("车队名");
		header.createCell(2).setCellValue("公司名");
		header.createCell(3).setCellValue("线路名");

		// 填充数据
		int rowNum = 1;
		for (Export export : list) {
			HSSFRow row = sheet.createRow(rowNum);
			row.createCell(0).setCellValue(export.getTeamId());
			row.createCell(1).setCellValue(export.getTeamName());
			row.createCell(2).setCellValue(export.getCompanyName());
			row.createCell(3).setCellValue(export.getLineName());
			rowNum++;
		}
		// 设置相应头信息，以附件形式下载并且指定文件名
		response.setHeader("Content-Disposition", "attachment;filename="
				+ new String("车队信息表.xls".getBytes(), "ISO-8859-1"));
	}

}
