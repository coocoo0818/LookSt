//package kr.co.lookst.board.dao;
//
//import org.apache.ibatis.session.SqlSession;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Repository;
//
//import kr.co.lookst.board.domain.MagazineDto;
//
////@Repository
//public class MagazineDaoImpl implements MagazineDao {

//	
//	@Autowired
//	private SqlSession session;
//	private static String namespace = "kr.co.lookst.board.dao.MagazineMapper.";
//	@Override
//	public int insertM(MagazineDto dto) throws Exception {
//		return session.insert(namespace + "insertM", dto);
//	}
//}
