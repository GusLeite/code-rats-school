package com.coderatsschool.controllers;

import com.coderatsschool.dtos.CourseCreationDTO;
import com.coderatsschool.models.Course;
import com.coderatsschool.services.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/courses")
public class CourseController {
    @Autowired
    CourseService service;

    @GetMapping
    public List<Course> listCourses() {
        return service.getAllCourses();
    }

    @GetMapping("/{id}")
    public Course getCourseById(@PathVariable long id) {
        return service.getCourseById(id);
    }

    @PostMapping
    public Course createCourse(@RequestBody Course course) {
        return service.createCourse(course);
    }

    @PutMapping
    public Course updateCourse(@RequestBody CourseCreationDTO data) {
        return service.updateCourse(data);
    }

    @DeleteMapping("/{id}")
    public void deleteCourse(@PathVariable long id) {
        service.deleteCourse(id);
    }
}



