use gdnative::prelude::*;
mod spawn;

#[derive(NativeClass)]
#[inherit(Node)]
struct HelloWorld;

#[methods]
impl HelloWorld {
    fn new(_owner: &Node) -> Self {
        HelloWorld
    }

    #[method]
    fn _ready(&self) {
        godot_print!("hello, toi !.");
    }

    #[method]
    fn _process(&self, _delta: f64) {
        godot_print!("{} each frame", _delta);
    }
}

struct HelloWorldLibrary;

#[gdnative::init::callbacks]
impl GDNativeCallbacks for HelloWorldLibrary {
    fn nativescript_init(handle: InitHandle) {
        handle.add_class::<HelloWorld>();
        handle.add_class::<spawn::Spawn>();
    }
}
