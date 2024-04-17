#!/bin/bash

# Функция для обработки SIGTERM и SIGINT
cleanup() {
    tcdel "$NETWORK_INTERFACE" --all
    exit 0
}

# Перехват сигналов SIGTERM и SIGINT
trap cleanup SIGTERM SIGINT
# Вообще, должно быть первое правило --overwrite, а второе --add, но пока библиотека имеет проблемы. https://github.com/thombashi/tcconfig/issues/181
echo "tc start"
IFS=',' read -ra ADDR <<< "$NETWORKS"
first=true
for network in "${ADDR[@]}"; do
    if [ "$first" = true ]; then
        tcset "$NETWORK_INTERFACE" --rate "$RATE" --network "$network" --overwrite && tcshow "$NETWORK_INTERFACE"
        first=false
    else
        tcset "$NETWORK_INTERFACE" --rate "$RATE" --network "$network" && tcshow "$NETWORK_INTERFACE"
    fi
done

tail -f /dev/null & wait
