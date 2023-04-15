package common;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import moo.ng.san.notice.model.vo.FileVO;



@Component
public class FileManager {
	
	public String upload(String savePath, MultipartFile file) {
		String filename = file.getOriginalFilename();
		//filename =>test.txt
		String onlyFilename = filename.substring(0, filename.lastIndexOf("."));//test
		String extention = filename.substring(filename.lastIndexOf("."));//.txt
		//실제 업로드할 파일명
		String filepath = null;
		//파일명이 중복됐을때 뒤에 붙일 숫자
		int count = 0;
		while(true) {
			if(count == 0) {
				//첫번째 검증인 경우 숫자붙이지 않음
				filepath = onlyFilename+extention;			//text.txt
			}else {
				filepath = onlyFilename+"_"+count+extention;//text_1.txt
			}
			File checkFile = new File(savePath+filepath);
			if(!checkFile.exists()) {
				break;
			}
			count++;
		}
		//파일명 중복체크 끝 -> 업로드파일명 확정 -> 파일업로드
		//2-2. 중복처리가 끝난 파일 업로드
		try {
			FileOutputStream fos = new FileOutputStream(savePath+filepath);
			//성능 향상을 위한 보조스트림 생성
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			//파일업로드
			byte[] bytes = file.getBytes();
			bos.write(bytes);
			bos.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return filepath;
	}
	public void download(FileVO file, HttpServletRequest request, HttpServletResponse response) {
		//파일경로
		String root = request.getSession().getServletContext().getRealPath("/resources/upload/notice/");
		String downFile = root + file.getFilepath();
		
		//파일을 읽어오기위한 주스트림생성(속도개선을위한 보조스트림생성)
		try {
			FileInputStream fis = new FileInputStream(downFile);
			BufferedInputStream bis = new BufferedInputStream(fis);
			//읽어온 파일을 사용자에게 내보낼 스트림생성
			ServletOutputStream sos = response.getOutputStream();
			BufferedOutputStream bos = new BufferedOutputStream(sos);
			
			//파일명 처리
			String resFilename = new String(file.getFileName().getBytes("UTF-8"), "ISO-8859-1");
			response.setContentType("application/octet-stream");//파일형식이란것을 알려줌
			response.setHeader("Content-Disposition", "attachment;filename="+resFilename);//파일이름을 알려줌
			//파일전송
			while(true) {
				int read = bis.read();
				//파일을 계속 읽다가 다읽으면 종료
				if(read != -1) {
					bos.write(read);
				}else {
					break;
				}
			}
			bos.close();
			bis.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}


	public boolean deleteFile(String savePath, String filepath) {
		File delFile = new File(savePath+filepath);
		return delFile.delete();
	}
}

