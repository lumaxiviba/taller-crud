using Mvc.Api.DbModel;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Mvc.Bussnies
{
    public interface IAutoMarcaBussnies
    {
        Task<List<AutoMarca>> GetAllMarcas();
    }
}