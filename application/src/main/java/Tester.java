
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
        Department d2 = new Department("Orne", "Ornen", "Orner");
        Employee e = new Employee("Ko", "Koen", "Ko@Koen.ko", d);
        Employee e2 = new Employee("So", "Soen", "So@Soen.So", d2);
        Project p = new Project("Spise græs", 100);
        
        try{
            em.getTransaction().begin();
            em.persist(d);
            em.persist(e);
            em.persist(d2);
            em.persist(e2);
            em.getTransaction().commit();
        } finally{
            em.close();
        }
    }

}
