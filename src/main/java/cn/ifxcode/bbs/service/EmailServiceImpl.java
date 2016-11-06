package cn.ifxcode.bbs.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class EmailServiceImpl implements EmailService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private JavaMailSender javaMailSender;
	
	@Value("${email.username}")
	private String email;
	
	public void sendMailAndFile(String subject, String[] address, String[] ccAddress, String msg, File[] fileList) {
		
		logger.info("sendMailAndFile start...");
		MimeMessage mailMessage = javaMailSender.createMimeMessage();
		MimeMessageHelper messageHelper = null;
		try {
			messageHelper = new MimeMessageHelper(mailMessage, true, "UTF-8");
			if (address != null) {
				messageHelper.setTo(this.formatString(address));
			}
			if (ccAddress != null) {
				messageHelper.setCc(this.formatString(ccAddress));
			}
			messageHelper.setFrom(email);
			messageHelper.setSubject(subject);
			messageHelper.setText(new StringBuilder("<html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"></head></body>")
					.append(msg).append("</body></html>").toString(), true);
			if (null != fileList && fileList.length > 0) {
				for (File attachFile : fileList) {
					messageHelper.addAttachment(attachFile.getName(), attachFile);
				}
			} 
			javaMailSender.send(mailMessage);
			logger.info("sendMailAndFile end...");
		} catch (MessagingException e) {
			logger.error("sendMailAndFile happend...", e);
		}
		
	}

	public void sendMail(String subject, String[] address, String[] ccAddress, String msg) {

		logger.info("sendMail start...");
		MimeMessage mailMessage = javaMailSender.createMimeMessage();
		MimeMessageHelper messageHelper = null;
		try {
			messageHelper = new MimeMessageHelper(mailMessage, true, "UTF-8");
			if (address != null) {
				messageHelper.setTo(this.formatString(address));
			}
			if (ccAddress != null) {
				messageHelper.setCc(this.formatString(ccAddress));
			}
			messageHelper.setFrom(email);
			messageHelper.setSubject(subject);
			messageHelper.setText(new StringBuilder("<html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"></head></body>")
					.append(msg).append("</body></html>").toString(), true);
			javaMailSender.send(mailMessage);
			logger.info("sendMail end...");
		} catch (MessagingException e) {
			logger.error("sendMail happend...", e);
		}
		
	}
	
	private InternetAddress[] formatString(String... address) {
		InternetAddress[] internetAddresses = new InternetAddress[address.length];
		List<InternetAddress> list = new ArrayList<InternetAddress>(address.length);
		for (String str : address) {
			try {
				list.add(new InternetAddress(str));
			} catch (AddressException e) {
				e.printStackTrace();
			}
		}
		return list.toArray(internetAddresses);
	}

}
