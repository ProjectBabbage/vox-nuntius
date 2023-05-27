use std::cell::RefCell;
use std::collections::HashMap;
use std::rc::Rc;

#[derive(Debug, Clone, Hash, Eq, PartialEq)]
pub struct Pos {
    pub x: i32,
    pub y: i32,
}

pub struct Health {
    pub current_hp: i32,
    pub max_hp: i32,
}

#[derive(Clone)]
pub enum Action {
    Go(Pos),
    Attack(Pos),
    Stop,
}

pub struct Unit {
    pub id: i32,
    pub pos: Pos,
    pub health: Health,
    pub next_action: Action,
}

pub enum Terrain {
    Normal(Option<Rc<RefCell<Unit>>>),
    Impassable,
}

pub struct Game {
    pub map: HashMap<Pos, Terrain>,
    pub all_units: Vec<Rc<RefCell<Unit>>>,
}
