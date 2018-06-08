extern crate unicode_segmentation;

use unicode_segmentation::UnicodeSegmentation;

pub fn reverse(input: &str) -> String {
    // using chars (won't work for uüu)
    // input.chars().rev().collect()

    // using grapheme clusters:
    input.graphemes(true).rev().collect()
}
