package com.coderatsschool.services;

import com.coderatsschool.dtos.AulaCreationDTO;
import com.coderatsschool.models.Aula;
import com.coderatsschool.repositories.AulaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AulaService {
    @Autowired
    AulaRepository repository;

    public List<Aula> getAllAulas() {
        return repository.findAll();
    }


    public Aula createAula(Aula aula) {
        return repository.save(aula);
    }
    public Aula getAulaById(Long id) {
        return repository.getReferenceById(id);
    }

    public Aula updateAula(AulaCreationDTO data) {
        Aula entityToBeUpdated = repository.getReferenceById(data.getId());
        entityToBeUpdated.updateData(data);
        return repository.save(entityToBeUpdated);
    }
    public void deleteAula(Long id) {
        repository.deleteById(id);
    }
}
