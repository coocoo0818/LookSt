package kr.co.lookst.main.service;

import java.util.List;

import kr.co.lookst.main.domain.IndexDto;
import kr.co.lookst.main.domain.Prdt_Img;
import kr.co.lookst.main.domain.Product;

public interface indexService {

	List<IndexDto> getnewProductsInfo() throws Exception;
}
