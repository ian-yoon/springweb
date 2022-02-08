package com.example.project01.service;

import java.util.List;

import com.example.project01.model.shop.DrugDTO;

public interface BoardService {
	List<DrugDTO> search_list(int start, int end, String search_option, String keyword);

	DrugDTO detail(int drug_code);

	void update(DrugDTO dto);

	void delete(int drug_code);

	void insert(DrugDTO dto);
	
	int count(String search_option, String keyword);

}
