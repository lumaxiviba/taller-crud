using DbModel.demoDb;
using Microsoft.EntityFrameworkCore;
using Mvc.Api.DbModel;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Mvc.Repository
{
    public class AutoMarcaRepository : IAutoMarcaRepository
    {
        private readonly _demoContext _context;

        public AutoMarcaRepository(_demoContext context)
        {
            _context = context;
        }

        public async Task<List<AutoMarca>> GetAllMarcas()
        {
            return await _context.AutoMarca.ToListAsync();
        }
    }
}