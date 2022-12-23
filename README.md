# haskgpt

Query [OpenAI's ChatGPT](https://chat.openai.com/) from your terminal and get responses.

# Setup

You must generate an API key from Open AI to use this program. The key will be read from the file `OPENAI_KEY` environment variable on the system. 

You can generate an API key [here](https://beta.openai.com/account/api-keys).

# Usage

Simply provide the query as a comamnd line argument to the program.

```
$ ./haskgpt [query]
```

# Response

The response is returned in plain-text.

# Example

```
$ ./haskgpt Generate a random word
banana
```
