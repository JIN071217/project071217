package com.project.service;

import java.util.List;

import com.project.domain.CategoryVO;
import com.project.domain.ProductVO;
import com.project.dto.Criteria;

public interface AdProductService {

	// 1차 카테고리 리스트 조회
	List<CategoryVO> getCategoryList();
	// 2차 카테고리 리스트 조회
	List<CategoryVO> subCategoryList(Integer cat_code);

	//상품 등록
	void pro_insert(ProductVO vo);
	
	// 1)페이징 기능을 사용하여, 상품 리스트 조회
	public List<ProductVO> getListWithPaging(Criteria cri, Integer cat_code);  
	// 2)페이징 기능을 사용하여, 상품 총 개수 조회
	public int getTotalCount(Criteria cri, Integer cat_code);
	
	// 상품수정
	ProductVO modify(Integer pro_num);
	
	// 특정 카테고리 정보 조회
	CategoryVO get(int cat_code);
	
	// 상품 수정 업데이트
	void update(ProductVO vo);
	
	// 상품 삭제
	void delete(Integer pro_num);
	
	// 선택된 상품들의 정보 수정 (예 : 판매여부)
	void pro_checked_modify(List<ProductVO>pro_list);
	
	// 선택된 상품들 삭제
	void pro_checked_delete(List<Integer> pro_num_arr);
	
}
