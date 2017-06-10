package cn.ifxcode.bbs.utils;

import java.beans.PropertyDescriptor;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Method;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExcelUtils {

	public static final int HSSFROW_MAX_ROW = 65535;
	
	private static final DecimalFormat DF = new DecimalFormat("0.##");
	
    public static <T> void export(HttpServletResponse response, String[] header, String[] properties, String filename, List<T> list) throws Exception {
    	OutputStream os = response.getOutputStream();
    	Workbook workbook = null;
    	if (list.size() > HSSFROW_MAX_ROW) {
    		workbook = new SXSSFWorkbook(-1);
    	} else {
    		workbook = new HSSFWorkbook();
    	}
		CreationHelper createHelper = workbook.getCreationHelper();
		try {
			// 创建工作表
            Sheet sheet = workbook.createSheet("sheet1"); 
            // 产生表格标题行
            Row rowm = sheet.createRow(0);
            
            // 获取列头样式对象
            CellStyle columnTopStyle = getColumnTopStyle(workbook);
            // 单元格样式对象
            CellStyle style = getStyle(workbook); 
            
            for (int n = 0; n < header.length; n++) {
                Cell cellRowName = rowm.createCell(n); 
                cellRowName.setCellType(Cell.CELL_TYPE_STRING);
                cellRowName.setCellValue(createHelper.createRichTextString(header[n])); 
                cellRowName.setCellStyle(columnTopStyle); 
            }

            for (int i = 0; i < list.size(); i++) {
                T t = list.get(i);
                Row row = sheet.createRow(i + 1);
				for (int j = 0; j < header.length; j++) {
					Cell cell = row.createCell(j);
					PropertyDescriptor descriptor = new PropertyDescriptor(properties[j], t.getClass());
					Method method = descriptor.getReadMethod();
					Object value = method.invoke(t);
					if (value != null) {
						cell.setCellValue(value.toString());
					}
					cell.setCellStyle(style);
				}
            }
            
            // 让列宽随着导出的列长自动适应
            for (int colNum = 0; colNum < header.length; colNum++) {
                int columnWidth = sheet.getColumnWidth(colNum) / 256;
                for (int rowNum = 0; rowNum < sheet.getLastRowNum(); rowNum++) {
                    Row currentRow = null;
                    // 当前行未被使用过
                    if (sheet.getRow(rowNum) == null) {
                        currentRow = sheet.createRow(rowNum);
                    } else {
                        currentRow = sheet.getRow(rowNum);
                    }
                    if (currentRow.getCell(colNum) != null) {
                        Cell currentCell = currentRow.getCell(colNum);
                        if (currentCell.getCellType() == Cell.CELL_TYPE_STRING) {
                            int length = currentCell.getStringCellValue().getBytes().length;
                            if (columnWidth < length) {
                                columnWidth = length;
                            }
                        }
                    }
                }
                if (colNum == 0) {
                    sheet.setColumnWidth(colNum, (columnWidth - 2) * 256);
                } else {
                	columnWidth = columnWidth >= 180 ? 180 : columnWidth;
                    sheet.setColumnWidth(colNum, (columnWidth + 4) * 256);
                }
            }
            workbook.write(os);
            response.setHeader("Content-disposition", "attachment; filename=" + URLEncoder.encode(filename, "UTF-8"));
            response.setContentType("application/vnd.ms-excel;charset=utf-8");
            os.flush();
        } catch (Exception e) {
        	throw new Exception(e);
        } finally {
        	if (os != null) {
        		os.close();
        	}
        }
    }

    /*
     * 列头单元格样式
     */
    private static CellStyle getColumnTopStyle(Workbook workbook) {
        // 设置字体
        Font font = workbook.createFont();
        // 设置字体大小
        font.setFontHeightInPoints((short) 12);
        // 字体加粗
        font.setBoldweight(Font.BOLDWEIGHT_BOLD);
        // 设置字体名字
        font.setFontName("Consolas");
        // 设置样式;
        CellStyle style = workbook.createCellStyle();
        // 设置底边框;
        style.setBorderBottom(CellStyle.BORDER_THIN);
        // 设置底边框颜色;
        style.setBottomBorderColor(IndexedColors.BLACK.getIndex());;
        // 设置左边框;
        style.setBorderLeft(CellStyle.BORDER_THIN);
        // 设置左边框颜色;
        style.setLeftBorderColor(IndexedColors.BLACK.getIndex());
        // 设置右边框;
        style.setBorderRight(CellStyle.BORDER_THIN);
        // 设置右边框颜色;
        style.setRightBorderColor(IndexedColors.BLACK.getIndex());
        // 设置顶边框;
        style.setBorderTop(CellStyle.BORDER_THIN);
        // 设置顶边框颜色;
        style.setTopBorderColor(IndexedColors.BLACK.getIndex());
        // 在样式用应用设置的字体;
        style.setFont(font);
        // 设置自动换行;
        style.setWrapText(false);
        // 设置水平对齐的样式为居中对齐;
        style.setAlignment(CellStyle.ALIGN_CENTER);
        // 设置垂直对齐的样式为居中对齐;
        style.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
        return style;

    }

    /*
     * 列数据信息单元格样式
     */
    private static CellStyle getStyle(Workbook workbook) {
        // 设置字体
        Font font = workbook.createFont();
        font.setFontHeightInPoints((short) 12);
        // 设置字体名字
        font.setFontName("Consolas");
        // 设置样式;
        CellStyle style = workbook.createCellStyle();
        // 设置底边框;
        style.setBorderBottom(CellStyle.BORDER_THIN);
        // 设置底边框颜色;
        style.setBottomBorderColor(IndexedColors.BLACK.getIndex());
        // 设置左边框;
        style.setBorderLeft(CellStyle.BORDER_THIN);
        // 设置左边框颜色;
        style.setLeftBorderColor(IndexedColors.BLACK.getIndex());
        // 设置右边框;
        style.setBorderRight(CellStyle.BORDER_THIN);
        // 设置右边框颜色;
        style.setRightBorderColor(IndexedColors.BLACK.getIndex());
        // 设置顶边框;
        style.setBorderTop(CellStyle.BORDER_THIN);
        // 设置顶边框颜色;
        style.setTopBorderColor(IndexedColors.BLACK.getIndex());
        // 在样式用应用设置的字体;
        style.setFont(font);
        // 设置自动换行;
        style.setWrapText(false);
        // 设置水平对齐的样式为居中对齐;
        style.setAlignment(CellStyle.ALIGN_CENTER);
        // 设置垂直对齐的样式为居中对齐;
        style.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
        return style;
    }
	
    /**
     * 导入Excel, 转为实体对象
     * 
     * @param path   文件路径
     * @param clazz  实体类
     * @return
     */
	public static <T> List<T> loadExcel(String path, Class<T> clazz) {
		return loadExcel(path, clazz, false, null);
	}
	
	/**
	 * 导入Excel, 转为实体对象
	 * 
	 * @param path  文件路径
	 * @param clazz  实体类
	 * @param header_zh	 excel header是否是中文
	 * @param zhToEn  if header_zh is true, 提供中文对应实体类属性Map
	 * @return
	 */
	@SuppressWarnings({ "resource" })
	public static <T> List<T> loadExcel(String path, Class<T> clazz, boolean header_zh, Map<String, String> zhToEn) {
		if (path == null) {
			throw new RuntimeException("文件路径不能为空");
		}
		Workbook wb = null;
		InputStream is = null;
		File file = new File(path);
		if (!file.exists()) {
			throw new RuntimeException("找不到该文件");
		}
		String fileType = path.substring(path.lastIndexOf(".") + 1, path.length());
		List<T> list = new ArrayList<T>();
		try {
			is = new FileInputStream(file);
			if (Objects.equals("xls", fileType)) {
				wb = new HSSFWorkbook(is);
			} else if (Objects.equals("xlsx", fileType)){
				wb = new XSSFWorkbook(is);
			} else {
				throw new RuntimeException("文件不是Excel");
			}
			int sheetSize = wb.getNumberOfSheets();
			for (int i = 0; i < sheetSize; i++) {
				Sheet sheet =  wb.getSheetAt(i);
				List<String> title = new ArrayList<String>();
				int rowSize = sheet.getLastRowNum() + 1;
				System.out.println("row number: " + rowSize);
				for (int j = 0; j < rowSize; j++) {
					Row row = sheet.getRow(j);
					if (row == null) {
						continue;
					}
					int cellSize = row.getLastCellNum();
					if (j == 0) {
						for (int k = 0; k < cellSize; k++) {
							Cell cell = row.getCell(k);
							if (header_zh) {
								title.add(zhToEn.get(cell.toString()).toString());
							} else {
								title.add(cell.toString());
							}
						}
					} else {
						T t = clazz.newInstance();
						boolean notBlankRow = true;
						for (int k = 0; k < title.size() && notBlankRow; k++) {
							int cellType = row.getCell(k, Row.CREATE_NULL_AS_BLANK).getCellType();
							String cellValue = "";
							if (cellType == Cell.CELL_TYPE_NUMERIC) {
								cellValue = DF.format(row.getCell(k).getNumericCellValue());
							} else if (cellType == Cell.CELL_TYPE_STRING){
								cellValue = row.getCell(k).toString();
							} else {
								cellValue = row.getCell(k).toString();
							}
							//第一列不能为空
							if (k == 0  && StringUtils.isBlank(cellValue)) {
								k = title.size();
								notBlankRow = false;
								continue;
							}
							String type = clazz.getDeclaredField(title.get(k)).getType().getSimpleName();
							PropertyDescriptor descriptor = new PropertyDescriptor(title.get(k), clazz);
						    Method m = descriptor.getWriteMethod();
							if (Objects.equals(type, "int") || Objects.equals(type, "Integer")) {
						        m.invoke(t, new Object[]{Integer.parseInt(cellValue)});
							}
							if (Objects.equals(type, "String")) {
								m.invoke(t, new Object[]{cellValue});
							}
						}
						if (notBlankRow) {
							list.add(t);
						}
					}
				}
			}
		} catch (Exception e) {
			UploadUtils.delete(path);
			e.printStackTrace();
			throw new RuntimeException("读取Excel失败");
		}
		return list;
	}
	
}