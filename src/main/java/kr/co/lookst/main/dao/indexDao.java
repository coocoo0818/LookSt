package kr.co.lookst.main.dao;

import java.util.List;

import kr.co.lookst.main.domain.Product;

public interface indexDao {

	List<Product> newProducts() throws Exception;

}
