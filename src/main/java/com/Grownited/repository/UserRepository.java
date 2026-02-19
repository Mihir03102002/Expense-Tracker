package com.Grownited.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Grownited.entity.UserEntity;


//db query -> table?
@Repository
public interface UserRepository extends JpaRepository<UserEntity, Integer>{
	 
	//select * from users where email = :email
		Optional<UserEntity>  findByEmail(String email);
		
		List<UserEntity> findByRole(String role); //
	
}