# Preserve all classes with @Keep annotation
-keep @interface androidx.annotation.Keep

# Preserve all classes annotated with @Keep
-keep @androidx.annotation.Keep class * { *; }

# Keep classes for Flutter and its dependencies
-keep class io.flutter.app.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.** { *; }
-keep class androidx.** { *; }

# Keep any custom classes you might be using
-keep class com.example.yourapp.** { *; }