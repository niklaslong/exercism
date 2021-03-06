extern crate regex;

use regex::Regex;

struct Result {
    shouting: bool,
    question: bool,
    whitespace: bool,
}

pub fn reply(message: &str) -> &str {
    let mut result = Result {
        shouting: false,
        question: false,
        whitespace: false,
    };

    result.shouting = is_shouting(message);
    result.question = is_question(message);
    result.whitespace = is_whitespace(message);

    let output = if message.is_empty() {
        "Fine. Be that way!"
    } else if result.shouting && result.question {
        "Calm down, I know what I'm doing!"
    } else if result.shouting {
        "Whoa, chill out!"
    } else if result.question {
        "Sure."
    } else if result.whitespace {
        "Fine. Be that way!"
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

fn is_whitespace(message: &str) -> bool {
    let mut s = String::from(message);
    s.retain(|c| c != ' ' && c != '\t' && c != '\n' && c != '\r');
    s.len() < 1
}

fn is_question(message: &str) -> bool {
    let mut s = String::from(message);
    s.retain(|c| c != ' ' && c != '\t' && c != '\n' && c != '\r');
    s.ends_with("?")
}
