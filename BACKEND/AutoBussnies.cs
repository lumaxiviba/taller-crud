using Mvc.Api.DbModel;
using Mvc.Repository; 
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Mvc.Bussnies
{
    public class AutoBussnies : IAutoBussnies
    {
        private readonly IAutoRepository _autoRepository;

        public AutoBussnies(IAutoRepository autoRepository)
        {
            _autoRepository = autoRepository;
        }

        public async Task<List<Auto>> GetAllAutos() => await _autoRepository.GetAllAutos();
        public async Task<Auto> GetAutoById(int id) => await _autoRepository.GetAutoById(id);
        public async Task<int> InsertAuto(Auto auto) => await _autoRepository.InsertAuto(auto);
        public async Task<bool> UpdateAuto(Auto auto) => await _autoRepository.UpdateAuto(auto);
        public async Task<bool> DeleteAuto(int id) => await _autoRepository.DeleteAuto(id);
    }
}