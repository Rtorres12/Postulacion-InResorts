using EjercicioTecnico_RodrigoTorres.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using System.Data.SqlClient;

namespace EjercicioTecnico_RodrigoTorres.DAO
{
    public class TareaDAO
    {
        private string connectionString;

        public TareaDAO()
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
        public void addTarea(TareaBEAN tarea)
        {
            using (IDbConnection dbConnection = Connection)
            {
                string squery = @"insert into tarea (Id_carpeta,Nom_tarea,Descripcion,Estado) values(@Id_carpeta,@Nom_tarea,@Descripcion,'Pendiente')";
                dbConnection.Open();
                dbConnection.Execute(squery, tarea);


            }

        }
        public IEnumerable<TareaBEAN> getTareas()
        {
            using (IDbConnection dbConnection = Connection)
            {
                string squery = @"select * from tarea";
                dbConnection.Open();
                return dbConnection.Query<TareaBEAN>(squery);

            }


        
        }
        public void DeleteTarea(int id) {

            using (IDbConnection dbConnection = Connection)
            {
                string squery = @"delete from tarea where Id=@Id";
                dbConnection.Open();
                dbConnection.Execute(squery, new {Id=id});

            }
        
        }

        public void UpdateTarea(TareaBEAN tareabean)
        {
            using (IDbConnection dbConnection = Connection)
            {
                string squery = @"update tarea set Nom_tarea=@Nom_tarea, Descripcion=@Descripcion, Estado=@Estado  where Id=@Id";
                dbConnection.Open();
                dbConnection.Query(squery, tareabean);

            }
        }

        public IEnumerable<TareaBEAN> getByEstado(int id_carpeta,String estado) 
        {
            using (IDbConnection dbConnection = Connection)
            {

                string squery = @"EXEC SP_CARP_EST @idCarpeta,@estado";

                dbConnection.Open();
                return dbConnection.Query<TareaBEAN>(squery,new {idCarpeta=id_carpeta, estado=estado});

            }
        
        }
        public void UpdateEstado(TareaBEAN tareabean)
        {
            using (IDbConnection dbConnection = Connection)
            {
                string squery = @"update tarea set Estado=@Estado  where Id=@Id";
                dbConnection.Open();
                dbConnection.Query(squery, tareabean);

            }
        }

    }
}
