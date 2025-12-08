
#!/bin/bash

# Captura a seleção uma única vez e salva temporariamente
temp_file="/tmp/screenshot_$(date +%Y-%m-%d_%H-%M-%S).png"
final_file="/home/barez/Imagens/$(date +%Y-%m-%d_%H-%M-%S).png"

# Captura com slurp uma só vez
grim -g "$(slurp)" "$temp_file"

# Se a captura foi bem-sucedida
if [ $? -eq 0 ]; then
    # Copia para o clipboard
    wl-copy < "$temp_file"
    
    # Move para o destino final
    mv "$temp_file" "$final_file"
    
    echo "Screenshot salvo em: $final_file"
else
    echo "Erro ao capturar screenshot"
fi
