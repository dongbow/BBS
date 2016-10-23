<%-- <%@ page language="java" import="java.io.*,sun.misc.*,java.util.*,java.text.*" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ page import="com.tsbbs.domain.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.tsbbs.util.UploadHeaderImgUtil" %>
<%
	String path = request.getRealPath("/");
	Date dateString = new Date();
	SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
	String dateUrl = format.format(dateString);
	String savePath = "tsbbs\\userhead\\"+dateUrl+"\\";  //保存图片路径 可以修改
	
    File file =new File("F:\\Tsbbs\\webapps\\Tsbbs\\tsbbs\\userhead\\"+dateUrl);    
    //如果文件夹不存在则创建    
    if (!file.exists() && !file.isDirectory()) {       
        System.out.println("//目录不存在，正在创建");  
        file.mkdirs();    
    } else {  
        System.out.println("//目录存在");  
    }
	
	String _savePath = path+savePath;
	System.out.println(_savePath);
	User user=(User)request.getSession().getAttribute("user");
	long picName = new Date().getTime();
  	int userid=user.getUser_id();
	
	String filename162 = _savePath +picName+ ".jpg";  //保存162

	String pic1=request.getParameter("pic1");
	
	//图162
	File file1 = new File(filename162);
	FileOutputStream fout1 = null;
	fout1 = new FileOutputStream(file1);
	fout1.write(new BASE64Decoder().decodeBuffer(pic1));
	fout1.close();
	
	String picUrl = savePath+picName;
	
	//存到数据库
	String url="tsbbs/userhead/"+dateUrl+"/"+picName+".jpg";
	UploadHeaderImgUtil.updateImg(userid, url);
	
	out.println("{\"status\":1,\"picUrl\":\""+picUrl+"\"}"); //返回图片地址

%> --%>