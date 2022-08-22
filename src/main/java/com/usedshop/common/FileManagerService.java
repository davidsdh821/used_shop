package com.usedshop.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component //controller, serivce, repository도 아닐때 범용적으로 사용할때 쓴다.
public class FileManagerService {
	public final static String FILE_UPLOAD_PATH = "C:\\SDH\\used_shop\\workspace\\images/"; //집에서 할 때는 집용으로 경로를 지정한 후 해줘야 한다
	//주소를 보면 workspace 안에 있는데, 깃허브에서 가져오지 못하게 하기 위함과 클론 했을때도 호환이 되겠끔 지정한 경로이다
	
	//input: MultipartFile, userLoginId(들어오는 것)
	//output: String path(사진이 저장된 주소)
	
	public String saveFile(String userLoginId , List<MultipartFile> files) {
		//A: sun.png, B: sun.png와 같이 파일명이 같이 들어오면 판별할 수 있겠끔 userLoginId와 현재 시간을 경로에 붙여준다.
		//디렉토리 경로 예: abc_213415151513/sun.png
		String directortyName = userLoginId + "_" + System.currentTimeMillis() + "/"; // abc_213415151513/ 이부분 까지 완성
		String filePath = FILE_UPLOAD_PATH + directortyName;
		//C:\SDH\spring_project\memo\workspace\images/abc_213415151513/ 까지 완성됨

		//디렉토리 생성(폴더)
		File directory = new File(filePath); //java io file로 선택.
		if (directory.mkdir() == false) {
			return null;
		}
		//파일 업로드: byte 단위로 업로드 한다.
		try {
			byte[] bytes = ((MultipartFile) files).getBytes();
			//파일명 정해주기
			//아래와 같이 해주면 사용자가 올린 파일 이름 그대로를 가져오는 방법이다.
			//filePath = 위에서 만든 주소, file.... 사용자가 올린 파일 이름
			Path path = Paths.get(filePath + ((MultipartFile) files).getOriginalFilename()); //파일명을 영어로 만들게 해줘야한다.
			//업로드
			Files.write(path, bytes); //이 경로에 바이트 단위로 업로드 한다라는 의미다
			
			//이미 업로드 성공시 Path를 리턴한다(주소), 즉 나중에 수정할 때 불러오는 사진은 이 주소로 불러오는 것이다
			//WebMvcConfig에서 매핑한 이미지 path
			//예: http://localhost/images/abc_213415151513/sun.png(이미지주소 복사의 주소가 이런 원리이다)
			
			return "/images/" + directortyName +((MultipartFile) files).getOriginalFilename(); //파일명은 Path랑 일치하게 만든다
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return null; //파일이 리턴되면 안되기 때문에 null
	}
	
	public void deleteFile(String imagePath) throws IOException {
		// /images/mrhong_1658478158330/default.jpg
		// C:\\SDH\\used_shop\\workspace\\images/ /images/mrhong_1658478158330/default.jpg
		// 전체 경로와 imagePath간의 중복되는 /images/ 문자열을 제거한 후 실제 저장 경로를 찾는다
		//imagePath의 /images/를 지운다
		imagePath.replace("/images/", ""); //제거함
		
		Path path = Paths.get(FILE_UPLOAD_PATH + imagePath);
		//폴더안의 사진 제거 후, 폴더 제거
		if(Files.exists(path)) { //이미지 파일이 있으면 삭제, == true를 붙여도 된다
			Files.delete(path);
			
		
			
		}
		//디렉토리를 삭제
		path = path.getParent(); //주소의 부모(폴더)를 path로 지정
		if(Files.exists(path)) {
			Files.delete(path);
		}
		
		
	}
	
	
}

