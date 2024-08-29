trait Animal {
    fn run(&self) -> String;
    fn speak(&self) -> String;
    fn eat(&self, s: String) -> String;
}

struct Sheep;
struct Cow;

impl Animal for Sheep {
    fn run(&self) -> String {
        String::from("Tipsi Tipsi")
    }
    fn speak(&self) -> String {
        String::from("Ploooekk")
    }
    fn eat(&self, _s: String) -> String {
        String::from("Crunch Crunch")
    }
}

impl Animal for Cow {
    fn run(&self) -> String {
        String::from("Galopp Galopp")
    }
    fn speak(&self) -> String {
        String::from("Muuuuh")
    }
    fn eat(&self, _s: String) -> String {
        String::from("Ruelps")
    }
}


fn main() {

    let c = Cow;
    println!("{}", c.eat(String::from("Wuffi")));
    println!("{}", c.speak());
    println!("{}", c.run());

    let s = Sheep;
    s.eat(String::from("Wuffi"));
    s.speak();
    s.run();
}
