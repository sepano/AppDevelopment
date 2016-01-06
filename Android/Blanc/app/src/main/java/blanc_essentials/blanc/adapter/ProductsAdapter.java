package blanc_essentials.blanc.adapter;

import android.content.Context;
import android.content.Intent;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.List;

import blanc_essentials.blanc.R;
import blanc_essentials.blanc.activity.ProductDetailActivity;
import blanc_essentials.blanc.objects.Product;

/**
 * Created by Tim on 1/6/2016.
 */
public class ProductsAdapter extends RecyclerView.Adapter<ProductsAdapter.ViewHolder> {
    public static Context context;

    public static ViewHolder createViewHolder(int view, ViewGroup parent) {
        context = parent.getContext();
        LayoutInflater inflater = LayoutInflater.from(parent.getContext());
        View v = inflater.inflate(view, parent, false);
        ViewHolder vh = new ViewHolder(v);
        return vh;
    }

    private List<Product> mDataset;

    public ProductsAdapter(List<Product> myDataset) {
        mDataset = myDataset;
    }

    @Override
    public int getItemViewType(int position) {
        return 0;
    }

    @Override
    public ProductsAdapter.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        return createViewHolder(R.layout.product_view, parent);
    }

    @Override
    public void onBindViewHolder(ViewHolder holder, int position) {

        final Product product = mDataset.get(position);
        holder.textViewTitle.setText(product.getName());
       // holder.imageView.setImageBitmap();
        holder.linearLayout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(v.getContext(), ProductDetailActivity.class);
                intent.putExtra("ProductID", product.getId());
                v.getContext().startActivity(intent);
            }
        });
    }


    @Override
    public int getItemCount() {
        return mDataset.size();
    }

    public static class ViewHolder extends RecyclerView.ViewHolder {
        public TextView textViewTitle;
        public ImageView imageView;
    public LinearLayout linearLayout;
        public ViewHolder(View v) {
            super(v);
            textViewTitle = (TextView) v.findViewById(R.id.textViewTitle);
            linearLayout = (LinearLayout) v.findViewById(R.id.linearLayout);
            imageView = (ImageView) v.findViewById(R.id.imageView);
        }
    }

}