package com.ebanking.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ebanking.entity.User;

@Repository("roleRepository")
public interface RoleRepository extends JpaRepository<User, Long> {

}
