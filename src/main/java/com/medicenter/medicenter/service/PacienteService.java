package com.medicenter.medicenter.service;

import com.medicenter.medicenter.model.Paciente;
import com.medicenter.medicenter.repository.PacienteRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PacienteService {

    private final PacienteRepository pacienteRepository;

    public PacienteService(PacienteRepository pacienteRepository) {
        this.pacienteRepository = pacienteRepository;
    }

    public List<Paciente> listarTodos() {
        return pacienteRepository.findAll();
    }

    public Paciente buscarPorId(Integer id) {
        return pacienteRepository.findById(id).orElse(null);
    }

    public void salvar(Paciente paciente) {
        pacienteRepository.save(paciente);
    }

    public void excluir(Integer id) {
        pacienteRepository.deleteById(id);
    }
}