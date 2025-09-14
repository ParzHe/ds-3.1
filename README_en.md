# DeepSeek V3.1 H20 Deployment and Usage on a Single Node

[中文](README.md) | English

## Environment Preparation

- Hardware requirements: H20 / H200 single node (8 cards) or above

- Make sure to install [uv](https://docs.astral.sh/uv/guides/install-python/). After successful installation, run:

    ```bash
    cd ds-3.1
    uv sync
    ```

## Starting the Service

- Service startup script: [launch_sglang.sh](launch_sglang.sh)

    ```bash
    cd /root/ds-3.1
    bash launch_sglang.sh
    ```

## API Usage Examples

- Non-thinking mode usage example: [non_thinking.py](usage_examples/non_thinking.py)
    ```python
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
    ```

- Thinking mode usage example: [thinking.py](usage_examples/thinking.py)
    ```python
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
        extra_body = {"chat_template_kwargs": {"thinking": True}}
    )
    print(response)
    ```

## Throughput Testing

- Throughput testing script: [throughput_test.sh](throughput_test.sh)
    ```bash
    cd /root/ds-3.1
    bash throughput_test.sh
    ```
