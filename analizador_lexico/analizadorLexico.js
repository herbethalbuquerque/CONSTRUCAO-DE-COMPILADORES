/*
Os trabalhos devem ser individuais ou em dupla.
Se possível, favor enviar o link do código fonte disponível no GIT inclusive com o README com instruções para execução.
Crie um analisador léxico de uma calculadora. O objetivo será criar uma tabela  de tokens e seus tipos:
As operações da calculadora são: +, -, *, /, ** (potenciação)
A calculadora deve aceitar números inteiros positivos e negativos
Serão aceitos parênteses
Veja o seguinte exemplo: Sequência de tokens para o exemplo Exemplo de expressão aritmética 42 + (675 * 31) - 20925
Alguns exemplos:
+1*2
+5**2-(4)
-5--7
-(8+12)**1*3/-4
a2+(3-5)
1+2/b
Modo de envio:
Portal (obrigatório) e e-mail: climarocha@gmail.com (opcional)
Envie um doc. com os links
Do fonte projeto no GIT (se houver enviado pelo portal) 
Um link do vídeo da execução dos exemplos acima e explicação do fonte
O TRABALHO DEVE:
Criar uma tabela de tokens
O analisador léxico deve realizar tratamentos de erros notificando através de mensagens o erro léxico, por exemplo:
A sentença a2+(3-5) retornaria uma mensagem do tipo: caractere inválido.
Você pode definir que a sentença precisa terminar com algum caractere
Opcional: Elimine os comentários definidos na sua linguagem
*/

function analisadorLexico(expressao) {

    let operadores = /\+|\-|\**|\/|\*/g;
    let simbolos = /[\(]|[\)]/;
    let numeros = /(\d+|(?:(?:\-)\d+))/;
    let express = /\+|\(|\)|[**]?\*|\/|-?\d+|\-/g;
    var array = expressao.match(express);

    let testArray = expressao.split('');    
    
    testArray.forEach(element => {
        if(!element.match(express)) {
            throw Error("Caractere inválido");
        }
    })
  
    array.forEach(element => {
        let lexema;
        let tipo;
        let valor;

        if(element.match(numeros)){
            lexema = element;
            tipo = 'Número';
            valor = element;           
        } else if (element.match(simbolos)) {
            lexema = element;
            tipo = 'Pontuacao'
            if(element == '(') {
                valor = 'Parenteses Esquerda';
            } else {
               valor = 'Parenteses Direita';
            }     
        } else if(element.match(operadores)) {
            lexema = element;
            tipo = 'Operador'
            if(element == '+') {
                valor = 'Soma';
            } else if(element == '-') {
               valor = 'Subtração';
            } else if(element == '*') {
               valor = 'Multiplicação';
            } else if(element == '/') {
               valor = 'Divisão';
            } else if(element == '**'){
               valor = 'Exponeciação';
            }         
        } 
        return console.log([lexema,tipo,valor]);
    })
}

//analisadorLexico("+1*22");
//analisadorLexico("+5**2-(4)");
//analisadorLexico("-5--7");
//analisadorLexico("-(8+12)**1*3/-4");
//analisadorLexico("a2+(3-5)");
analisadorLexico("1+2/b");





