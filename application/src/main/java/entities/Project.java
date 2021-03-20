package entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

/**
 *
 * @author Nikolaj Larsen
 */
@Entity
public class Project implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "p_id")
    private Long id;
    
    private String title;
    private int duration;
    
     @JoinTable(name = "projectToEmployee", joinColumns = {
        @JoinColumn(name = "p_id", referencedColumnName = "p_id")}, inverseJoinColumns = {
        @JoinColumn(name = "e_id", referencedColumnName = "e_id")})
    @ManyToMany (cascade = CascadeType.PERSIST)
    private List<Employee> employees = new ArrayList<>();
    
    public Project() {
    }

    public Project(String title, int duration) {
        this.title = title;
        this.duration = duration;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public List<Employee> getEmployees() {
        return employees;
    }

    public void setEmployees(List<Employee> employees) {
        this.employees = employees;
    }
    
    public void addEmployee(Employee employee){
        if(employee != null){
            employees.add(employee);
        }
    }
    
    /*
    public void addEmployee (Employee employee) {
        if(!employees.contains(employee)) {
            employees.add(employee);
            employee.getProjects().add(this);
        }
    }
    
    public void removeEmployee (Employee employee) {
        if(employees.contains(employee)) {
            employees.remove(employee);
            employee.getProjects().remove(this);
        }
    }
*/

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 31 * hash + Objects.hashCode(this.id);
        hash = 31 * hash + Objects.hashCode(this.title);
        hash = 31 * hash + this.duration;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Project other = (Project) obj;
        if (this.duration != other.duration) {
            return false;
        }
        if (!Objects.equals(this.title, other.title)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Project{" + "id=" + id + ", title=" + title + ", duration=" + duration + '}';
    }
    
}
