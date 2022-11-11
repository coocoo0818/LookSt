package kr.co.lookst.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.lookst.main.dao.indexDao;
import kr.co.lookst.main.domain.Product;

@Service
public class indexServiceImpl implements indexService{

	@Autowired
	indexDao indexDao;
	
	@Override
	public List<Product> getnewProducts() throws Exception {
		return indexDao.newProducts();
	}

}
