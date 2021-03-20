package DTOs;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Mathias
 */
public class EmployeesDTO {
    
    private List<EmployeeDTO> employees;

    public EmployeesDTO() {
        employees = new ArrayList<>();
    }

    public EmployeesDTO(List<EmployeeDTO> employee) {
        this.employees = employee;
    }

    public List<EmployeeDTO> getDepartments() {
        return employees;
    }
    
    public void addEmployee(EmployeeDTO dto){
        employees.add(dto);
    }

}
