using Mvc.Api.DbModel;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Mvc.Repository
{
    public interface IAutoMarcaRepository
    {
        Task<List<AutoMarca>> GetAllMarcas();
    }
}