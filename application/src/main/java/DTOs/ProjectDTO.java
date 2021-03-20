package DTOs;

import entities.Employee;
import entities.Project;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Nikolaj Larsen
 */
public class ProjectDTO {
    
    private String title;
    private int duration;
    private List<EmployeeDTO> employees;

    public ProjectDTO(Project project) {
        this.title = project.getTitle();
        this.duration = project.getDuration();
        employees = new ArrayList();
        for(Employee employee : project.getEmployees()) {
            employees.add(new EmployeeDTO(employee));
        }
    }

    public String getTitle() {
        return title;
    }

    public int getDuration() {
        return duration;
    }

    public List<EmployeeDTO> getEmployee() {
        return employees;
    }
    
}
