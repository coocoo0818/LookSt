package kr.co.lookst.reviewTest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.lookst.board.dao.BoardDao;
import kr.co.lookst.board.domain.BoardDto;
import kr.co.lookst.board.domain.ReviewDto;

public class ReviewDaoImpTest {

	@RunWith(SpringJUnit4ClassRunner.class)
	@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
	public class BoardDaoImpITest2 {

		@Autowired
		private BoardDao boardDao;

		@Test
		public void insertDummyDataTest() throws Exception {
			boardDao.deleteAll();

			for (int i = 1; i <= 250; i++) {
				/*
				 * ReviewDto reviewDto = new ReviewDto("Pioneering" + i, "Ready for Action" + i,
				 * "ezen"); boardDao.insert(reviewDto);
				 */

			}
		}
	}
}
