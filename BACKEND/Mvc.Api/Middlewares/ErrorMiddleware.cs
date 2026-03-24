using Microsoft.AspNetCore.Http;
using System;
using System.Text.Json;
using System.Threading.Tasks;
using DbModel.demoDb; 
using Mvc.Api.DbModel;

namespace Mvc.Api.Middlewares
{
    public class ErrorMiddleware
    {
        private readonly RequestDelegate _next;

        public ErrorMiddleware(RequestDelegate next)
        {
            _next = next;
        }

        public async Task InvokeAsync(HttpContext context, _demoContext dbContext)
        {
            try
            {
                await _next(context);
            }
            catch (Exception ex)
            {

                var error = new RegistroError
                {
                    Mensaje = ex.Message,
                    Detalle = ex.StackTrace ?? "Sin detalle de la pila",
                    Ruta = context.Request.Path,
                    Fecha = DateTime.Now
                };

                dbContext.RegistroError.Add(error);
                await dbContext.SaveChangesAsync(); // Se guarda en MySQL

                context.Response.ContentType = "application/json";
                context.Response.StatusCode = StatusCodes.Status500InternalServerError;

                var respuestaJson = JsonSerializer.Serialize(new
                {
                    mensaje = "Ocurrió un error interno en el servidor. El equipo técnico ya fue notificado."
                });

                await context.Response.WriteAsync(respuestaJson);
            }
        }
    }
}