# DeepSeek V3.1 H20 单机部署和使用

中文 | [English](README_en.md)

## 启动服务

- 服务启动脚本: [launch_sglang.sh](launch_sglang.sh)

    ```bash
    cd /root/ds-3.1
    bash launch_sglang.sh
    ```

## API 使用示例

- 非思考模式使用示例: [non_thinking.py](usage_examples/non_thinking.py)
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
    
- 思考模式使用示例: [thinking.py](usage_examples/thinking.py)
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

## 吞吐量测试

- 吞吐量测试脚本: [throughput_test.sh](throughput_test.sh) 
    ```bash
    cd /root/ds-3.1
    bash throughput_test.sh
    ```
