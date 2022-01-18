namespace HermesTravel.Data;

public class InterestPoint
{
    public string name { get; set; }

    public string city { get; set; }

    public string description { get; set; }

    public string img {get; set;}
    public List<Evaluation> eval = new List<Evaluation>();

    public Coordinates coordinates;

    public List<string> categories = new List<string>();

    // Constructor
    public InterestPoint(string name, string city, string description, string img, List<Evaluation> eval, Coordinates coord, List<string> categories)
    {
        this.name = name;
        this.city = city;
        this.description = description;
        this.img = img;
        this.eval = eval;
        this.coordinates = coord;
        this.categories = categories;
    }
}