package cn.ifxcode.bbs.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;

import cn.ifxcode.bbs.enumtype.FileEnum;
import cn.ifxcode.bbs.service.UserService;
import cn.ifxcode.bbs.utils.DateUtils;
import cn.ifxcode.bbs.utils.GetRemoteIpUtil;

public class BbsFile implements Serializable {

	private static final long serialVersionUID = 5275311641648211250L;

	private String uuid;
	private String fileName;
	private String fileLink;
	private int fileSign;
	private String fileType;
	private long fileSize;
	private long downCount;
	private long uid;
	private String nickname;
	private String uploadTime;
	private String uploadIp;

	public BbsFile() {
	}

	public BbsFile(String fileLink, FileEnum file, FileItem item, UserService service, HttpServletRequest request) {
		this.uuid = UUID.randomUUID().toString();
		this.fileName = item.getName();
		this.fileLink = fileLink;
		this.fileSign = file.getCode();
		this.fileType = item.getName().substring(item.getName().indexOf(".") + 1, item.getName().length());
		this.fileSize = item.getSize();
		this.downCount = 0;
		this.uid = service.getUserIdFromCookie(request);
		this.nickname = service.getNicknameFromCookie(request);
		this.uploadTime = DateUtils.dt14LongFormat(new Date());
		this.uploadIp = GetRemoteIpUtil.getRemoteIp(request);
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileLink() {
		return fileLink;
	}

	public void setFileLink(String fileLink) {
		this.fileLink = fileLink;
	}

	public int getFileSign() {
		return fileSign;
	}

	public void setFileSign(int fileSign) {
		this.fileSign = fileSign;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public long getUid() {
		return uid;
	}

	public void setUid(long uid) {
		this.uid = uid;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getUploadTime() {
		return DateUtils.dt14LongFormat(DateUtils.dt14FromStr(uploadTime));
	}

	public void setUploadTime(String uploadTime) {
		this.uploadTime = uploadTime;
	}

	public String getUploadIp() {
		return uploadIp;
	}

	public void setUploadIp(String uploadIp) {
		this.uploadIp = uploadIp;
	}

	public long getDownCount() {
		return downCount;
	}

	public void setDownCount(long downCount) {
		this.downCount = downCount;
	}

}
