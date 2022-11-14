package kr.co.lookst.main.service;

import java.util.List;

import kr.co.lookst.main.domain.IndexDto;
import kr.co.lookst.main.domain.StylePickDto;

public interface indexService {

	List<IndexDto> getnewProductsInfo() throws Exception;
	List<StylePickDto> getStylePicks() throws Exception;
}
