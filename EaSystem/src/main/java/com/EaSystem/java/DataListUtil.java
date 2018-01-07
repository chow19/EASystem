package com.EaSystem.java;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.EaSystem.java.HssCellGetValueUtil;

public class DataListUtil {
	
	public static List<Map<String, Integer>> getDataList(HSSFWorkbook hssfWorkbook, int linenum, List<String> dataKey){
		List<Map<String, Integer>> dataList = new ArrayList<>();
		Map<String, Integer> dataItem = null;
		HSSFCell hssfCell = null;
		for (int numSheet = 0; numSheet < hssfWorkbook.getNumberOfSheets(); numSheet++) {
			HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(numSheet);
			if (hssfSheet == null) {
				continue;
			}
			// 循环行Row
			rowTraversal: for (int rowNum = 1; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
				HSSFRow hssfRow = hssfSheet.getRow(rowNum);
				if (hssfRow == null) {
					continue ;
				}
				dataItem = new HashMap<>();
				// 循环列Cell
				for(int i=0;i<linenum;i++) {
					hssfCell = hssfRow.getCell(i);
					if (hssfCell == null) {
						continue rowTraversal;
					}
					dataItem.put(dataKey.get(i),(int)Float.parseFloat(HssCellGetValueUtil.getValue(hssfCell)));
				}
				
				dataList.add(dataItem);
			}
		}
		
		return dataList;
	}
}
