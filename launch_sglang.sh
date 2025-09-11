cd /root/ds-3.1

uv run -m sglang.launch_server \
    --model-path "/data1/DeepSeek-V3.1" \
    --host 0.0.0.0 --port 30000 \
    --tp 8 \
    --context-length 131072 \
    --served-model-name deepseek-v31 \
    --reasoning-parser deepseek-v3 \
    --tool-call-parser deepseekv31 \
    --chat-template "./chat_template/tool_chat_template_deepseekv31.jinja" \
    --mem-fraction-static 0.9 \
    --trust-remote-code 
    # --enable-torch-compile --torch-compile-max-bs 2 \
    # --speculative-algorithm EAGLE \
    # --speculative-num-steps 3 \
    # --speculative-eagle-topk 1 \
    # --speculative-num-draft-tokens 4 \
    