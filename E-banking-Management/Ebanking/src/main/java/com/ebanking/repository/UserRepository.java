package com.ebanking.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ebanking.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long>{
	User findOneByUsername(String username);
}
