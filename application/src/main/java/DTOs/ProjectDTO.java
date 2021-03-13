package DTOs;

import entities.Employee;
import entities.Project;
import java.util.List;

/**
 *
 * @author Nikolaj Larsen
 */
public class ProjectDTO {
    
    private String title;
    private int duration;
    private List<Employee> employee;

    public ProjectDTO(Project project) {
        this.title = project.getTitle();
        this.duration = project.getDuration();
        this.employee = project.getEmployees();
    }

    public String getTitle() {
        return title;
    }

    public int getDuration() {
        return duration;
    }

    public List<Employee> getEmployee() {
        return employee;
    }
    
}
