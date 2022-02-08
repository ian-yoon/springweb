package com.example.project01.model.member;

public interface MemberDAO {
	String login(MemberDTO dto);
	public void insert(MemberDTO dto);

}
