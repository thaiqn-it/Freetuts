package com.mockproject.freetutsproject.dto;

import lombok.Data;

import java.util.List;

@Data
public class CategoryDTO extends AbstractDTO<CategoryDTO> {
	// Add more fields which use to show on frontend
	private String name;
	private String description;
	private String thumbnail;
	private Long parentId;
	private List<CategoryDTO> subCategories;
	private String creatorName;
	private Long creatorId;
	private List<PostDTO> posts;
	private List<CourseDTO> courses;
}