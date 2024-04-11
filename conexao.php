//CRIANDO A CONEXÃO COM O BANCO DE DADOS UTILIZANDO A API PDO
# Criando uma função para utilizar o script em outros arquivos ==================================
function conectar() {
  //Tratando Exceções com Try/Catch
  try{
    $conn = new PDO("mysql:host=localhost;dbname=projeto_cardapio","root",""); //Variável de Conexão
  }catch(PDOException $e){
    echo "Erro: " . $e->getCode() . " - ";
    echo $e->getMessage();
  }
  return $conn; //Retorna a variável de conexão
}
