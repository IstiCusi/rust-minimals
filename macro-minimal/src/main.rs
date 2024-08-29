#[allow(unused_macros)]
macro_rules! hello_world {
    () => {
        println!("Hello, world!");
    };
}

pub trait Bounded {
    fn min_value() -> Self;
    fn max_value() -> Self;
}

#[allow(unused_macros)]
macro_rules! bounded_impl {
    ($t:ty, $min:expr , $max:expr) => {
        impl Bounded for $t {
        #[inline]
        fn min_value() -> $t {
        $min
        }
        #[inline]
        fn max_value() -> $t {
        $max
        }

        } }; }


fn main() {
    hello_world!();
    bounded_impl!(u8, u8::MIN, u8::MAX);

    let i: u8 = 5;
    println!("i: {}, min: {}, max: {}", i, u8::min_value(), u8::max_value());
}

