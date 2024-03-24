package com.ebanking.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ebanking.entity.LoanAccount;

@Repository("loanAccountRepository")
public interface LoanAccountRepository extends JpaRepository<LoanAccount, Long>{

}
