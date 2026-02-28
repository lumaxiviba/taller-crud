using Mvc.Api.DbModel;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Mvc.Bussnies
{
    public interface IAutoBussnies
    {
        Task<List<Auto>> GetAllAutos();
        Task<Auto> GetAutoById(int id);
        Task<int> InsertAuto(Auto auto);
        Task<bool> UpdateAuto(Auto auto);
        Task<bool> DeleteAuto(int id);
    }
}