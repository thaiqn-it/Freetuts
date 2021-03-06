package com.mockproject.freetutsproject.repository;

import com.mockproject.freetutsproject.dto.CategoryDTO;
import com.mockproject.freetutsproject.entity.CategoryEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CategoryRepository extends JpaRepository<CategoryEntity, Long>{
	List<CategoryEntity> findByParentIsNullAndAvailableTrue();
	CategoryEntity findOneByName(String name);
	List<CategoryEntity> findBySubCategoriesIsNullAndAvailableTrue();
	CategoryEntity findByIdAndAvailableTrue(Long id);
	List<CategoryEntity> findByParentId(long id);

}
