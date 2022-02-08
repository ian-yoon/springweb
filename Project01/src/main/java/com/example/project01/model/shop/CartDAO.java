package com.example.project01.model.shop;

import java.util.List;

public interface CartDAO {
	List<CartDTO> cart_money();
	void insert(CartDTO dto);
	List<CartDTO> list(String userid);
	void delete(int cart_id);
	void delete_all(String userid);
	float sum_money(String userid);
	void modify(CartDTO dto);
}
