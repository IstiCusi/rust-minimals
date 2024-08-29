struct MyStruct {
    x: i32, 
    y: i32
}

impl MyStruct {
    /// Squares everything
    /// Test
    fn squared_norm(&self) ->i32 {
        self.x * self.x + self.y * self.y
    }
}

fn main() {
    let boxed_value = Box::new(MyStruct {x:1 , y:2});
    let norm = boxed_value.squared_norm();
    println!("{}", norm);
}

