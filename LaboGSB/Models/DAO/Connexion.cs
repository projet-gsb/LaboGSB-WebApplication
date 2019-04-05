﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace LaboGSB.Models.DAO
{
   
    class Connexion
    {
        private static SqlConnection LaConnexion { get; set; } = null;
        public static SqlConnection GetInstance()
        {
            // Préparation de la connexion à la base de données
            if (LaConnexion == null)
            {   //ligne à decommenter en fonction de chaque poste
                string connectionString = "Data Source=NOMSERVER Initial Catalog = gsb-gestion; User Id = login; Password = mdp; ";//gaetan
                                                                                                                                   //string connectionString = "Data Source=NOMSERVER Initial Catalog = gsb-gestion; User Id = login; Password = mdp; ";//gael
                                                                                                                                   //string connectionString = "Data Source=NOMSERVER Initial Catalog = gsb-gestion; User Id = login; Password = mdp; ";//florent
                                                                                                                                   //string connectionString = "Data Source=NOMSERVER Initial Catalog = gsb-gestion; User Id = login; Password = mdp; ";//frederic
                                                                                                                                   //string connectionString = "Data Source=NOMSERVER Initial Catalog = gsb-gestion; User Id = login; Password = mdp; ";//clement
                                                                                                                                   //string connectionString = "Data Source=NOMSERVER Initial Catalog = gsb-gestion; User Id = login; Password = mdp; ";//maxime

                LaConnexion = new SqlConnection(connectionString);
                try
                {
                    // Connexion à la base de données
                    LaConnexion.Open();
                    Console.WriteLine("connecté");
                }
                catch (Exception ex)
                { Console.WriteLine("PROBLEME " + ex.Message); }
            }
            return LaConnexion;
        }
        private Connexion() { }

    }
}