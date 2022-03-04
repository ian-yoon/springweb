package com.example.project01.model.shop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class DrugDAOImpl implements DrugDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<DrugDTO> search_list(int start, int end, String search_option, String keyword) {
		Map<String, Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("drug.search_list", map);
	}

	@Override
	public DrugDTO detail(int drug_code) {
		return sqlSession.selectOne("drug.detail", drug_code);
	}

	@Override
	public void update(DrugDTO dto) {
		System.out.println(dto);
		sqlSession.update("drug.update", dto);
	}

	@Override
	public void delete(int drug_code) {
		sqlSession.delete("drug.delete", drug_code);
	}

	@Override
	public void insert(DrugDTO dto) {
		sqlSession.insert("drug.insert", dto);
	}

	@Override
	public int count(String search_option, String keyword) {
		Map<String, Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		return sqlSession.selectOne("drug.count", map);
	}

	@Override
	public List<DrugDTO> list() {
		return sqlSession.selectList("drug.list");
	}

}
