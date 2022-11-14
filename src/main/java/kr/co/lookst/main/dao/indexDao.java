package kr.co.lookst.main.dao;

import java.util.List;

import kr.co.lookst.main.domain.IndexDto;
import kr.co.lookst.main.domain.Prdt_Img;
import kr.co.lookst.main.domain.Product;
import kr.co.lookst.main.domain.StylePickDto;

public interface indexDao {

	List<IndexDto> newProductsInfo() throws Exception;
	List<StylePickDto> stylePick() throws Exception;

}
