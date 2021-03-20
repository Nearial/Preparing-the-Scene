package rest;

import DTOs.DepartmentDTO;
import DTOs.DepartmentsDTO;
import facades.DepartmentFacade;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.util.List;
import javax.persistence.EntityManagerFactory;
import javax.servlet.ServletContext;
import javax.ws.rs.core.Context;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import utils.EMF_Creator;

/**
 * @author Mathias
 */
@Path("department")
public class DepartmentResource {
    
    private static final EntityManagerFactory EMF = EMF_Creator.createEntityManagerFactory();
    private static final DepartmentFacade FACADE = DepartmentFacade.getDepartmentFacade(EMF);
    private static final Gson GSON = new GsonBuilder().setPrettyPrinting().create();

    @Context
    ServletContext context;

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAllDepartments() {
        DepartmentsDTO departments = FACADE.getAllDepartments();
        return Response.ok().entity(GSON.toJson(departments)).build();
    }
   
    
}
