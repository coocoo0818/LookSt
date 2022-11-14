package kr.co.lookst.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.lookst.main.dao.indexDao;
import kr.co.lookst.main.domain.IndexDto;
import kr.co.lookst.main.domain.Prdt_Img;
import kr.co.lookst.main.domain.Product;
import kr.co.lookst.main.domain.StylePickDto;

@Service
public class indexServiceImpl implements indexService{

	@Autowired
	indexDao indexDao;

	@Override
	public List<IndexDto> getnewProductsInfo() throws Exception {
		return indexDao.newProductsInfo();
	}

	@Override
	public List<StylePickDto> getStylePicks() throws Exception {
		return indexDao.stylePick();
	}

}
