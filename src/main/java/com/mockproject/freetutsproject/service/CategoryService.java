package com.mockproject.freetutsproject.service;

import com.mockproject.freetutsproject.dto.CategoryDTO;

import java.util.List;

public interface CategoryService extends AbstractService<CategoryDTO> {
	List<CategoryDTO> loadTopLevelCategories();
	CategoryDTO findCategory(String name);
	List<CategoryDTO> findBySubCategoriesIsNull();
}
