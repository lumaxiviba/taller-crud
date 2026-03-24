using Mvc.Api.Middlewares;
using DbModel.demoDb;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Mvc.Bussnies;
using Mvc.Repository;
using System.Text;

var builder = WebApplication.CreateBuilder(args);

// 1. CORS: Una sola política clara
builder.Services.AddCors(options =>
{
    options.AddPolicy("PermitirAngular", policy =>
    {
        policy.WithOrigins("http://localhost:4200")
              .AllowAnyHeader()
              .AllowAnyMethod();
    });
});

// 2. JWT
builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
    .AddJwtBearer(options =>
    {
        options.TokenValidationParameters = new TokenValidationParameters
        {
            ValidateIssuer = true,
            ValidateAudience = true,
            ValidateLifetime = true,
            ValidateIssuerSigningKey = true,
            ValidIssuer = builder.Configuration["Jwt:Issuer"],
            ValidAudience = builder.Configuration["Jwt:Audience"],
            IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(builder.Configuration["Jwt:Key"]))
        };
    });

// 3. DB y Repositorios
builder.Services.AddDbContext<_demoContext>(options => {
    var connectionString = builder.Configuration.GetConnectionString("demoDb");
    options.UseMySql(connectionString, ServerVersion.AutoDetect(connectionString));
});

builder.Services.AddScoped<IAutoRepository, AutoRepository>();
builder.Services.AddScoped<IAutoMarcaRepository, AutoMarcaRepository>();
builder.Services.AddScoped<IAutoBussnies, AutoBussnies>();
builder.Services.AddScoped<IAutoMarcaBussnies, AutoMarcaBussnies>();

builder.Services.AddControllers();
//builder.Services.AddSwaggerGen();

var app = builder.Build();

// ORDEN CRÍTICO DE MIDDLEWARES
app.UseHttpsRedirection();
app.UseCors("PermitirAngular");
app.UseMiddleware<ErrorMiddleware>();
app.UseAuthentication();
app.UseAuthorization();
//app.UseSwagger();
//app.UseSwaggerUI();

app.MapControllers();
app.Run();