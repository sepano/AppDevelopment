package blanc_essentials.blanc.objects;

/**
 * Created by Tim on 1/6/2016.
 */
public class Product {
    private String name;
    private String urlImg;
    private String id;

    public Product(String mName, String mUrlImg){
        name = mName;
        urlImg = mUrlImg;
    }

    public String getName(){
        return name;
    }
    public String getId(){
        return "1";
    }
}
