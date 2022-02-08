package com.example.project01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.project01.model.shop.DrugDAO;
import com.example.project01.model.shop.DrugDTO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	DrugDAO drugDao;

	@Override
	public List<DrugDTO> search_list(int start, int end, String search_option, String keyword) {
		return drugDao.search_list(start, end, search_option, keyword);
	}

	@Override
	public DrugDTO detail(int drug_code) {
		return drugDao.detail(drug_code);
	}

	@Transactional
	@Override
	public void update(DrugDTO dto) {
		drugDao.update(dto);
	}

	@Override
	public void delete(int drug_code) {
		drugDao.delete(drug_code);
	}

	@Transactional
	@Override
	public void insert(DrugDTO dto) {
		drugDao.insert(dto);
	}

	@Override
	public int count(String search_option, String keyword) {
		return drugDao.count(search_option, keyword);
	}

}
