package sys;

import js.node.Fs;

@:dce
@:coreApi
class FileSystem {

	public static function exists( path : String ) : Bool {
		return try { Fs.accessSync(path); true; } catch (_:Dynamic) false;
	}

	public static inline function rename( path : String, newPath : String ) : Void {
		Fs.renameSync(path, newPath);
	}

	public static inline function stat( path : String ) : sys.FileStat {
		return cast Fs.statSync(path);
	}

	public static inline function fullPath( relPath : String ) : String {
		return Fs.realpathSync(relPath);
	}

	public static inline function absolutePath( relPath : String ) : String {
		return js.node.Path.resolve(relPath);
	}

	public static inline function isDirectory( path : String ) : Bool {
		return Fs.statSync(path).isDirectory();
	}

	public static inline function createDirectory( path : String ) : Void {
		Fs.mkdirSync(path);
	}

	public static inline function deleteFile( path : String ) : Void {
		Fs.unlinkSync(path);
	}

	public static inline function deleteDirectory( path : String ) : Void {
		Fs.rmdirSync(path);
	}

	public static inline function readDirectory( path : String ) : Array<String> {
		return Fs.readdirSync(path);
	}

}
