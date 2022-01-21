namespace HermesTravel.Data
{
    public class Category 
    {
        public int id {get; set;}

        public String description {get; set;}

        public Category(int id, String description)
        {
            this.id = id;
            this.description = description;
        }
    }
}