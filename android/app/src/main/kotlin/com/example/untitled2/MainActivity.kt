package com.example.untitled2

import io.flutter.embedding.android.FlutterFragmentActivity

// FlutterFragmentActivity, not FlutterActivity: the health plugin requests
// Health Connect permissions via registerForActivityResult, which needs a
// ComponentActivity — with FlutterActivity the permission dialog never opens.
class MainActivity : FlutterFragmentActivity()
