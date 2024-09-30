package com.coderatsschool.models;

import com.coderatsschool.dtos.AulaCreationDTO;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Data
@Entity
public class Aula {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String name;
    private String description;
    private String imgURL;

    public void updateData(AulaCreationDTO data){
        if (data.getName() != null) this.name = data.getName();
        if (data.getDescription() != null) this.description = data.getDescription();
        if (data.getImgURL() != null) this.imgURL = data.getImgURL();
    }
}
