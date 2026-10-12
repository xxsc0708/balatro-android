# Keep LÖVE native libraries
-keep class org.love2d.android.** { *; }
-keep class com.love2d.** { *; }

# Keep native method names
-keepclasseswithmembernames class * {
    native <methods>;
}

# Keep GameActivity
-keep class org.love2d.android.GameActivity { *; }

# Don't warn about missing luasteam (disabled for Android)
-dontwarn luasteam
-dontwarn org.luasteam.**

# Keep annotations
-keepattributes *Annotation*,Signature,InnerClasses,EnclosingMethod

# Keep resource references
-keep class **.R$* {
    <fields>;
}