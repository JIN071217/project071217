package com.project.service;

import java.util.List;

import com.project.domain.CategoryVO;
import com.project.domain.ProductVO;
import com.project.dto.Criteria;

public interface ProductService {
	
	// 상위 1차 카테고리.
	List<CategoryVO> getCategoryList();
	
	// 하위 2차 카테고리
	List<CategoryVO> subCategoryList(Integer cat_code);
	
	// 상품목록
	// 카테고리 코드와 페이징/검색 조건에 따른 제품목록 반환
	List<ProductVO> pro_list(Integer cat_code, Criteria cri);
	
	// 상품갯수
	// 페이징/검색 조건에 따른 제품 총 개수 반환
	int pro_count(Integer cat_code, Criteria cri);
	
	// 상품 상세
	ProductVO pro_detail(Integer pro_num);

}
