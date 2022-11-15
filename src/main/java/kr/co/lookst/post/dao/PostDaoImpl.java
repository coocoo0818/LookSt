package kr.co.lookst.post.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.lookst.post.domain.Post_imgDto;
import kr.co.lookst.post.domain.ProdInfoDto;

@Repository
public class PostDaoImpl implements PostDao{

	@Autowired
	private SqlSession session;
	private static String namespace = "kr.co.lookst.post.dao.PostMapper.";
	
	@Override
	public List<Post_imgDto> post_listimg() throws Exception {
		return session.selectList(namespace + "post_img_list");
	}

	@Override
	public List<ProdInfoDto> prod_info() throws Exception {
		return session.selectList(namespace + "prod_info_list");
	}
}
