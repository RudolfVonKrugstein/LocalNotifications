package;

#if cpp
import cpp.Lib;
#elseif neko
import neko.Lib;
#end

#if (android && openfl)
import openfl.utils.JNI;
#end


class LocalNotifications {
	
	
	public static function sampleMethod (inputValue:Int):Int {
		
		#if (android && openfl)
		
		var resultJNI = localnotifications_sample_method_jni(inputValue);
		var resultNative = localnotifications_sample_method(inputValue);
		
		if (resultJNI != resultNative) {
			
			throw "Fuzzy math!";
			
		}
		
		return resultNative;
		
		#else
		
		return localnotifications_sample_method(inputValue);
		
		#end
		
	}
	
	
	private static var localnotifications_sample_method = Lib.load ("localnotifications", "localnotifications_sample_method", 1);
	
	#if (android && openfl)
	private static var localnotifications_sample_method_jni = JNI.createStaticMethod ("org.haxe.extension.LocalNotifications", "sampleMethod", "(I)I");
	#end
	
	
}