cd /root/ds-3.1

export HF_ENDPOINT="https://hf-mirror.com"

uv run -m sglang.bench_serving \
  --backend sglang \
  --host 0.0.0.0 --port 30000 \
  --model "/data1/DeepSeek-V3.1" \
  --dataset-name mmmu \
  --random-input-len 1024 --random-output-len 1024 --random-range-ratio 0 \
  --num-prompts 500 \
  --request-rate 128 \
  --max-concurrency 128 \
  --output-file output/sglang_random.jsonl --output-details