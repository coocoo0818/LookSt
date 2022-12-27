package kr.co.lookst.board;

import static org.springframework.http.HttpStatus.OK;

import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.lookst.board.domain.BoardDto;
import kr.co.lookst.board.domain.Board_imgDto;
import kr.co.lookst.board.domain.MagazineSimpleDto;
import kr.co.lookst.board.domain.PrevAndNextDto;
import kr.co.lookst.board.domain.SearchItem;
import kr.co.lookst.board.domain.pageResolver;
import kr.co.lookst.board.domain.pageResolverN;
import kr.co.lookst.board.domain.pageResolverR;
import kr.co.lookst.board.service.BoardService;
import kr.co.lookst.image.service.ImageService;

@Controller
@RequestMapping("/board")
public class BoardController {

    @Autowired
    BoardService boardService;

    @Autowired
    ImageService imageService;

    @PostMapping("/modify")
    public String modify(BoardDto boardDto, Integer page, Integer pageSize, RedirectAttributes rattr, Model m,
        HttpSession session) {
        String member_id = (String)session.getAttribute("res");
        boardDto.setMember_id(member_id);
        System.out.println(member_id);
        System.out.println(boardDto);

        try {
            if (boardService.modify(boardDto) != 1)
                throw new Exception("Modify failed");

            rattr.addAttribute("page", page);
            rattr.addAttribute("pageSize", pageSize);
            rattr.addFlashAttribute("msg", "MOD_OK");

            return "redirect:/board/list/";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(boardDto); // 같은 문장 -> m.addAttribute("boardDto", boardDto);
            rattr.addAttribute("page", page);
            rattr.addAttribute("pageSize", pageSize);
            m.addAttribute("msg", "MOD_ERR");

            return "board/board"; // 수정등록하려던 내용을 보여줌
        }
    }

    @PostMapping("/write")
    public String write(BoardDto boardDto, RedirectAttributes rattr, Model m, HttpSession session) {
        String member_id = (String)session.getAttribute("res");
        System.out.println("member_id = " + member_id);
        boardDto.setMember_id(member_id);

        try {
            if (boardService.write(boardDto) != 1)
                throw new Exception("Write failed");

            rattr.addFlashAttribute("msg", "WRT_OK");
            return "redirect:/board/list/";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("mode", "new"); // 글쓰기 모드
            m.addAttribute("boardDto", boardDto); // 등록하려던 내용을 보여줘야 함 -> m.addAttribute(boardDto); // 동일한 문장
            m.addAttribute("msg", "WRT_ERR");
            return "board/board";
        }
    }

    @GetMapping("/write")
    public String write(Model m) {
        m.addAttribute("mode", "new");

        return "board/board"; // board.jsp 읽기와 쓰기에 사용. 쓰기에 사용할 때는 mode=new
    }

    @GetMapping("/writeN")
    public String writeN(Model m) {
        m.addAttribute("mode", "new");

        return "board/board"; // board.jsp 읽기와 쓰기에 사용. 쓰기에 사용할 때는 mode=new
    }

    @PostMapping("/remove")
    public String remove(Integer board_no, Integer page, Integer pageSize, RedirectAttributes rattr,
        HttpSession session) {
        String member_id = (String)session.getAttribute("res");
        String msg = "DEL_OK";

        try {
            if (boardService.remove(board_no, member_id) != 1)
                throw new Exception("Delete failed.");

        } catch (Exception e) {
            e.printStackTrace();
            msg = "DEL_ERR";
        }

        // 삭제 후 메시지가 한 번만 나와야 함. Model이 아닌 RedirectAttributes에 저장하면 메시지가 한 번만 나옴.
        // addFlashAttribute() : 한 번 저장하고 없어지는 것임. 세션에 잠깐 저장했다가 한 번 쓰고 지워버림. 세션에도 부담이
        // 덜함.
        rattr.addAttribute("page", page);
        rattr.addAttribute("pageSize", pageSize);
        rattr.addFlashAttribute("msg", msg);

        return "redirect:/board/list/";
    }

    @GetMapping("/read")
    public String read(Integer board_no, SearchItem sc, Model m) {
        try {
            BoardDto boardDto = boardService.read(board_no);
            m.addAttribute(boardDto); // 동일한 문장 -> m.addAttribute("boardDto", boardDto);

        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/board/list/";
        }

        return "board/board";
    }

    @GetMapping("/read/notice")
    public String readNoitce(@RequestParam("board_no") Integer board_no, SearchItem sc, Model m) {
        try {
            BoardDto boardDto = boardService.read(board_no);
            m.addAttribute(boardDto); // 동일한 문장 -> m.addAttribute("boardDto", boardDto);
            BoardDto o = boardService.movePage((board_no));
            System.out.println("o = " + o);
            m.addAttribute("move", o);

            // 현재글을 기준으로 다음글 이전글이 있는지 확인하고 VIEW로 전송
            //PrevAndNextDto pnDto=boardService.boardCheckPrevAndNext(board_no);
            //전송
            //m.addAttribute("prevAndNext",pnDto);
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/board/list/notice/";
        }

        return "board/post1";
    }

    @GetMapping("/list")
    public String listqna(SearchItem sc, Model m, HttpServletRequest request) {
        //		if(!loginCheck(request))
        //			return "redirect:/login?toURL="+request.getRequestURL();

        try {

            //			if (page==null) page=1;
            //			if (pageSize==null) pageSize=10;

            int totalCnt = boardService.getsearchResultCntQ(sc);
            m.addAttribute("totalCnt", totalCnt);
            System.out.println(totalCnt);
            pageResolver pageResolver = new pageResolver(totalCnt, sc);

            List<BoardDto> list = boardService.getsearchResultPage(sc);
            m.addAttribute("list", list);
            m.addAttribute("pr", pageResolver);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "board/boardqna"; // 로그인 한 상태, 게시판 목록 화면으로 이동
    }

    @GetMapping("/list/notice")
    public String listnotice(SearchItem sc, Model m, HttpServletRequest request) {
        //		if(!loginCheck(request))
        //			return "redirect:/login/login?toURL="+request.getRequestURL();

        try {

            //			if (page==null) page=1;
            //			if (pageSize==null) pageSize=10;

            int totalCntN = boardService.getsearchResultCntN(sc);
            m.addAttribute("totalCntN", totalCntN);
            pageResolverN pageResolverN = new pageResolverN(totalCntN, sc);

            List<BoardDto> list2 = boardService.getsearchResultPageNotice(sc);
            m.addAttribute("list2", list2);
            m.addAttribute("prN", pageResolverN);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "board/boardnotice"; // 로그인 한 상태, 게시판 목록 화면으로 이동
    }

    @GetMapping("/notice1")
    public String notice() {
        return "board/notice1";

    }

    @GetMapping("/list/faq")
    public String listFAQ() {
        return "board/boardfaq";
    }



    /*
     * @RequestMapping(value="/board/read/notice", method=RequestMethod.GET) public
     * String read(@ModelAttribute("sc") Integer board_no, SearchItem sc, BoardDto
     * boardDto, Model m) throws Exception {
     *
     * m.addAttribute("read", boardService.read(boardDto.getBoard_no()));
     * m.addAttribute("sc",sc);
     *
     * List<Map<String, Object>> fileList =
     * boardService.selectFileList(boardDto.getBoard_no()); m.addAttribute("file",
     * fileList); m.addAttribute("move",
     * boardService.movePage(boardDto.getBoard_no()));
     *
     * return "/board/post1"; }
     */

    @GetMapping("/post1")
    public String post() {
        return "board/post1";

    }




    /* 메거진 컨트롤러 */

    @GetMapping("/magazine")
    public String magazinelist(Model m, HttpServletRequest request) {
        try {

            // 인덱스가 0이상인것부터 5개 select
            List<MagazineSimpleDto> boardImgList = boardService.boardList(0);
            // 그 중 가장 마지막 index 반환
            Integer index = boardImgList.stream().max(Comparator.comparingInt(MagazineSimpleDto::getBoard_no))
                .map(MagazineSimpleDto::getBoard_no).get();
            // Stream.max 함수를 이용하고, 이 함수는 인자로 전달한 comparator 즉 객체를 비교할 수 있도록 만들어주는 인터페이스로,
            // 스트림의 데이터를 모두 비교하여 최대 값 1개를 리턴하는 방식을 가지고 있는 함수다.
            m.addAttribute("boardImgList", boardImgList);
            // last index 업데이트 ( 더 보기 + )
            m.addAttribute("lastIndex", index);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "board/magazinelist";
    }

    @ResponseBody
    @RequestMapping(value ="/magazine/scroll", method = RequestMethod.GET)
    public ResponseEntity<Map<String, Object>> magazinelistScroll(@RequestParam(defaultValue = "0") int lastIndex)
        throws Exception {
        // @RequestParam(defultValue = "0") - Http 요청 파라미터를 메서드의 파라미터로 전달 받을 때 사용한다.
        // defaultValue 속성을 이용해서 파라미터가 없을 경우 기본 값으로 설정하기 위해 0으로 사용함.
        // 개발시 url로 호출하여 json 객체로 원하는 정보(목록, 상세정보)받는 경우가 있다.(GET방식)
        // magazinelist 와 로직은 동일 ResponseBody를 이용해야 하기때문에 map 을 이용해서 response Entity로 반환
        // 비동기 통신을 위해 클라이언트에서 서버로 요청 메세지를 보낼 떄, 본문에 데이터를 담아서 보내야 하고, 서버에서 클라이언트로 응답을 보낼
        // 때에도 본문에 데이터를 담아서 보내야한다.
        // 이 본문이 body이고, 응답 본문인 responseBody를 담아서 보내는 방식. (JSON 형식의 데이터를 주고 받을 때)
        // @ResponseBody 어노테이션을 사용하면 View를 따로 리턴하지 않고 Controller에서 직접 Data를 return 해줄 수도
        // 있다.
        List<MagazineSimpleDto> boardImgList = boardService.boardList(lastIndex);
        Integer index = lastIndex;
        if (boardImgList.size() > 0) {
            // Stream.max(Comparator) : 인자로 전달한 Comparator로 스트림의 데이터를 모두 비교하여 최대 값 1개를 리턴함.
            index = boardImgList.stream().max(Comparator.comparingInt(MagazineSimpleDto::getBoard_no))
                .map(MagazineSimpleDto::getBoard_no).get();
            System.out.println("index= " + index);
            // 불러 온 데이터들 중에 가장 큰 인덱스가 마지막일테니 stream max를 이용해서 마지막 인덱스를 추출함.
        }
        Map<String, Object> map = new HashMap<>();
        // HashMap - Map 컬렉션
        // Map은 인터페이스므로 Body를 직접 작성할 수 없음 추상메서드이기 때문에
        // HashMap은 Map 인터페이스를 구현했고, Map으로 선언할 경우, HashMap으로 선언할 때보다 가짓수가 많아지기 때문에 코드의
        // 유연성을 높이기위해 사용한다.
        map.put("data", boardImgList);
        map.put("lastIndex", index);
        return new ResponseEntity<>(map, OK);
    }

    @GetMapping("/read/magazine")
    public String readMagazine(Integer board_no, SearchItem sc, Model m) {

        try {
            BoardDto boardDtoM = boardService.read(board_no);
            List<String> images = boardService.boardImgList(board_no); // 해당 board_no 이미지 데이터 select
            m.addAttribute(boardDtoM);
            // Collection 객체(List, Map) images 이미지 데이터를 불러온다.
            m.addAttribute("images", images);
            // 매거진 이전 글, 다음 글 버튼
            BoardDto dtoM = boardService.movePageM((board_no));
            System.out.println("o = " + dtoM);
            m.addAttribute("moveM", dtoM);

        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/board/magazine/";
        }

        return "board/magazineview";
    }

    @PostMapping("/magazine/write")
    // RequestParam으로 files value(String) 값으로 http 요청 파라미터를 매핑함
    public String writeM(BoardDto boardDto, @RequestParam(value = "files") List<MultipartFile> files,
        RedirectAttributes rattr, Model m, HttpSession session) {
        String member_id = (String)session.getAttribute("res");
        System.out.println("member_id = " + member_id);
        boardDto.setMember_id(member_id);
        try {
            if (boardService.wirteM(boardDto) != 1)
                throw new Exception("Write failed");
            // 매거진에서 작성할 글 중 이미지 첨부 파일을 6개 이하로 지정
            if (files.size() > 6) {					
                m.addAttribute("mode", "new");
                m.addAttribute("boardDto", boardDto);
                m.addAttribute("msg", "사진은 6개 이하만 업로드 가능합니다.");
                return "board/boardM";
            }
            // 첨부 파일(이미지)이 없을 경우에는 저장하지 않는다.
            if (files.size() > 0) {
                // 파일(이미지)이 있을 경우에만 저장함
                List<Board_imgDto> board_imgDtos = imageService.storeFile(files, boardDto.getBoard_no());
                boardService.insertBoardImages(board_imgDtos);
            }
            rattr.addFlashAttribute("msg", "WRT_OK");
            return "redirect:/board/magazine";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("mode", "new");
            m.addAttribute("boardDto", boardDto);
            m.addAttribute("msg", "WRT_ERR");
            return "board/boardM";
        }
    }

    @GetMapping("/magazine/write")
    public String writeM(Model m) {
        m.addAttribute("mode", "new");

        return "board/boardM"; // board.jsp 읽기와 쓰기에 사용. 쓰기에 사용할 때는 mode=new
    }

    // 게시물 수정 페이지로 이동
    @RequestMapping(value = "/magazine/modify", method = RequestMethod.GET)
    public String getmodifyM(int board_no, Model m) throws Exception {
        BoardDto boardDto = boardService.read(board_no);
        m.addAttribute("boardDto", boardDto);
        return "board/boardUpdateM";
    }





    // 게시글 수정 post
    @RequestMapping(value = "/magazine/modify", method = RequestMethod.POST)
    public String postmodifyM(BoardDto boardDto,@RequestParam(value = "files") List<MultipartFile> files, Model m,HttpSession session) throws Exception {
        String member_id = (String)session.getAttribute("res");
        boardDto.setMember_id(member_id);
        try {
            System.out.println(boardDto);
            boardService.modifyM(boardDto);
            if (files.size() > 7) {
                m.addAttribute("mode", "new");
                m.addAttribute("boardDto", boardDto);
                m.addAttribute("msg", "사진은 6개 이하만 업로드 가능합니다.");
                return "board/boardUpdateM";
            }

            if (files.size() > 0) {
                boardService.deleteImage(boardDto.getBoard_no());
                List<Board_imgDto> board_imgDtos = imageService.storeFile(files, boardDto.getBoard_no());
                boardService.insertBoardImages(board_imgDtos);
            }
            return "redirect:/board/magazine/";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("mode", "new");
            m.addAttribute("boardDto", boardDto);
            m.addAttribute("msg", "WRT_ERR");
            return "board/boardUpdateM";
        }



    }

    @PostMapping("/magazine/remove")
    public String removeM1(Integer board_no, Integer page, Integer pageSize, RedirectAttributes rattr,
        HttpSession session) {
        String member_id = (String)session.getAttribute("res");
        String msg = "DEL_OK";

        try {
            if (boardService.removeM(board_no, member_id) != 1)
                throw new Exception("Delete failed.");

        } catch (Exception e) {
            e.printStackTrace();
            msg = "DEL_ERR";
        }

        // 삭제 후 메시지가 한 번만 나와야 함. Model이 아닌 RedirectAttributes에 저장하면 메시지가 한 번만 나옴.
        // addFlashAttribute() : 한 번 저장하고 없어지는 것임. 세션에 잠깐 저장했다가 한 번 쓰고 지워버림. 세션에도 부담이
        // 덜함.
        rattr.addAttribute("page", page);
        rattr.addAttribute("pageSize", pageSize);
        rattr.addFlashAttribute("msg", msg);

        return "redirect:/board/magazine/";
    }

    /* 리뷰 컨트롤러 */

    @GetMapping("/review")
    public String reviewlist(SearchItem sc, Model m, HttpServletRequest request) {
        //		if(!loginCheck(request))
        //			return "redirect:/login/login?toURL="+request.getRequestURL();
        try {

            //			if (page==null) page=1;
            //			if (pageSize==null) pageSize=10;

            int totalCntR = boardService.getsearchResultCntR(sc);
            m.addAttribute("totalCntR", totalCntR);

            pageResolverR pageResolverR = new pageResolverR(totalCntR, sc);

            List<BoardDto> list4 = boardService.getsearchResultPageReview(sc);
            m.addAttribute("list4", list4);
            m.addAttribute("prR", pageResolverR);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "board/review"; // 로그인 한 상태, 리뷰게시판 목록 화면으로 이동
    }

    @GetMapping("/read/review")
    public String readReview(Integer board_no, SearchItem sc, Model m) {
        try {
            BoardDto boardDtoR = boardService.read(board_no);
            m.addAttribute(boardDtoR); // 동일한 문장 -> m.addAttribute("boardDto", boardDto);

        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/board/review/";
        }

        return "board/boardR";
    }

    @PostMapping("/review/modify")
    public String modifyR(BoardDto boardDto, Integer page, Integer pageSize, RedirectAttributes rattr, Model m,
        HttpSession session) {
        String member_id = (String)session.getAttribute("res");
        boardDto.setMember_id(member_id);
        System.out.println(member_id);
        System.out.println(boardDto);

        try {
            if (boardService.modifyR(boardDto) != 1)
                throw new Exception("Modify failed");
            rattr.addAttribute("page", page);
            rattr.addAttribute("pageSize", pageSize);
            rattr.addFlashAttribute("msg", "MOD_OK");

            return "redirect:/board/review/";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(boardDto); // 같은 문장 -> m.addAttribute("boardDto", boardDto);
            rattr.addAttribute("page", page);
            rattr.addAttribute("pageSize", pageSize);
            m.addAttribute("msg", "MOD_ERR");

            return "board/boardR"; // 수정등록하려던 내용을 보여줌
        }
    }

    @PostMapping("/review/write")
    public String writeR(BoardDto boardDto, RedirectAttributes rattr, Model m, HttpSession session) {
        String member_id = (String)session.getAttribute("res");
        System.out.println("member_id = " + member_id);
        boardDto.setMember_id(member_id);

        try {
            if (boardService.writeR(boardDto) != 1)
                throw new Exception("Write failed");

            rattr.addFlashAttribute("msg", "WRT_OK");
            return "redirect:/board/review/";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("mode", "new"); // 글쓰기 모드
            m.addAttribute("boardDto", boardDto); // 등록하려던 내용을 보여줘야 함 -> m.addAttribute(boardDto); // 동일한 문장
            m.addAttribute("msg", "WRT_ERR");
            return "board/boardR";
        }
    }

    @GetMapping("/review/write")
    public String writeR(Model m) {
        m.addAttribute("mode", "new");

        return "board/boardR"; // board.jsp 읽기와 쓰기에 사용. 쓰기에 사용할 때는 mode=new
    }

    @PostMapping("/review/remove")
    public String removeR(Integer board_no, Integer page, Integer pageSize, RedirectAttributes rattr,
        HttpSession session) {
        String member_id = (String)session.getAttribute("res");
        String msg = "DEL_OK";

        try {
            if (boardService.remove(board_no, member_id) != 1)
                throw new Exception("Delete failed.");

        } catch (Exception e) {
            e.printStackTrace();
            msg = "DEL_ERR";
        }

        // 삭제 후 메시지가 한 번만 나와야 함. Model이 아닌 RedirectAttributes에 저장하면 메시지가 한 번만 나옴.
        // addFlashAttribute() : 한 번 저장하고 없어지는 것임. 세션에 잠깐 저장했다가 한 번 쓰고 지워버림. 세션에도 부담이
        // 덜함.
        rattr.addAttribute("page", page);
        rattr.addAttribute("pageSize", pageSize);
        rattr.addFlashAttribute("msg", msg);

        return "redirect:/board/review/";
    }

    private boolean loginCheck(HttpServletRequest request) {
        // TODO Auto-generated method stub

        // 1. 세션을 얻어서
        HttpSession session = request.getSession(false); // false는 session이 없더라도 새로 생성하지 않는다. 반환 값 null
        // 2. 세션에 id가 있는지 확인, 있으면 true를 반환한다.
        return session != null && session.getAttribute("id") != null;
    }

    /*
     * @PostMapping(value = "/uploadSummernoteImageFile", produces =
     * "application/json")
     *
     * @ResponseBody public JsonObject
     * uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile)
     * {
     *
     * JsonObject jsonObject = new JsonObject();
     *
     * String fileRoot = "C:\\summernote_image\\"; // 저장될 외부 파일 경로 String
     * originalFileName = multipartFile.getOriginalFilename(); // 오리지날 파일명 String
     * extension = originalFileName.substring(originalFileName.lastIndexOf(".")); //
     * 파일 확장자
     *
     * String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명
     *
     * File targetFile = new File(fileRoot + savedFileName);
     *
     * try { InputStream fileStream = multipartFile.getInputStream();
     * FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
     * jsonObject.addProperty("url", "/summernoteImage/" + savedFileName);
     * jsonObject.addProperty("responseCode", "success");
     *
     * } catch (IOException e) { FileUtils.deleteQuietly(targetFile); // 저장된 파일 삭제
     * jsonObject.addProperty("responseCode", "error"); e.printStackTrace(); }
     *
     * return jsonObject; }
     */

}