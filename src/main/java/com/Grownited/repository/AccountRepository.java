package com.Grownited.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Grownited.entity.AccountEntity;
import com.Grownited.entity.UserEntity;

@Repository
public interface AccountRepository extends JpaRepository<AccountEntity, Integer>{

	List<AccountEntity> findByUser(UserEntity user);

}
