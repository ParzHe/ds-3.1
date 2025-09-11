import openai
client = openai.Client(
    base_url="http://127.0.0.1:30000/v1", api_key="EMPTY")

# Chat completion
response = client.chat.completions.create(
    model="default",
    messages=[
        {"role": "system", "content": "You are a helpful AI assistant"},
        {"role": "user", "content": "Answer the following with the second letter of the correct answer only: What is the capital of France?"},
    ],
    temperature=0,
    max_tokens=1024,
    extra_body = {"chat_template_kwargs": {"thinking": False}}
)
print(response.choices[0].message.content)