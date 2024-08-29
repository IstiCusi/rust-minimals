
struct MyStructure<T> {
    a: T,
    b: T, 
    dim: i32,
}

impl<T> MyStructure<T> {
    fn set_vec(&mut self, a: T, b: T) {
        self.a = a;
        self.b = b;
    }
}

fn main() {
    let mut my_instance = MyStructure {a: 0 , b:0, dim: 10};
    my_instance.set_vec(19, 20);
    println!("a: {}, b: {}, dim: {}", 
        my_instance.a, my_instance.b, my_instance.dim);

}
