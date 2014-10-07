package localnotifications;

#if androiod
import openfl.utils.JNI;
#end

class LocalNotifications {
#if android
  static public function showNotification(title : String, text : String) {
    JNI.getStaticMethod("org/haxe/extension/LocalNotifications", "showNotification", "(Ljava/lang/String;Ljava/lang/String;)V")(title,text);
  }
#else
  public function showNotification(title : String, text : String) {
    trace("Not implemented, notification: " + title + " - " + text);
  }
#end
}
