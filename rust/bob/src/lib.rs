extern crate regex;

use regex::Regex;

struct Result {
    shouting: bool,
    question: bool,
}

pub fn reply(message: &str) -> &str {
    let mut result = Result {
        shouting: false,
        question: false,
    };

    result.shouting = is_shouting(message);
    result.question = message.ends_with("?");

    let output = if message.is_empty() {
        "Fine. Be that way!"
    } else if result.shouting && result.question {
        "Calm down, I know what I'm doing!"
    } else if result.shouting {
        "Whoa, chill out!"
    } else if result.question {
        "Sure."
    } else {
        "Whatever."
    };

    output
}

fn is_shouting(message: &str) -> bool {
    let re = Regex::new(r"([[:alpha:]])").unwrap();

    let ret = if String::from(message) == message.to_uppercase() && re.is_match(message) {
        true
    } else {
        false
    };

    ret
}
