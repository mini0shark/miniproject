package com.chinsa.miniproject.dto;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadDTO {
	private String path;
	private String fileName;
	private String CKEditorFuncNum;
	private MultipartFile upload;
	public String getPath() {
		return path;
	}
	public String getCKEditorFuncNum() {
		return CKEditorFuncNum;
	}
	public void setCKEditorFuncNum(String cKEditorFuncNum) {
		CKEditorFuncNum = cKEditorFuncNum;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	
	
}
