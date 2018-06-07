struct Drop {
    three: bool,
    five: bool,
    seven: bool,
}

impl Drop {
    fn new(n: &usize) -> Drop {
        Drop {
            three: n % 3 == 0,
            five: n % 5 == 0,
            seven: n % 7 == 0,
        }
    }
}

pub fn raindrops(n: usize) -> String {
    let drop = Drop::new(&n);
    let mut output: String = "".to_owned();

    if drop.three {
        output.push_str(&"Pling");
    }

    if drop.five {
        output.push_str(&"Plang");
    }

    if drop.seven {
        output.push_str(&"Plong");
    }

    if let Drop {
        three: false,
        five: false,
        seven: false,
    } = drop
    {
        output = String::from(format!("{}", n));
    }

    String::from(format!("{}", output))
}
