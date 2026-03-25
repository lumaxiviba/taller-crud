using Microsoft.AspNetCore.Http;
using System;
using System.IO; 
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
            context.Request.EnableBuffering();

            try
            {
                await _next(context);
            }
            catch (Exception ex)
            {
                context.Request.Body.Position = 0;

                using var reader = new StreamReader(context.Request.Body, System.Text.Encoding.UTF8, true, 1024, true);
                var bodyRequest = await reader.ReadToEndAsync();

                var error = new RegistroError
                {
                    Mensaje = ex.Message,
                    Detalle = ex.StackTrace ?? "Sin detalle de la pila",
                    Ruta = context.Request.Path,
                    Fecha = DateTime.Now,
                    Payload = string.IsNullOrEmpty(bodyRequest) ? "Sin payload" : bodyRequest
                };

                dbContext.Add(error);
                await dbContext.SaveChangesAsync();

                context.Response.ContentType = "application/json";
                context.Response.StatusCode = StatusCodes.Status500InternalServerError;

                var jsonResponse = JsonSerializer.Serialize(new
                {
                    mensaje = "Ocurrió un error en el servidor. El administrador ha sido notificado."
                });

                await context.Response.WriteAsync(jsonResponse);
            }
        }
    }
}