namespace HermesTravel.Data
{
    public class User
    {
        public string email { get; set; }

        public string password { get; set; }

        public string name { get; set; }
        
        public string avatar { get; set; }

        public int level { get; set; }

        public Boolean loggedIn { get; set; }

        public List<string> friends = new List<string>();

        public List<InterestPoint> suggestionsPoints = new List<InterestPoint>();

        public List<InterestPoint> favouritePoints = new List<InterestPoint>();

        public Dictionary<string, Route> routeHistory = new Dictionary<string, Route>();

        public User()
        {
            this.email = "";
            this.password = "";
            this.name = "";
            this.avatar = "";
        }

        public User(string email, string password, string name, string avatar, int level, bool loggedin)
        {
            this.email = email;
            this.password = password;
            this.name = name;
            this.avatar = avatar;
            this.level = level;
            this.loggedIn = loggedin;
            this.favouritePoints = new List<InterestPoint>();
            this.suggestionsPoints = new List<InterestPoint>();
            this.routeHistory = new Dictionary<string, Route>();
        }


        /*
        public User(string email, string password, string name)
        {
            this.email = email;
            this.password = password;
            this.name = name;
            this.avatar = "./images/InitialAvatar.png";
            this.level = 0;
            this.loggedIn = false;
        }*/

        public void buildUser(List<string> friends, List<InterestPoint> favouritePoints, List<InterestPoint> suggestionPoints, List<Route> routeHistory, User u)
        {
            foreach (var f in friends)
            {
                this.friends.Add(f);
            }

            foreach (var fp in favouritePoints)
            {
                this.favouritePoints.Add(fp);
            }

            foreach (var sp in suggestionPoints)
            {
                this.suggestionsPoints.Add(sp);
            }

            foreach (var rh in routeHistory)
            {
                this.routeHistory.Add(rh.routeName, rh);
            }

            this.email = u.email;
            this.password = u.password;
            this.name = u.name;
            this.avatar = u.avatar;
            this.level = u.level;
            this.loggedIn = u.loggedIn;
        }

        // Getters
        public List<string> getFriends()
        {
            return friends;
        }

        public List<InterestPoint> getFavouritePoints()
        {
            return favouritePoints;
        }

        public Dictionary<string, Route> getDRouteHistory()
        {
            return routeHistory;
        }

        // Setters
        public void setPassword(string password)
        {
            this.password = password;
        }

        public void setAvatar(string avatar)
        {
            this.avatar = avatar;
        }

        // Método: Sobe o nível do utilizador
        public void levelUP()
        {
            this.level = this.level + 1;
        }

        // Método: Adicionar amigo
        public void addFriend(string friend)
        {
            friends.Add(friend);
        }

        // Método: Remover amigo
        public Boolean deleteFriend(string friend)
        {
            return friends.Remove(friend);
        }

        // Método: Adicionar sugestão de ponto de interesse
        public void addSuggestionPoint(InterestPoint suggestionPoint)
        {
            suggestionsPoints.Add(suggestionPoint);
        }

        // Método: Adicionar ponto de interesse favorito
        public void addFavouritePoint(InterestPoint favouritePoint)
        {
            favouritePoints.Add(favouritePoint);
        }

        // Método: Remover ponto de interesse favorito
        public Boolean removeFavouritePoint(InterestPoint favouritePoint)
        {
            return favouritePoints.Remove(favouritePoint);
        }

        // Método: Adicionar rota ao histórico do utilizador
        public void addRoute(Route route)
        {
            routeHistory.Add(route.routeName, route);
        }

        // Método: Remover rota do histórico de rotas do utilizador
        public Boolean removeRouteHistory(string routeName)
        {
            return routeHistory.Remove(routeName);
        }

        // Método: Obter a lista com todas as rotas do histórico do utilizador
        public List<Route> getRouteHistory()
        {
            List<Route> routes = new List<Route>();
            foreach (var r in routeHistory)
                routes.Add(r.Value);
            return routes;
        }

        public (int,int) calculateLevel(){
            int xp = this.level;
            int base_xp = 1;
            int mult = 2;
            int currentLevel = 0;

            while(xp > 0){
                xp=xp-(base_xp*mult);
                currentLevel++;
                base_xp = base_xp*mult;
            }
            int percentage = 1-((-xp)/(base_xp/mult));
            
            return (currentLevel, percentage); // CurrentLevel, percentagem da barra
        }
    }
}