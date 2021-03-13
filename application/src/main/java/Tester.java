
import entities.Department;
import entities.Employee;
import entities.Project;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author Mathias
 */
public class Tester {
    
    public static void main(String[] args) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("pu");
        EntityManager em = emf.createEntityManager();
        Department d = new Department("Tyr", "Tyren", "Tyre");
        Employee e = new Employee("Ko", "Koen", "Ko@Koen.ko", d);
        Project p = new Project("Spise græs", 100);
        
        try{
            em.getTransaction().begin();
            em.persist(d);
            em.getTransaction().commit();
        } finally{
            em.close();
        }
    }

}
