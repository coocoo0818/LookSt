package kr.co.lookst.image.service;


import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Service
public class ImageService {


    // 	properties로 받아도 된다.
	/*  java.util.Properties 클래스는 프로그램 설정정보를 개발코드에 불러오거나 새로운 정보를 추가, 수정, 저장 할 수 있게 해준다.
		Properties 클래스는 Hashtables의 하위 클래스이며, Hashtables를 상속 받았기 때문에(서브클래스) Map의 속성인 key와 values 를 String 형태로 가지고 있다. 
		또한 String 형태이기 때문에 get과 set, put 메서드를 제공함.  */
    private final static String filePath="C:"+ File.separator+"file"+ File.separator;					// 실제 이미지 파일이 있는 경로 c/file
    // 운영체제에 따라서 다른 파일구분자(‘\’, ‘/‘, ‘:’)를 사용하고 있는데, 이를 문자열로 처리하기 힘들기 때문에 filePath를 사용한다.
    // FilePath는 현재 읽고 있는(이미지 파일) 테이블 파일에 대한 전체 경로가 포함된 문자열을 반환하는 함수  
    // File.pathSeparator파일 경로 목록에서 개별 파일 경로를 구분하는 데 사용된다. 
    // Windows에서는 파일 경로를 구분하기 위해 File.pathSeparator 사용한다.
    
    
    /**
     * 이미지 전체 path 리턴
     * @param filename 			 @Param 어노테이션을 붙이면 본인이 원하는 명으로 mapper에서 사용할 수 있다. / 파라미터가 두개일경우 마이바티스에서 인식을 못하기때문에 @param을 사용해야한다.
     * @return
     */
    public String getPath(String filename) { 
        System.out.println("filename = " + filename);
        return filePath+filename;		// 이미지 전체 path 리턴
    }

   /* public FileDto storeFile(MultipartFile file) throws IOException {
        if (file.isEmpty()) {
            return null;
        }
        String originalFilename = file.getOriginalFilename();
        String storeFileName = createUUIDName();
        file.transferTo(new File(getPath(storeFileName)));
        return new FileDto(originalFilename,storeFileName);
    }

    public String createUUIDName() {
        return UUID.randomUUID().toString();
    }*/



}
