package kr.co.lookst;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.lookst.board.dao.MagazineDao;
import kr.co.lookst.board.domain.MagazineBoardVO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MagazineMapperTests {
	
	 private static final Logger log = LoggerFactory.getLogger(MagazineMapperTests.class);
	
	@Autowired
	private MagazineDao magazineDao;
	
	

     
     @Test
     public void testinsertM() {
    	 
    	 
    	 MagazineBoardVO magazine = new MagazineBoardVO("갱이", "안녕하세요", "반갑습니다", "Y", null, "M"); 
    	 
    	 
    	 magazineDao.magazineInsert(magazine);
    	 
    	 
    	 
     }
}
