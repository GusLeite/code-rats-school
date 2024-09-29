package com.coderatsschool.controllers;

import com.coderatsschool.dtos.AulaCreationDTO;
import com.coderatsschool.models.Aula;
import com.coderatsschool.services.AulaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/aulas")
public class AulaController {
    @Autowired
    AulaService service;

    @GetMapping
    public List<Aula> listAulas() {
        return service.getAllAulas();
    }

    @GetMapping("/{id}")
    public Aula getAulaById(@PathVariable long id) {
        return service.getAulaById(id);
    }

    @PostMapping
    public Aula createAula(@RequestBody Aula aula) {
        return service.createAula(aula);
    }

    @PutMapping
    public Aula updateAula(@RequestBody AulaCreationDTO data) {
        return service.updateAula(data);
    }

    @DeleteMapping("/{id}")
    public void deleteAula(@PathVariable long id) {
        service.deleteAula(id);
    }
}



