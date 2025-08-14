# brainrotlify

Server that uses the Gemini API to brainrot and simplify any text, made for fun

## Requirements
Vapor
- Linux: https://docs.vapor.codes/install/linux/
- macOS: https://docs.vapor.codes/install/macOS/

## Usage

  POST request to /brainrot with JSON Body:
  {
    "apiKey": "<Your Google Gemini API Key>",
    "message": "<Text you want brainrotted>"
  }


## Example
```bash
  curl "http://localhost:8080/brainrot" \
    -X POST \
    -H "Content-Type: application/json" \
    -d '{
      "apiKey": "YOUR GEMINI API KEY (typically AIzaSy...)",
      "message": "The cat is sleeping on the couch"
    }'
```

## Notes

  • The language of the output will match the language of your input message.
  
  • Response is only the brainrotted text with no extra phrases or confirmations.
  
  • Errors will return JSON with an error reason.

  • You can get a free Gemini API Key at https://aistudio.google.com
