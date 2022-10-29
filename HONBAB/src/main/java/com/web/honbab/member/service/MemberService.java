package com.web.honbab.member.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.web.honbab.member.dto.MemberDTO;

public interface MemberService {
	public int user_check(HttpServletRequest request);
	public int bizuser_check(HttpServletRequest request);
	public void info(String id, Model model);
	public int register(MemberDTO member);

}
