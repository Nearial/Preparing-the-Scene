package facades;

import DTOs.DepartmentDTO;
import DTOs.EmployeeDTO;
import DTOs.EmployeesDTO;
import entities.Department;
import entities.Employee;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

/**
 *
 * @author Nikolaj Larsen
 */
public class EmployeeFacade {

    private static EntityManagerFactory emf;
    private static EmployeeFacade instance;

    public EmployeeFacade() {
    }

    public static EmployeeFacade getEmployeeFacade(EntityManagerFactory _emf) {
        if (instance == null) {
            emf = _emf;
            instance = new EmployeeFacade();
        }

        return instance;
    }

    private EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public EmployeesDTO getAllEmployees() {
        EntityManager em = getEntityManager();

        List<Employee> employees;
        EmployeesDTO employeeDTOs = new EmployeesDTO();

        try {
            Query q = em.createNamedQuery("Employee.getAll");
            employees = q.getResultList();

            for (Employee employee : employees) {
                employeeDTOs.addEmployee(new EmployeeDTO(employee));
            }

            return employeeDTOs;
        } finally {
            em.close();
        }

    }

}
