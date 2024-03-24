package com.ebanking.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ebanking.entity.InterestRate;

@Repository("interestRateRepository")
public interface InterestRateRepository extends JpaRepository<InterestRate, Long> {

}
