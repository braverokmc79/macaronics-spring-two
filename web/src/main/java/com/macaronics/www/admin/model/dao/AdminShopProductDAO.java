package com.macaronics.www.admin.model.dao;

import java.util.List;

import com.macaronics.www.user.model.dto.ProductShopVO;

public interface AdminShopProductDAO {

	public void productInsert(ProductShopVO vo);
	
	//첨부파일
	public void addAttach(String fullName) throws Exception;
	
	//첨부파일 삭제 1
	public void delteAttachImg(String fullname);
	
	//첨부파일 삭제 2
	public void deleteAttach(Integer proudct_id) throws Exception;
	
	public void replaceAttach(String fullName, Integer product_id) throws Exception;
	
	//상품 목록
	public List<ProductShopVO> productList();

	
	// 상품 수정
	public void updateProduct(ProductShopVO vo);

	public int productOrederConfirm(Integer product_id);

	public void productDelete(Integer product_id);
	
	
}
