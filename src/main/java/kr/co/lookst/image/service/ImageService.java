package kr.co.lookst.image.service;


import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import kr.co.lookst.board.domain.Board_imgDto;


@Service
public class ImageService {


    // 	properties로 받아도 된다.
	/*  java.util.Properties 클래스는 프로그램 설정정보를 개발코드에 불러오거나 새로운 정보를 추가, 수정, 저장 할 수 있게 해준다.
		Properties 클래스는 Hashtables의 하위 클래스이며, Hashtables를 상속 받았기 때문에(서브클래스) Map의 속성인 key와 values 를 String 형태로 가지고 있다. 
		또한 String 형태이기 때문에 get과 set, put 메서드를 제공함.  */


    ///이부분의 file path나 server path는 @Value로 분리해서 yml에서 관리하는것도 방법이니 한번찾아보세요

    private final static String filePath="C:"+ File.separator+"file"+ File.separator;					// 실제 이미지 파일이 있는 경로 c/file
    // 운영체제에 따라서 다른 파일구분자(‘\’, ‘/‘, ‘:’)를 사용하고 있는데, 이를 문자열로 처리하기 힘들기 때문에 filePath를 사용한다.
    // FilePath는 현재 읽고 있는(이미지 파일) 테이블 파일에 대한 전체 경로가 포함된 문자열을 반환하는 함수  
    // File.pathSeparator파일 경로 목록에서 개별 파일 경로를 구분하는 데 사용된다. 
    // Windows에서는 파일 경로를 구분하기 위해 File.pathSeparator 사용한다.
    private final static String serverPath = "/lookst/images/";	
    
    /**
     * 이미지 전체 path 리턴
     * @param filename 			 @Param 어노테이션을 붙이면 본인이 원하는 명으로 mapper에서 사용할 수 있다. / 파라미터가 두개일경우 마이바티스에서 인식을 못하기때문에 @param을 사용해야한다.
     * @return
     */
    public String getPath(String filename) { 
        System.out.println("filename = " + filename);
        return filePath+filename;		// 이미지 전체 path 리턴
    }


    public List<Board_imgDto> storeFile(List<MultipartFile> files,int board_no) throws IOException {
        File folder =new File(filePath);
        List<Board_imgDto> result = new ArrayList<>();
 
        if (!folder.exists()) {
        	// .exists() : 파일이 존재하는지 여부를 알 수 있는 함수로 반환결과가 boolean으로 파일이 존재하면 참, 없으면 거짓을 반환
            folder.mkdirs();
            // .mkdirs() : 프로그래밍 로직이 진행중에 만들고자 하는 Folder가
            // 			   존재하지 않을 경우에 폴디 직접 생성
        }

        int count=1;
        for (MultipartFile file : files) {
        	// MultipartFile는 사용자가 업로드한 File을
        	// 핸들러에서 손쉽게 다룰 수 있게 도와주는 매개변수 중 하나이다.
        	//MultipartFile 인터페이스는 스프링에서 업로드 한 파일을 표현할 때 사용되는 인터페이스.
        	//MultipartFile 인터페이스를 이용해서 업로드한 파일의 이름, 실제 데이터, 파일 크기 등을 구할 수 있다.
        	 
    
            if (file.isEmpty()) {
            // isEmpty는 해당 문자열이 빈 문자열이면 true를 반환한다. (null체크도 해주고, 길이가 0이 아닌지 체크)
                return null;
            }
            // 확장자 분리후 uuid 생성
            // uuid는 path에 함께 있어서 필요 없다.
            // 보통 다운로드 기능을 추가한다면 원본 name은 따로 저장해 uuid가 필요함.
            
            String uuid = createUUIDName();
            //uuid 같은경우는 path에 함께있어서 필요없음.
            String filenameExtension = StringUtils.getFilenameExtension(file.getOriginalFilename());
            // StringUtils : StringUtils 클래스만으로 거의 대부분의 문자열 처리를 수행하고 파라미터 값으로 null을 주더라도 절대 NullPointException을 발생시키지 않는다.
            // getFilenameExtension : 주어진 path로 부터 파일 확장자를 추출한다.
            String filename =uuid+"."+filenameExtension;
            file.transferTo(new File(getPath(filename)));
            // transferTo()의 파라미터로는 java.io.File의 객체를 지정하기 때문에
            // 업로드 되는 원래 파일의 이름을 C/upload/temp 로 임시로 지정 후 
            // 기존 이미지 파일로 지정해 둔 C/file로 저장 후 파일 정보 리스트를 리턴함
            result.add (new Board_imgDto(board_no, serverPath +filename,count++));
            // serverPath = "/lookst/images/";
        }
        return result;
    }

    public String createUUIDName() {
    	// UUID 클래스 import 후 uuid 클래스의 .randomUUID() 메소드를 사용해서 유일한 식별자를 생성
    	// 생성 후 반한ㄷ뇌는 객체가 uuid 객체이므로 문자열 표현을 얻기 위해 toString() 메소드를 출력.
        return UUID.randomUUID().toString();
    }
    //



}