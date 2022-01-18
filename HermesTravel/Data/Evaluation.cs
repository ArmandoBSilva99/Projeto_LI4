namespace HermesTravel.Data;

public class Evaluation 
{
    public string comment {get; set;}

    public float stars {get; set;}

    public Evaluation(string comment, float stars)
    {
        this.comment = comment;
        this.stars = stars;
    }
}