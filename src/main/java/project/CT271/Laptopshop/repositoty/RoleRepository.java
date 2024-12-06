package project.CT271.Laptopshop.repositoty;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import project.CT271.Laptopshop.domain.Role;

//crud: create, read, update, delete
@Repository
public interface RoleRepository extends JpaRepository<Role, Long> {
    Role findByName(String name);
}