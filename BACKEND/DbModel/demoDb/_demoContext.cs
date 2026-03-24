using Microsoft.EntityFrameworkCore;
using Mvc.Api.DbModel;
using Pomelo.EntityFrameworkCore.MySql.Scaffolding.Internal;
using System;
using System.Collections.Generic;

namespace DbModel.demoDb;

public partial class _demoContext : DbContext
{
    public _demoContext()
    {
    }

    public _demoContext(DbContextOptions<_demoContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Auto> Auto { get; set; }
    public virtual DbSet<AutoMarca> AutoMarca { get; set; }

    // --- NUEVOS DBSETS ---
    public virtual DbSet<AutoTipo> AutoTipo { get; set; }
    public virtual DbSet<AutoCombustible> AutoCombustible { get; set; }
    // ---------------------
    public virtual DbSet<Usuario> Usuario { get; set; }

    public virtual DbSet<RegistroError> RegistroError { get; set; }
    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder.UseMySql("name=demoDb", Microsoft.EntityFrameworkCore.ServerVersion.Parse("8.0.45-mysql"));

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {

        modelBuilder.Entity<RegistroError>(entity =>
        {
            entity.ToTable("registroerror");
            entity.HasKey(e => e.Id).HasName("PRIMARY");
            entity.Property(e => e.Fecha).HasDefaultValueSql("CURRENT_TIMESTAMP");
        });
        modelBuilder
            .UseCollation("utf8mb4_0900_ai_ci")
            .HasCharSet("utf8mb4");

        modelBuilder.Entity<Auto>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PRIMARY");

            entity.Property(e => e.DateCreated).HasDefaultValueSql("CURRENT_TIMESTAMP");
            entity.Property(e => e.DateUpdate).ValueGeneratedOnAddOrUpdate();

            // Relación con Marca
            entity.HasOne<AutoMarca>()
                .WithMany()
                .HasForeignKey(d => d.IdMarca)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_auto_marca");

            // --- NUEVAS RELACIONES ---
            entity.HasOne<AutoTipo>()
                .WithMany()
                .HasForeignKey(d => d.IdTipo)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_auto_tipo");

            entity.HasOne<AutoCombustible>()
                .WithMany()
                .HasForeignKey(d => d.IdCombustible)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_auto_combustible");
            // -------------------------
        });

        modelBuilder.Entity<AutoMarca>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PRIMARY");

            entity.Property(e => e.DateCreated).HasDefaultValueSql("CURRENT_TIMESTAMP");
            entity.Property(e => e.DateUpdate).ValueGeneratedOnAddOrUpdate();
        });

        modelBuilder.Entity<AutoTipo>(entity =>
        {
            entity.ToTable("AutoTipo");
            entity.HasKey(e => e.Id).HasName("PRIMARY");
        });

        modelBuilder.Entity<AutoCombustible>(entity =>
        {
            entity.ToTable("AutoCombustible");
            entity.HasKey(e => e.Id).HasName("PRIMARY");
        });
        modelBuilder.Entity<Usuario>(entity =>
        {
            entity.ToTable("usuario");
            entity.HasKey(e => e.Id).HasName("PRIMARY");
        });
        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}