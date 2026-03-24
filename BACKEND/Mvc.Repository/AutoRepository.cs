using DbModel.demoDb;
using Microsoft.EntityFrameworkCore;
using Mvc.Api.DbModel;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Mvc.Repository
{
    public class AutoRepository : IAutoRepository
    {
        private readonly _demoContext _context;

        public AutoRepository(_demoContext context)
        {
            _context = context;
        }

        public async Task<List<Auto>> GetAllAutos()
        {
            return await _context.Auto.ToListAsync();
        }

        public async Task<Auto> GetAutoById(int id)
        {
            return await _context.Auto.FirstOrDefaultAsync(a => a.Id == id);
        }

        public async Task<int> InsertAuto(Auto auto)
        {
            auto.DateCreated = DateTime.Now;
            _context.Auto.Add(auto);
            await _context.SaveChangesAsync();
            return auto.Id;
        }

        public async Task<bool> UpdateAuto(Auto auto)
        {
            var autoExistente = await _context.Auto.FirstOrDefaultAsync(a => a.Id == auto.Id);
            if (autoExistente == null) return false;

            autoExistente.IdMarca = auto.IdMarca;
            autoExistente.Placa = auto.Placa;
            autoExistente.Modelo = auto.Modelo;
            autoExistente.Color = auto.Color;
            autoExistente.Anio = auto.Anio;

            // --- ESTO ES LO QUE FALTABA PARA QUE SE GUARDE ---
            autoExistente.IdTipo = auto.IdTipo;
            autoExistente.IdCombustible = auto.IdCombustible;
            // ------------------------------------------------

            autoExistente.UserUpdate = auto.UserUpdate;
            autoExistente.DateUpdate = DateTime.Now;

            _context.Auto.Update(autoExistente);
            var result = await _context.SaveChangesAsync();
            return result > 0;
        }
        public async Task<bool> DeleteAuto(int id)
        {
            var auto = await _context.Auto.FirstOrDefaultAsync(a => a.Id == id);
            if (auto == null) return false;

            _context.Auto.Remove(auto);
            var result = await _context.SaveChangesAsync();
            return result > 0;
        }
    }
}