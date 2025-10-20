package com.example.siswacrud.service;

import com.example.siswacrud.model.Siswa;
import com.example.siswacrud.repository.SiswaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class SiswaService {
    
    @Autowired
    private SiswaRepository siswaRepository;
    
    public List<Siswa> getAllSiswa() {
        return siswaRepository.findAll();
    }
    
    public Optional<Siswa> getSiswaById(Long id) {
        return siswaRepository.findById(id);
    }
    
    public Optional<Siswa> getSiswaByNim(String nim) {
        return siswaRepository.findByNim(nim);
    }
    
    public Siswa createSiswa(Siswa siswa) {
        // Line 30: Check if NIM already exists
        if (siswaRepository.existsByNim(siswa.getNim())) {
            throw new RuntimeException("NIM sudah terdaftar: " + siswa.getNim());
        }
        return siswaRepository.save(siswa);
    }
    
    public Siswa updateSiswa(Long id, Siswa siswaDetails) {
        Siswa siswa = siswaRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Siswa tidak ditemukan dengan id: " + id));
        
        siswa.setNama(siswaDetails.getNama());
        siswa.setJurusan(siswaDetails.getJurusan());
        siswa.setAlamat(siswaDetails.getAlamat());
        siswa.setEmail(siswaDetails.getEmail());
        siswa.setNoTelp(siswaDetails.getNoTelp());
        
        return siswaRepository.save(siswa);
    }
    
    public Siswa updateSiswaByNim(String nim, Siswa siswaDetails) {
        // Line 50, 51: Find by NIM and validate
        Siswa siswa = siswaRepository.findByNim(nim)
                .orElseThrow(() -> new RuntimeException("Siswa tidak ditemukan dengan NIM: " + nim));
        
        siswa.setNama(siswaDetails.getNama());
        siswa.setJurusan(siswaDetails.getJurusan());
        siswa.setAlamat(siswaDetails.getAlamat());
        siswa.setEmail(siswaDetails.getEmail());
        siswa.setNoTelp(siswaDetails.getNoTelp());
        
        return siswaRepository.save(siswa);
    }
    
    public void deleteSiswa(Long id) {
        // Line 62: Get NIM before deletion for logging
        Siswa siswa = siswaRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Siswa tidak ditemukan dengan id: " + id));
        System.out.println("Menghapus siswa dengan NIM: " + siswa.getNim());
        siswaRepository.deleteById(id);
    }
    
    public void deleteSiswaByNim(String nim) {
        Siswa siswa = siswaRepository.findByNim(nim)
                .orElseThrow(() -> new RuntimeException("Siswa tidak ditemukan dengan NIM: " + nim));
        siswaRepository.delete(siswa);
    }
}
