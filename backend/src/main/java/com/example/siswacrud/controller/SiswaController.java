package com.example.siswacrud.controller;

import com.example.siswacrud.model.Siswa;
import com.example.siswacrud.service.SiswaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/siswa")
@CrossOrigin(origins = "*")
public class SiswaController {
    
    @Autowired
    private SiswaService siswaService;
    
    @GetMapping
    public ResponseEntity<List<Siswa>> getAllSiswa() {
        return ResponseEntity.ok(siswaService.getAllSiswa());
    }
    
    @GetMapping("/{id}")
    public ResponseEntity<Siswa> getSiswaById(@PathVariable Long id) {
        return siswaService.getSiswaById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }
    
    @GetMapping("/nim/{nim}")
    public ResponseEntity<Siswa> getSiswaByNim(@PathVariable String nim) {
        return siswaService.getSiswaByNim(nim)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }
    
    @PostMapping
    public ResponseEntity<?> createSiswa(@RequestBody Siswa siswa) {
        try {
            Siswa createdSiswa = siswaService.createSiswa(siswa);
            return ResponseEntity.status(HttpStatus.CREATED).body(createdSiswa);
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
    
    @PutMapping("/{id}")
    public ResponseEntity<?> updateSiswa(@PathVariable Long id, @RequestBody Siswa siswaDetails) {
        try {
            Siswa updatedSiswa = siswaService.updateSiswa(id, siswaDetails);
            return ResponseEntity.ok(updatedSiswa);
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }
    
    @PutMapping("/nim/{nim}")
    public ResponseEntity<?> updateSiswaByNim(@PathVariable String nim, @RequestBody Siswa siswaDetails) {
        try {
            Siswa updatedSiswa = siswaService.updateSiswaByNim(nim, siswaDetails);
            return ResponseEntity.ok(updatedSiswa);
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }
    
    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteSiswa(@PathVariable Long id) {
        try {
            siswaService.deleteSiswa(id);
            return ResponseEntity.ok().build();
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }
    
    @DeleteMapping("/nim/{nim}")
    public ResponseEntity<?> deleteSiswaByNim(@PathVariable String nim) {
        try {
            siswaService.deleteSiswaByNim(nim);
            return ResponseEntity.ok().build();
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }
}
