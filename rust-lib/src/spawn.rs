use gdnative::api::{GlobalConstants, Image, ImageTexture};
use gdnative::core_types::GodotString;
use gdnative::prelude::*;

#[derive(NativeClass)]
#[inherit(Node)]
pub struct Spawn;

#[methods]
impl Spawn {
    fn new(_owner: &Node) -> Self {
        Spawn
    }

    #[method]
    fn _ready(&self) {
        godot_print!("world is spawn");
    }

    #[method]
    fn _process(&self, #[base] owner: &Node, _delta: f64) {
        let input = Input::godot_singleton();
        if Input::is_key_pressed(input, GlobalConstants::KEY_UP) {
            let node = unsafe { owner.get_node_as::<Node2D>("tileEmpty").unwrap() };
            node.translate(Vector2 { x: 20., y: 12. });
        } else if Input::is_key_pressed(input, GlobalConstants::KEY_A) {
            let sprite = Sprite::new();
            let image = Image::new();
            let path = GodotString::from_str("res://assets/tiles/free.png");
            image.load(path).unwrap();
            let texture = ImageTexture::new();
            texture.create_from_image(image, 7);
            sprite.set_texture(texture);
            owner.add_child(sprite, true);
        }
    }
}
