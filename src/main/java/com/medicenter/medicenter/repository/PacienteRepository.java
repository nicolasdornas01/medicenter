package com.medicenter.medicenter.repository;

import com.medicenter.medicenter.model.Paciente;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PacienteRepository extends JpaRepository<Paciente, Integer> {

}