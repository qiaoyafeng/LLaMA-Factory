#!/bin/sh
# 激活虚拟环境
conda activate /opt/conda/llmfactory_0_8_3


pid=$(ps aux | grep webui_chat.py  | grep -v grep | awk '{print $2}')
echo "pid:$pid"

if [ -n "$pid" ];then
          echo "kill pid:$pid"
            kill -9  $pid
fi
( nohup python src/webui_chat.py --model_name_or_path /opt/chatglm/glm-4-9b-chat --adapter_name_or_path /opt/GLM-4/basic_demo/lf_checkpoint-92000 --template glm4  1>&2 >> "logs/$(date '+%Y-%m-%d').log"  & )






