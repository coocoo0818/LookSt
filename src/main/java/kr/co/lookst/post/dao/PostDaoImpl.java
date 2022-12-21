package kr.co.lookst.post.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.lookst.main.domain.Product;
import kr.co.lookst.main.domain.SearchItem;
import kr.co.lookst.post.domain.OrderHistoryDto;
import kr.co.lookst.post.domain.OrderInfoDto;
import kr.co.lookst.post.domain.PostDto;
import kr.co.lookst.post.domain.Post_imgDto;
import kr.co.lookst.post.domain.ProdInfoDto;
import kr.co.lookst.post.domain.SearchItem_prdtList;
import kr.co.lookst.post.domain.TpostDto;
/*import kr.co.lookst.post.domain.OrderPagePrdtDto;*/
import kr.co.lookst.post.domain.post_com_tagDto;
import kr.co.lookst.post.domain.snsPrdtImgDto;
import kr.co.lookst.post.domain.sns_Main_ImgDto;
import kr.co.lookst.post.domain.sns_com_tagDto;
import kr.co.lookst.post.domain.snslist_infoDto;

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
		List<ProdInfoDto> list = session.selectList(namespace + "prod_info_list");		
		
		return list;
	}

	@Override
	public List<ProdInfoDto> postImgListCarousel(Integer post_no) throws Exception {
		return session.selectList(namespace + "postImgListCarousel", post_no);
	}

	@Override
	public List<snslist_infoDto> postImgListPrdt(Integer post_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + "postImgListPrdt", post_no);
	}


	@Override
	public List<PostDto> snscommentlist(Integer post_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + "snscommentlist", post_no);
	}


	@Override
	public List<post_com_tagDto> postComTaglist(Integer post_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + "postComTaglist", post_no);
	}


	@Override
	public List<sns_Main_ImgDto> snsmainimg(Integer post_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + "snsmainimg", post_no);
	}


	@Override
	public List<snsPrdtImgDto> snsPrdtImg(Integer post_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + "snsPrdtImg", post_no);
	}


	@Override 
	public List<sns_com_tagDto> snsComTag(Integer post_no) throws Exception { 
		// TODO Auto-generated method stub 
		return session.selectList(namespace + "snsComTag", post_no); 
	}


	@Override
	public List<TpostDto> postTotalList() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + "postTotalList");
	}


	/*
	 * @Override public List<OrderPagePrdtDto> orderPagePrdt(Integer product_no)
	 * throws Exception { // TODO Auto-generated method stub return
	 * session.selectList(namespace + "orderPagePrdt"); }
	 */


	
	 @Override 
	 public List<OrderInfoDto> orderInfo(Integer product_no) throws Exception { 
		 // TODO Auto-generated method stub return
		 System.out.println("dao :" + session.selectOne(namespace + "orderInfo", product_no));
		 return session.selectList(namespace + "orderInfo", product_no);
		 
	 }


/*	@Override
	public List<Product> shopListSearchResultPage(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + " shopListSearchResultPage", sc);
	} */


/*	@Override
	public int shopListSearchResultCnt(SearchItem_prdtList sc) throws Exception {
		return session.selectOne(namespace + "shopListSearchResultCnt", sc);
	} */

/*	@Override
	public List<Product> shopListSearchResultPage(SearchItem_prdtList sc) throws Exception {
		// TODO Auto-generated method stub
		return null;
	} */


/*	@Override
	public int shopListSearchResultCnt(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	} */


	@Override
	public int shopListCnt(SearchItem_prdtList sc) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + "shopListCnt", sc);
	}


	@Override
	public List<Product> shopListPage(SearchItem_prdtList sc) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + "shopListPage", sc);
	}


	@Override
	public List<OrderHistoryDto> orderHistory(String member_id) throws Exception {
		System.out.println(member_id);
		// TODO Auto-generated method stub
		return session.selectList(namespace + "orderHistory", member_id);
	}


	@Override
	public int prdtOrderDel(Integer prdt_order_no, String member_id) throws Exception {
		Map map = new HashMap();
		map.put("prdt_order_no", prdt_order_no);
		map.put("member_id", member_id);
		return session.delete(namespace + "prdtOrderDel", map);
	}



	/*
	 * @Override public orderFormPageDto orderFormpage(orderFormPageDto
	 * orderFormpage) throws Exception { // TODO Auto-generated method stub return
	 * null; }
	 */


	
	 



}
