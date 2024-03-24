package com.ebanking.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ebanking.entity.CurrentAccount;

@Repository("currentAccountRepository")
public interface CurrentAccountRepository extends JpaRepository<CurrentAccount, Long> {

}
