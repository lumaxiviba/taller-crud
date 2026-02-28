using Mvc.Api.DbModel;
using Mvc.Repository;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Mvc.Bussnies
{
    public class AutoMarcaBussnies : IAutoMarcaBussnies
    {
        private readonly IAutoMarcaRepository _autoMarcaRepository;

        public AutoMarcaBussnies(IAutoMarcaRepository autoMarcaRepository)
        {
            _autoMarcaRepository = autoMarcaRepository;
        }

        public async Task<List<AutoMarca>> GetAllMarcas()
        {
            return await _autoMarcaRepository.GetAllMarcas();
        }
    }
}