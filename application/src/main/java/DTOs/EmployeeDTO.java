package DTOs;

import entities.Employee;

/**
 *
 * @author Nikolaj Larsen
 */
public class EmployeeDTO {
    
    private String firstName;
    private String lastName;
    private String email;
    private DepartmentDTO department;

    public EmployeeDTO(Employee employee) {
        this.firstName = employee.getFirstName();
        this.lastName = employee.getLastName();
        this.email = employee.getEmail();
        department = new DepartmentDTO(employee.getDepartment());
       
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

    public DepartmentDTO getDepartment() {
        return department;
    }
    
}
