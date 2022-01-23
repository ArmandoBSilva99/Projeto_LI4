using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HermesTravel.Data
{
    public class Admin
    {
        public string email { get; set; }

        public string password { get; set; }

        public List<InterestPoint> interestPoints = new List<InterestPoint>();

        public Admin(string email, string password, List<InterestPoint> points)
        {
            this.email = email;
            this.password = password;
            this.interestPoints = points;
        }

        public Admin()
        {
            this.email = "";
            this.password = "";
            this.interestPoints = new List<InterestPoint>();
        }

        public void buildAdmin (string email, string password, List<InterestPoint> points){
            this.email = email;
            this.password = password;
            foreach (var p in points){
                this.interestPoints.Add(p);
            }
        }

        public bool hasPoint(string s){
            foreach (var p in this.interestPoints){
                if(p.nome.Equals(s)){
                    return true;
                }
            }
            return false;
        }
    }
}