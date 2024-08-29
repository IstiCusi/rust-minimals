#[derive(Debug)]
struct MyStruct {
    x: u32, 
    y: u32,
}

impl MyStruct {

    fn new(u: u32, v: u32) -> MyStruct {
        let x = 3*u;
        let y = 3*v;
        MyStruct {x, y}
    }

    fn area(self) -> u32 {
        self.x * self.y
    }

    fn print(self: &Self) {
        println!("{} - {}", self.x, self.y);
    }

    fn change(self: &mut Self) {
        self.x = 10;
        self.y = 10;
    }

}

fn main() {

    let mut an_object: MyStruct = MyStruct::new(3, 4);
    an_object.print();
    an_object.change();
    let an_object = an_object;

    println!("{:?}", an_object);
    println!("{}", an_object.x);
    println!("{}", an_object.y);

    let area = an_object.area();

    println!("{}", area);


}
