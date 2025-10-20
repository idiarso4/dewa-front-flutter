package com.example.siswacrud.repository;

import com.example.siswacrud.model.Siswa;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface SiswaRepository extends JpaRepository<Siswa, Long> {
    Optional<Siswa> findByNim(String nim);
    boolean existsByNim(String nim);
}
