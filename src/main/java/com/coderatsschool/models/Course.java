package com.coderatsschool.models;

import com.coderatsschool.dtos.CourseCreationDTO;
import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.List;

@Data
@Entity(name = "courses")
public class Course {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @NotNull
    private String name;
    @NotNull
    private Double rating;
    @NotNull
    private Integer duration;
    private String description;
    private String imgURL;
    @OneToMany
    private List<Aula> aulas;

    public void updateData(CourseCreationDTO data){
        if (data.getDurationInHours() != 0) this.duration = data.getDurationInHours();
        if (data.getRating() != 0) this.rating = data.getRating();
        if (data.getName() != null) this.name = data.getName();
    }
}
