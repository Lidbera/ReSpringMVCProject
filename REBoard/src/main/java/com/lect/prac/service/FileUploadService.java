package com.lect.prac.service;

import java.io.File;
import java.io.FileOutputStream;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.multipart.MultipartFile;

import util.Log;

@Service
public class FileUploadService {
	static final String PATH = "/upload/";
	
	public String upload(MultipartFile file) {
		String rename = null;
		
		try {
			String filename = file.getOriginalFilename();
			String ext = filename.substring(filename.lastIndexOf("."), filename.length());
			rename = rename(ext);
			writeFile(file, rename);
		} catch (Exception e) {
			Log.info("board_write_upload_error: " + e.getMessage());
		}
		
		return PATH + rename;
	}
	
	String rename(String ext) {
		UUID rand = UUID.randomUUID();
		String name = String.format("%s%s", rand, ext);
		return name;
	}
	
	void writeFile(MultipartFile file, String name) {
		try {
			File folder = new File(PATH);
			if(!folder.exists()) folder.mkdir();
			byte[] data = file.getBytes();
			String path = PATH + name;
			FileOutputStream fos = new FileOutputStream(path);
			fos.write(data);
			fos.close();
		} catch(Exception e) {
			Log.info("board_write_upload_error2: " + e.getMessage());
		}
	}
}
