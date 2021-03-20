package DTOs;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Mathias
 */
public class DepartmentsDTO {
    
    private List<DepartmentDTO> departments;

    public DepartmentsDTO() {
        departments = new ArrayList<>();
    }

    public DepartmentsDTO(List<DepartmentDTO> departments) {
        this.departments = departments;
    }

    public List<DepartmentDTO> getDepartments() {
        return departments;
    }
    
    public void addDepartment(DepartmentDTO dto){
        departments.add(dto);
    }

}
