package DTOs;

import entities.Department;

/**
 *
 * @author Nikolaj Larsen
 */
public class DepartmentDTO {

    private String code;
    private String name;
    private String description;

    public DepartmentDTO(Department department) {
        this.code = department.getCode();
        this.name = department.getName();
        this.description = department.getDescription();
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

}
