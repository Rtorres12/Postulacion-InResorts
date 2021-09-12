using Dapper;
using EjercicioTecnico_RodrigoTorres.BEAN;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace EjercicioTecnico_RodrigoTorres.DAO
{
    public class CarpetaDAO
    {
        private string connectionString;

        public CarpetaDAO()
        {
            connectionString = @"Data Source=DESKTOP-MS3MMN9;Initial Catalog=tareas;Integrated Security=True";

        }
        public IDbConnection Connection
        {
            get
            {
                return new SqlConnection(connectionString);
            }
        }

        public void addCarpeta(CarpetaBEAN carpeta)
        {
            using (IDbConnection dbConnection = Connection)
            {
                string squery = @"insert into carpeta (Nom_carpeta) values(@Nom_carpeta)";
                dbConnection.Open();
                dbConnection.Execute(squery, carpeta);


            }

        }
        public IEnumerable<CarpetaBEAN> getCarpeta()
        {
            using (IDbConnection dbConnection = Connection) {
                string squery = @"select * from carpeta";
                dbConnection.Open();
                return dbConnection.Query<CarpetaBEAN>(squery);
            }
        
        }

        public void DeleteCarpeta(int id)
        {
            using (IDbConnection dbConnection = Connection) {

                string squery = @"delete from carpeta where Id=@Id";
                dbConnection.Open();
                dbConnection.Execute(squery,new {Id = id });
            }

        }

        public void UpdateCarpeta(CarpetaBEAN carpetabean)
        {
            using (IDbConnection dbConnection = Connection)
            {
                string squery = @"update carpeta set Nom_carpeta=@Nom_carpeta where Id=@Id";
                dbConnection.Open();
                dbConnection.Query(squery, carpetabean);

            }
        }

        

        


    }
}
