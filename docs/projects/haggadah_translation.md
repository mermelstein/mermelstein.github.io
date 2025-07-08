# Project: Haggadah Translation

While my in-laws were visiting for Passover in 2023, I wanted to ensure they could fully participate in the Seder. Problems was they don't speak English very well. To help them follow along I translated our family's Haggadah into Mandarin Chinese and give them their own copy.

## The Process

The goal was to create a translated version that mirrored the original's layout and page numbering, making it easy for everyone to follow along (we even had them read from their book when it was their turn).

1.  **Source Material:** I found a PDF version of our specific Haggadah.
2.  **Text Extraction:** I extracted the English text from the PDF, one page at a time using off-the-shelf OCR software.
3.  **Translation:** Each page's text was then fed into GPT-3.5 with a prompt to translate it into Mandarin Chinese while preserving the original structure.
4.  **Quality Assurance:** A native Mandarin speaker (my wife) reviewed the translation. They gave it a thumbs-up, confirming accuracy and readability.
5.  **Final Product:** The translated pages were compiled and printed to create a complete, parallel Haggadah for the in-laws.

## Technical Stack

*   **Python:** For scripting the OCR and translation workflow.
*   **OCR (pytesseract):** To extract text from the PDF.
*   **GPT-3.5:** For the English to Mandarin Chinese translation.

## Project Status

*   **Status:** Completed.
