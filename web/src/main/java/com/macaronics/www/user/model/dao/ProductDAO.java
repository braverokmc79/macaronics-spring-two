package com.macaronics.www.user.model.dao;

import java.util.List;

import com.macaronics.www.user.model.dto.ProductShopVO;

public interface ProductDAO {

	public List<ProductShopVO> productList(int start, int end, String search_option, String keyword)
			throws Exception;
	
	ProductShopVO detailProduct(Integer product_id);
	public void updateProduct(ProductShopVO vo);
	void deleteProduct(Integer product_id);
	
	
	//조회수 증가
	public void updateViewCount(Integer product_id);
	
	//첨부 파일
	public List<String> getAttach(Integer product_id) throws Exception;
	
	public int countArticle(String search_option, String keyword);

	public List<ProductShopVO> togetherRecommendProduct(Integer category_rno);

	public List<ProductShopVO> viewsBnoProduct(Integer category_bno);

	public List<ProductShopVO> viewsProduct();
	
}
