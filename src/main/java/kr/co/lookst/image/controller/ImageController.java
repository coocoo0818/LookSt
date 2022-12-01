package kr.co.lookst.image.controller;


import kr.co.lookst.image.service.ImageService;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.net.MalformedURLException;

import org.springframework.core.io.UrlResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.net.MalformedURLException;

@RestController
@RequiredArgsConstructor
public class ImageController {

    private final ImageService service;


    /**
     * db에 저장된 url이 해당 controller 포맷에 맞게 설정되어있어서
     * 이 controller로 접근하게되면 이 컨트롤러가 실제 file이 저장된 위치를 탐색후 image데이터를 뿌려줌
     * @param filename
     * @param response
     * @return
     * @throws MalformedURLException
     */
    @GetMapping("/images/{filename:.+}")										// lookst/images/filename.jpg 형식으로 서버에서 불러올 수 있게 getMapping
    public ResponseEntity<Resource> getImage(@PathVariable String filename, HttpServletResponse response) throws MalformedURLException {
	    																		// 해당 파일(이미지 파일)의 길이를 헤더에 지정해주기 위해 Resource를 File로 읽어 저장해준다.
																		    	// ResponseEntity를 사용하기 위해서 응답 상태 코드, 응답 헤더, 응답 본문을 설정해줘야 한다.
        return ResponseEntity.ok()												// ok 200 상태 코드를 설정함.
                .contentType(MediaType.IMAGE_PNG) 								// 데이터 타입 이미지 - 렌더링 처리될 Content-Type 헤더를 지정하고 오타를 줄이기 위해 MediaType의 상수를 사용함
                .body(new UrlResource("file:" + service.getPath(filename)));	// 응답 본문 - 응답할 데이터( getpath = filePath+filename를 매개변수로 담아주면 ResponseEntity가 생성이 된다.
    }
}
