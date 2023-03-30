package common;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

//공통적으로 쓸 파일 분리 : 모듈화
//파일 업로드할때마다 파일경로, 실제 파일이 달라짐

@Component
public class FileManager {

	
	public String upload(String savePath, MultipartFile file) {
		String filename = file.getOriginalFilename(); 
		
		//filename => test.txt => test			.txt 처럼 분리
		String onlyFilename = filename.substring(0, filename.lastIndexOf(".")); //뒤에서 부터 찾아서 .의 앞까지 잘라냄 -> test
		String extention = filename.substring(filename.lastIndexOf(".")); //. 부터 끝까지 잘라냄 -> .txt
		
		//실제 업로드할 파일명
		String filepath = null;
		//파일명 중복 시 뒤에 붙일 숫자
		int count = 0;
		while(true) { //중복이 아닐때 빠져올거임
			if(count == 0) {
				//첫번째 검증인 경우, 숫자를 붙이지 않음
				filepath = onlyFilename + extention;		//test.txt
			}else {
				filepath = onlyFilename+"_"+count+extention; 	//test_1.txt, test_2.txt 
			}
			File checkFile = new File(savePath+filepath);
			if(!checkFile.exists()) {  //exists : 존재하는지 물어봄
				break;
			}
			count++;
		}
		//파일명 중복체크 끝나는 지점 -> 업로드 파일명 확정 -> 파일 업로드
		
		//2-2. 중복처리가 끝난 파일 업로드
		try {
			FileOutputStream fos = new FileOutputStream(savePath+filepath);
			//보조스트림 -> 성능향상
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			
			//파일 업로드
			byte[] bytes = file.getBytes();
			bos.write(bytes);
			bos.close();
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return filepath;
	}
	
	
	//게시물 삭제시 업로드 파일도 삭제
	public boolean deleteFile(String savePath, String filepath) {
		File delFile = new File(savePath+filepath);
		return delFile.delete(); //성공 실패 여부 리턴 -> public boolean
	}
}





