package facades;

import DTOs.DepartmentDTO;
import entities.Department;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

/**
 *
 * @author Nikolaj Larsen
 */
public class DepartmentFacade {

    private static EntityManagerFactory emf;
    private static DepartmentFacade instance;

    public DepartmentFacade() {
    }
    
    public static DepartmentFacade getDepartmentFacade(EntityManagerFactory _emf) {
        if (instance == null) {
            emf = _emf;
            instance = new DepartmentFacade();
        }

        return instance;
    }
    
    private EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
    
    public List<DepartmentDTO> getAllDepartments () {
        EntityManager em = getEntityManager();
        
        List<Department> departments;
        List<DepartmentDTO> departmentDTOs = new ArrayList<>();
        
        try{
            Query q = em.createNamedQuery("Department.getAll");
            departments = q.getResultList();
            
            for (Department department : departments) {
                departmentDTOs.add(new DepartmentDTO(department));
            }
            
            return departmentDTOs;
        } finally {
            em.close();
        }
        
    } 
}
