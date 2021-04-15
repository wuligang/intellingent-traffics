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

public class BusExcelView extends AbstractExcelView {

	@Override
	protected void buildExcelDocument(Map<String, Object> model,
			HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// 从model对象中获取userList
		@SuppressWarnings("unchecked")
		List<Bus> list = (List<Bus>) model.get("busList");
		// 创建Excel的sheet
		HSSFSheet sheet = workbook.createSheet("车辆信息表");

		// 创建标题行
		HSSFRow header = sheet.createRow(0);
		header.createCell(0).setCellValue("ID");
		header.createCell(1).setCellValue("车牌号");
		header.createCell(2).setCellValue("所属公司");
		header.createCell(3).setCellValue("所属车队");
		header.createCell(4).setCellValue("司机姓名");
		header.createCell(5).setCellValue("司机电话");
		header.createCell(6).setCellValue("运行状态");

		// 填充数据
		int rowNum = 1;
		for (Bus bus: list) {
			HSSFRow row = sheet.createRow(rowNum);
			row.createCell(0).setCellValue(bus.getBusId());
			row.createCell(1).setCellValue(bus.getBusNumber());
			row.createCell(2).setCellValue(bus.getBusTeams().getBusCompanys().getCompanyName());
			row.createCell(3).setCellValue(bus.getBusTeams().getTeamName());
			row.createCell(4).setCellValue(bus.getBusDrivers().getDriverName());
			row.createCell(5).setCellValue(bus.getBusDrivers().getDriverPhone());
			String str = null;
			if(bus.getBusStatus() == 0){
				str = "停运";
			}else{
				str = "在运";
			}
			row.createCell(6).setCellValue(str);
			rowNum++;
		}
		// 设置相应头信息，以附件形式下载并且指定文件名
		response.setHeader("Content-Disposition", "attachment;filename="
				+ new String("车辆信息.xls".getBytes(),"iso-8859-1"));
	}

}
