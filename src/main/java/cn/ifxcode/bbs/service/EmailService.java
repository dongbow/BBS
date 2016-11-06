package cn.ifxcode.bbs.service;

import java.io.File;

public interface EmailService {
	
	/**
	 * 发送带附件的邮件
	 * @param subject	邮件标题
	 * @param address	发送地址
	 * @param ccAddress	抄送地址
	 * @param msg		邮件内容
	 * @param fileList	附件
	 */
	public void sendMailAndFile(String subject, String[] address, String[] ccAddress, String msg, File[] fileList);
	
	/**
	 * 发送邮件
	 * @param subject	邮件标题
	 * @param address	发送地址
	 * @param ccAddress	抄送地址
	 * @param msg		邮件内容
	 */
	public void sendMail(String subject, String[] address, String[] ccAddress, String msg);
}
