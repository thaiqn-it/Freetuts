package com.mockproject.freetutsproject.controller.admin;

import java.io.IOException;
import java.util.List;

import com.mockproject.freetutsproject.dto.CourseDTO;
import com.mockproject.freetutsproject.service.CategoryService;
import com.mockproject.freetutsproject.service.CourseService;
import com.mockproject.freetutsproject.util.CountUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller(value ="adminCourse")
public class CourseController {

    @Autowired
    private CountUtil<CourseDTO> countUtil;

    @Autowired
    private CourseService courseService;

    @Autowired
    private CategoryService categoryService;

    @PostMapping("/admin/course")
    public String createCourse(CourseDTO courseDTO){
        CourseDTO result = courseService.save(courseDTO);
        if (result != null) return "redirect:/admin/course?success";
        return "redirect:/admin/course?error";
    }

    @GetMapping(value = "/admin/course/{id}/{status}")
    public String updateCourseStatus(@PathVariable("status") boolean status,
                                     @PathVariable("id") Long id) {
        CourseDTO result = courseService.updateStatus(status, id);
        if (result != null) return "redirect:/admin/course?success";
        return "redirect:/admin/course?error";
    }

    @GetMapping (value = "/admin/course")
    public String loadAdminCourse(Model model) {
        List<CourseDTO> courses = courseService.findAll();
        model.addAttribute("courses", courses);
        model.addAttribute("COURSE_DTO",new CourseDTO());
        model.addAttribute("COURSE_CATEGORIES", categoryService.findCategory("Khóa học").getSubCategories());
        
        model.addAttribute("AVAILABLE", countUtil.countAvailable(courses));
        return "admin/admin-course";
    }

    @PostMapping("/admin/course/update")
    public String updateCourse(CourseDTO dto){
        CourseDTO result = null;
        try {
            result = courseService.updateCourse(dto);
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (result != null) return "redirect:/admin/course?success";
        return "redirect:/admin/course?error";
    }
}
