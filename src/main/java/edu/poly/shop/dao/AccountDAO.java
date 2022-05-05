package edu.poly.shop.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import edu.poly.shop.entity.Account;

public interface AccountDAO extends JpaRepository<Account, String> {
	Page<Account> findAllByUsernameLike(String keywords, Pageable pageable);
	Account findByEmail(String email);
}
