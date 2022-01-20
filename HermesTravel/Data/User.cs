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
        
        public User(string email, string password, string name)
        {
            this.email = email;
            this.password = password;
            this.name = name;
            this.avatar = "./images/InitialAvatar.png";
            this.level = 0;
            this.loggedIn = false;
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
    }
}