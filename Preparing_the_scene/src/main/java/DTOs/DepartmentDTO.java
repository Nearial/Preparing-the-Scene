package DTOs;

import Entity.Department;
import Entity.Employee;
import java.util.List;

/**
 *
 * @author Nikolaj Larsen
 */
public class DepartmentDTO {

    private String code;
    private String name;
    private String description;
    private List<Employee> employees;

    public DepartmentDTO(Department department) {
        this.code = department.getCode();
        this.name = department.getName();
        this.description = department.getDescription();
        this.employees = department.getEmployees();
    }

    public String getCode() {
        return code;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public List<Employee> getEmployees() {
        return employees;
    }

}
