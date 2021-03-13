package DTOs;

import entities.Department;
import entities.Employee;
import entities.Project;
import java.util.List;

/**
 *
 * @author Nikolaj Larsen
 */
public class EmployeeDTO {
    
    private String firstName;
    private String lastName;
    private String email;
    private Department department;
    private List<Project> projects;

    public EmployeeDTO(Employee employee) {
        this.firstName = employee.getFirstName();
        this.lastName = employee.getLastName();
        this.email = employee.getEmail();
        this.department = employee.getDepartment();
        this.projects = employee.getProjects();
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getEmail() {
        return email;
    }

    public Department getDepartment() {
        return department;
    }

    public List<Project> getProjects() {
        return projects;
    }
    
}
