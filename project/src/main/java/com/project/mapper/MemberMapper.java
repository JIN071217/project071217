package com.project.mapper;

import org.apache.ibatis.annotations.Param;

import com.project.domain.MemberVO;

public interface MemberMapper {

	//회원가입
	void join(MemberVO vo);
	
	//아이디 중복체크 
	String idCheck(String mbsp_id);
	
	//로그인, 회원수정 
	MemberVO login(String mbsp_id);
	
	//회원 수정 
	void modify(MemberVO vo);
	
	//비밀번호 수정
	void pwchange(
			@Param("mbsp_id") String mbsp_id,
			@Param("new_mbsp_password") String new_mbsp_password);
	
	//회원 탈퇴(삭제)
	void delete(String mbsp_id);
}
