package com.example.sree3app;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.net.Uri;
import android.os.Bundle;
import android.os.PersistableBundle;
import android.provider.MediaStore;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.View;
import android.webkit.WebView;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.Toast;

import androidx.annotation.Nullable;
import androidx.annotation.NonNull;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.journeyapps.barcodescanner.BarcodeEncoder;

import org.json.JSONObject;

import io.flutter.Log;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

import java.io.ByteArrayOutputStream;
import java.lang.reflect.Method;
import java.util.Map;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;
public class MainActivity extends FlutterActivity {

    private static final String CHANNEL = "com.flutter.epic/epic";
    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (new MethodChannel.MethodCallHandler() {
                            @Override
                            public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
                                final Map<String,Object> para =call.arguments();
                             //   String amount = (String) para.get("priceProd");
                                String amount ="500";
                                // double price = Double.parseDouble(pricepar);
                                if(call.method.equals("payment")){
                                    call_mada_to_initiate_Card_Payment(amount);
                                    print();

                                }

                            }
                        }
                        ));
    }



    Intent data;

    private String PAX_APP_PACKAGE_NAME = "com.pax.edc";
    private Integer PAYMENT_REQUEST_CODE = 100;
    private Integer RECEIPT_PRINT_REQUEST_CODE = 200;

    float amount = (float) 0.01;
    // you can pass amount here
    int FONT_BIG = 30;
    int FONT_NORMAL = 24;
    int FONT_SMALL = 20;
    View view;
    Button Button1;
    ImageView imageview2;
    LinearLayout layout_view;
    WebView webview;
    String html;

    @SuppressLint("WrongThread")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
      //  setContentView(R.layout.activity_main);
//        submitBtn1 = findViewById(R.id.submitBtn1);
//        submitBtn1.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View v) {
//                appInstalledOrNot(MainActivity.this, "com.pax.edc");
//            }
//        });
//        submitBtn2 = findViewById(R.id.submitBtn2);
//        submitBtn2.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View v) {
//                call_mada_to_initiate_Card_Payment();
//            }
//        });
//        submitBtn3 = findViewById(R.id.submitBtn3);
//        submitBtn3.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View v) {
//                print();
//                //print();
//            }
//        });

//*****************************************************************************************
        view = LayoutInflater.from(this).inflate(R.layout.print_receipt, null);
        ImageView barCode_tv = view.findViewById(R.id.barCode_tv);
        try {
            barCode_tv.setImageBitmap(barCode("7700000023209"));
        } catch (WriterException e) {
            e.printStackTrace();
        }
        layout_view = (LinearLayout) view.findViewById(R.id.layout_view);
//*****************************************************************************************
    }

    //*******************************************************************************************************
    //********************************************************************************************************
    private boolean appInstalledOrNot(Context Context, String packageName) {
        PackageManager packageManager = getApplicationContext().getPackageManager();
        try {
            packageManager.getPackageInfo(packageName, 0);
            //Toast.makeText(Context, "true", Toast.LENGTH_SHORT).show();
            return true;

        } catch (PackageManager.NameNotFoundException e) {
            //Toast.makeText(Context, "false", Toast.LENGTH_SHORT).show();
            return false;
        }
    }

    //**********************************************************************************************************************
    private void  call_mada_to_initiate_Card_Payment(String amount) {
        Toast.makeText(this,
                "stqrt function:"+amount, Toast.LENGTH_SHORT).show();
        Log.i("Test  Fun","stqrt function:"+amount);
        if (appInstalledOrNot(MainActivity.this, "com.example.sree3app")) {
            Intent paymentIntenet = new Intent();
            paymentIntenet.setAction("com.example.sree3app.PURCHASE");
            paymentIntenet.putExtra(Intent.EXTRA_TEXT, amount);
            //Need to pass amount as String (Amount currency is SAR)
            paymentIntenet.putExtra("CUSTOMER_RECEIPT_FLAG", true);
            // this is
            // optional parameter, by
            ///  default
            //     Stringue is true. true - to enable customer receipt print, false - to disable customer receipt print paymentIntenet.putExtra(("HOME_BUTTON_STATUS", true) // its
            //   optional intent parameter, send true to enable home button, send false to disable home button,
            //    If you are not pass anything its take
            //default
            //     Stringue as true and home button will be enabled.
            paymentIntenet.setType("text/plain");
            Intent shareIntent = Intent.createChooser(paymentIntenet, null);
            startActivityForResult(shareIntent, PAYMENT_REQUEST_CODE);
            Toast.makeText(this,
                    "payment works ", Toast.LENGTH_SHORT).show();
        } else {// implement your code if mada app is not installed to handle transaction
            Toast.makeText(this,
                    "MADA app is not installed to process transaction", Toast.LENGTH_SHORT).show();
        }

    }

    //********************************************************************************************************************
    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == PAYMENT_REQUEST_CODE) {
            if (resultCode == Activity.RESULT_OK) {
                Toast.makeText(this,
                        "about to print", Toast.LENGTH_SHORT).show();
                String status = data.getStringExtra("status");
                if (status.equals("Approved") || status.equals("Declined")) {
                    //Toast.makeText(this, "status:"+status, Toast.LENGTH_SHORT).show();
                    String result = data.getStringExtra("result");
                    //Toast.makeText(this, "result:"+result, Toast.LENGTH_SHORT).show();
                    Log.i("result:", result);
                    try {
                        if (result != null) {
                            JSONObject jsonObject = new JSONObject(result);
                            String rrn = jsonObject.optString("rrn");
                            String cardScheme = jsonObject.optString("card_scheme");
                            String pan = jsonObject.optString("pan");
                            String stan = jsonObject.optString("stan");
                            String entryMode = jsonObject.optString("entry_mode");
                            String appVersion = jsonObject.optString("app_version");
                            String respCode = jsonObject.optString("resp_code");
                            String acqID = jsonObject.optString("acq_id");
                            String terminalID = jsonObject.optString("terminal_id");
                            String amount = jsonObject.optString("amount");
                            String authCode = jsonObject.optString("auth_code");
                            String responseMessage = jsonObject.optString("res_desc");
                           // print();
                        }
                    } catch (Exception e) {

                    }
                } else {
                    String reason = data.getStringExtra("reason");
                    // reason for payme abort
                    Toast.makeText(this, "reason:" + reason, Toast.LENGTH_SHORT).show();
                }

            }
        } else if (requestCode == RECEIPT_PRINT_REQUEST_CODE) {
            String status = data.getStringExtra("status");
            String message = data.getStringExtra("message");
            Toast.makeText(this, "status:" + status +" message"+message, Toast.LENGTH_SHORT).show();
        }
    }

    //*******************************************************************************************************************
    private void print() {
        if (appInstalledOrNot(MainActivity.this, "com.example.sree3app")) {
            Intent printIntenet = new Intent();
            printIntenet.setAction("com.example.sree3app.PRINT");
            //printIntenet.setAction("com.pax.edc.ASYNCPRINT");
            printIntenet.putExtra(Intent.EXTRA_TEXT, getImageUri(createBitmapFromView(MainActivity.this, layout_view)).toString());
            printIntenet.setType("text/plain");
            Intent shareIntent = Intent.createChooser(printIntenet, null);
            startActivityForResult(shareIntent, RECEIPT_PRINT_REQUEST_CODE);
            Toast.makeText(this,
                    "printed", Toast.LENGTH_SHORT).show();
        } else {
            // implement your code if mada app is not installed
            Toast.makeText(this,
                    "MADA app is not installed to process transaction", Toast.LENGTH_SHORT).show();
        }
    }

    //**********************************************************************************************************************
    public Uri getImageUri(Bitmap inImage) {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        inImage.compress(Bitmap.CompressFormat.JPEG, 100, bytes);
        String path = MediaStore.Images.Media.insertImage(this.getContentResolver(), inImage, "Title", null);
        return Uri.parse(path);
    }
    //*****************************************************************************************************************
    private Bitmap createBitmapFromView(Context context, View view) {
        DisplayMetrics displayMetrics = new DisplayMetrics();
        //DisplayMetrics dm = context.getResources().getDisplayMetrics();
        ((Activity) context).getWindowManager().getDefaultDisplay().getMetrics(displayMetrics);
        view.setLayoutParams(new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));
        //Toast.makeText(this, "Width:" +
        //        displayMetrics.widthPixels+"-----"+
        //       view.getMeasuredWidth(), Toast.LENGTH_SHORT).show();
        view.measure(View.MeasureSpec.makeMeasureSpec(displayMetrics.widthPixels,
                View.MeasureSpec.EXACTLY), displayMetrics.heightPixels);
        view.layout(0, 0, view.getMeasuredWidth(), displayMetrics.heightPixels);
        view.buildDrawingCache();
        Bitmap bitmap = Bitmap.createBitmap(view.getMeasuredWidth(), view.getMeasuredHeight(), Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(bitmap);
        canvas.drawColor(Color.WHITE);
        view.draw(canvas);
        return bitmap;
    }
    //***************************************************************************************************************
    //create functions for the qrcode and barcode
    MultiFormatWriter multiFormatWriter = new MultiFormatWriter();

    public Bitmap qrcode(String code) throws WriterException {
        BitMatrix bitMatrix = multiFormatWriter.encode(code, BarcodeFormat.QR_CODE, 350, 300);
        BarcodeEncoder barcodeEncoder = new BarcodeEncoder();
        Bitmap bitmap = barcodeEncoder.createBitmap(bitMatrix);
        //set the generated qrcode to our imageview
        //qrCode.setImageBitmap(bitmap);
        return bitmap;
    }

    public Bitmap barCode(String code) throws WriterException {
        BitMatrix bitMatrix = multiFormatWriter.encode(code, BarcodeFormat.CODE_128, 300, 100, null);
        BarcodeEncoder barcodeEncoder = new BarcodeEncoder();
        Bitmap bitmap = barcodeEncoder.createBitmap(bitMatrix);
        //set the generated barcode to our imageview
        //barCode.setImageBitmap(bitmap);
        return bitmap;
    }

}
