package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.MemberVO;
import com.project.mapper.MemberMapper;

import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_ = {@Autowired})
	private MemberMapper memberMapper;

	@Override
	public String idCheck(String mbsp_id) {
		// TODO Auto-generated method stub
		return memberMapper.idCheck(mbsp_id);
	}

	@Override
	public void join(MemberVO vo) {
		
		memberMapper.join(vo);	
	}

	@Override
	public MemberVO login(String mbsp_id) {
		// TODO Auto-generated method stub
		return memberMapper.login(mbsp_id);
	}

	@Override
	public void modify(MemberVO vo) {
		
		memberMapper.modify(vo);
	}

	@Override
	public void pwchange(String mbsp_id, String new_mbsp_password) {
		
		memberMapper.pwchange(mbsp_id, new_mbsp_password);
	}

	@Override
	public void delete(String mbsp_id) {
		
		memberMapper.delete(mbsp_id);
	}
}
