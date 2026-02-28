using DbModel.demoDb;
using Microsoft.EntityFrameworkCore;

using Mvc.Repository;
using Mvc.Bussnies;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddDbContext<_demoContext>(options =>
{
    var connectionString = builder.Configuration.GetConnectionString("demoDb");
    options.UseMySql(connectionString, ServerVersion.AutoDetect(connectionString));
});

builder.Services.AddScoped<IAutoRepository, AutoRepository>();
builder.Services.AddScoped<IAutoMarcaRepository, AutoMarcaRepository>();

builder.Services.AddScoped<IAutoBussnies, AutoBussnies>();
builder.Services.AddScoped<IAutoMarcaBussnies, AutoMarcaBussnies>();

builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAll", policy =>
    {
        policy.AllowAnyOrigin()
              .AllowAnyMethod()
              .AllowAnyHeader();
    });
});

builder.Services.AddControllers();
builder.Services.AddOpenApi();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.MapOpenApi();
}

app.UseHttpsRedirection();

app.UseCors("AllowAll");

app.UseAuthorization();

app.MapControllers();

app.Run();