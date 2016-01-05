package blanc_essentials.blanc;

import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.NavigationView;
import android.support.design.widget.Snackbar;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.TextView;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.ImageLoader;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.NetworkImageView;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONObject;

import java.util.UUID;

import blanc_essentials.blanc.api.MySingleton;
import oauth.signpost.OAuthConsumer;
import oauth.signpost.basic.DefaultOAuthConsumer;
import oauth.signpost.exception.OAuthCommunicationException;
import oauth.signpost.exception.OAuthExpectationFailedException;
import oauth.signpost.exception.OAuthMessageSignerException;

public class MainActivity extends AppCompatActivity
        implements NavigationView.OnNavigationItemSelectedListener {
    public final static String strikeIronUserName = "stikeironusername@yourdomain.com";
    public final static String strikeIronPassword = "strikeironpassword";
    public final static String apiURL = "http://blanc-essentials.com/..";
    private RequestQueue mRequestQueue;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Snackbar.make(view, "Replace with your own action", Snackbar.LENGTH_LONG)
                        .setAction("Action", null).show();
            }
        });

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        drawer.setDrawerListener(toggle);
        toggle.syncState();

        NavigationView navigationView = (NavigationView) findViewById(R.id.nav_view);
        navigationView.setNavigationItemSelectedListener(this);
    }

    @Override
    public void onBackPressed() {
        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        if (drawer.isDrawerOpen(GravityCompat.START)) {
            drawer.closeDrawer(GravityCompat.START);
        } else {
            super.onBackPressed();
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    @SuppressWarnings("StatementWithEmptyBody")
    @Override
    public boolean onNavigationItemSelected(MenuItem item) {
        // Handle navigation view item clicks here.
        int id = item.getItemId();

        if (id == R.id.nav_camera) {
            // Handle the camera action
        } else if (id == R.id.nav_gallery) {

        } else if (id == R.id.nav_slideshow) {

        } else if (id == R.id.nav_manage) {

        } else if (id == R.id.nav_share) {

        } else if (id == R.id.nav_send) {

        }

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        drawer.closeDrawer(GravityCompat.START);
        return true;
    }

    public void onClickProducts(View view) {
        final TextView textView = (TextView) findViewById(R.id.textView);

        // Instantiate the RequestQueue.
        mRequestQueue = Volley.newRequestQueue(this);
        String url = "http://www.google.com";

        // Request a string response from the provided URL.
        StringRequest stringRequest = new StringRequest(Request.Method.GET, url,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        // Display the first 500 characters of the response string.
                        textView.setText("Response is: " + response.substring(0, 500));
                    }
                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                textView.setText("That didn't work!");
            }
        });
        stringRequest.setTag(this);
        // Add the request to the RequestQueue.
        mRequestQueue.add(stringRequest);


    }

    public void onClickImage(View view) {
        final String IMAGE_URL = "http://developer.android.com/images/training/system-ui.png";

        // Get the NetworkImageView that will display the image.
        NetworkImageView mNetworkImageView = (NetworkImageView) findViewById(R.id.networkImageView);

        // Get the ImageLoader through your singleton class.
        ImageLoader mImageLoader = MySingleton.getInstance(this).getImageLoader();

        // Set the URL of the image that should be loaded into this view, and
        // specify the ImageLoader that will be used to make the request.
        mNetworkImageView.setImageUrl(IMAGE_URL, mImageLoader);
    }

    public void apiCall(View view) {
        String baseUrl = "http://www.blanc-essentials.com/app/wc-api/v3";
        String urlQuestion = "/oauth/request_token";
        String consumerKey = "oauth_consumer_key=ck_d84bd1cd3bd1bbd03c93df3a240118d53cc724e5";
        String consumerSecret = "oauth_consumer_secret=cs_c47d4ee3b89be937805f33b76d6a4d33e90fc29c";
        String signatureMethod = "oauth_signature_method=HMAC-SHA1";
        String nonce = "oauth_nonce=" + UUID.randomUUID().toString();
        long unixTime = System.currentTimeMillis() / 1000L;
        String timeStamp = "oauth_timestamp=" + Long.toString(unixTime);

        OAuthConsumer consumer = new DefaultOAuthConsumer(consumerKey,consumerSecret);
        //consumer.setTokenWithSecret("", "");


        String url = baseUrl + urlQuestion + "?" + consumerKey + "&" + consumerSecret + "&" + signatureMethod + "&" + nonce + "&" + timeStamp;
        final TextView textView = (TextView) findViewById(R.id.textView2);
        JsonObjectRequest jsObjRequest = new JsonObjectRequest(Request.Method.POST, url, new Response.Listener<JSONObject>() {

            @Override
            public void onResponse(JSONObject response) {
                Log.d("test", "response: " + response.toString());
                textView.setText("Response: " + response.toString());
            }
        }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                // TODO Auto-generated method stub

            }
        });

        try {
            consumer.sign(jsObjRequest);
            MySingleton.getInstance(this).addToRequestQueue(jsObjRequest);
        } catch (OAuthMessageSignerException e) {
            e.printStackTrace();
        } catch (OAuthExpectationFailedException e) {
            e.printStackTrace();
        } catch (OAuthCommunicationException e) {
            e.printStackTrace();
        }


    }

    @Override
    protected void onStop() {
        super.onStop();
        if (mRequestQueue != null) {
            mRequestQueue.cancelAll(this);
        }
    }
}
