package com.ebanking.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ebanking.entity.SavingAccount;

@Repository("savingAccountRepository")
public interface SavingAccountRepository extends JpaRepository<SavingAccount, Long>{

}
