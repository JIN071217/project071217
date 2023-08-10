package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.domain.CategoryVO;
import com.project.domain.ProductVO;
import com.project.dto.Criteria;

public interface AdProductMapper {

	// 1차 카테고리 작업 - 
	List<CategoryVO> getCategoryList();
	// 2차 카테고리 작업 - 
	List<CategoryVO> subCategoryList(Integer cat_code);
	
	//상품 등록
	void pro_insert(ProductVO vo);
	
	//페이징 기능 - 카테고리검색 null허용, integer로 null 으로 처리한다.
	//pageNum = 1, amount = 10, type=null, keyword=null 
	List<ProductVO> getListWithPaging(@Param("cri") Criteria cri, @Param("cat_code") Integer cat_code);
	
	int getTotalCount(@Param("cri") Criteria cri, @Param("cat_code") Integer cat_code);
	
	//상품수정
	ProductVO modify(Integer pro_num);
	
	CategoryVO get(int cat_code);
	
	//상품수정 업데이트
	void update(ProductVO vo);
	
	//상품삭제
	void delete(Integer pro_num);
	
	//선택상품 수정
	void pro_checked_modify(List<ProductVO>pro_list);
	
	//선택상품 삭제
	void pro_checked_delete(List<Integer> pro_num_arr);
}
