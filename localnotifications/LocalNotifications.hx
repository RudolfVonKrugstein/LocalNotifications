package localnotifications;

#if android
import openfl.utils.JNI;
#end

class LocalNotifications {
#if android

  var showNotification_ : Dynamic = null;
  var showToast_ : Dynamic = null;

  static private function initJNI() {
    if (showNotification_ == null) return;
    showNotification_ = JNI.createStaticMethod("org/haxe/extension/LocalNotifications", "showNotification", "(Ljava/lang/String;Ljava/lang/String;)V");
    showToast_ = JNI.createStaticMethod("org/haxe/extension/LocalNotifications", "showToast", "(Ljava/lang/String;II)V");
  }

  static public function showNotification(title : String, text : String) {
    initJNI();
    showNotification_(title, text);
  }

  static public function showToast(text : String, duration : Duration = LONG, gravity : Array<Gravity> = []) {
    initJNI();
    var g : Int = 0;
    for (i in gravity) {
      g = g | i;
    }
    showToast_(text, duration, g);
  }
#else
  public function showNotification(title : String, text : String) {
    trace("Not implemented, notification: " + title + " - " + text);
  }
#end
}

#if android
@:enum
abstract class Duration {
  var SHORT : INT = 0;
  var LONG  : INT = 1;
}

// These values are copied from the android documentation
@:enum
abstract class Gravity {
  var CENTER            : Int = 17;
  var CENTER_VERTICAL   : Int = 16;
  var CENTER_HORIZONTAL : Int = 1;
  var BOTTOM            : Int = 80;
  var LEFT              : Int = 3;
  var RIGHT             : Int = 5;
  var TOP               : Int = 48;
}
#end
