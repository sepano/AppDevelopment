package blanc_essentials.blanc.activity;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;
import android.view.Menu;

import java.util.LinkedList;
import java.util.List;

import blanc_essentials.blanc.R;
import blanc_essentials.blanc.adapter.ProductsAdapter;
import blanc_essentials.blanc.objects.Product;

/**
 * Created by Tim on 1/6/2016.
 */

public class ProductsActivity extends AppCompatActivity {
    private RecyclerView mRecyclerView;
    private RecyclerView.Adapter mAdapter;
    private RecyclerView.LayoutManager mLayoutManager;
    private Toolbar mToolbar;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_products);
        mToolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(mToolbar);

        mRecyclerView = (RecyclerView) findViewById(R.id.recycler_view);
        mRecyclerView.setHasFixedSize(false);
        mLayoutManager = new LinearLayoutManager(this);
        mRecyclerView.setLayoutManager(mLayoutManager);
        mRecyclerView.setAdapter(mAdapter);
        loadProducts("test");
    }


    public void loadProducts(String id) {
        /// call api
        List<Product> products = new LinkedList<>();
        Product p = new Product("Shirt", "img/src");
        Product p2 = new Product("Broek", "img/src");
        products.add(p);
        products.add(p2);
        products.add(p);
        mRecyclerView.swapAdapter(new ProductsAdapter(products), true);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        return true;
    }


}
