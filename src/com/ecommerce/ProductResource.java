package com.ecommerce;

import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.ecommerce.model.Product;
import com.ecommerce.service.ProductService;

@Path("/products")
public class ProductResource {
	@Path("{id}")
	@GET
    @Produces( { MediaType.APPLICATION_JSON }) //This provides only JSON responses
	public Response getProductById(@PathParam("id") int id) {
		Product p = ProductService.getProductById(id);
		if(p == null) {
            return Response.status(Response.Status.NOT_FOUND).build();        
		}
        return Response.ok().entity(p.getDetail_description() + " *** Please use the back button and refresh to go to the latest product page ***").build();
	}
	
	@POST
    @Consumes({MediaType.APPLICATION_FORM_URLENCODED}) //This method accepts form parameters.
	public Response addProductToCart(@FormParam("name") String name) {
		Product p = new Product();
        p.setName(name);

        System.out.println(p);

        if(ProductService.addProductToCart(p)) {
            return Response.ok().entity("Product Added Successfully. *** Please use the back button and refresh to go to the latest product page ***").build();
        }

        return Response.status(Response.Status.INTERNAL_SERVER_ERROR).build();

	}
	
	@PUT
	@Path("{id}")
    @Consumes({MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_JSON})
	public Response updateCart(@PathParam("id") int id, Product p) {
		Product retrievedProduct = ProductService.getProductById(id);
		
		if(retrievedProduct == null) {
            //If not found then respond with a 404 response.
            return Response.status(Response.Status.NOT_FOUND).entity("We could not find the requested resource").build();
        }
		
		p.setId(id);
		if(p.getName() == null) {
            p.setName(retrievedProduct.getName());
        }
		
		// ADD MORE THINGS ********************
        return Response.status(Response.Status.INTERNAL_SERVER_ERROR).build();

		
	}
	
}
