# touchBear

### Objetivo do app:

O **touchBear** é um aplicativo infantil que visa promover o desenvolvimento sensorial das crianças de maneira interativa. A ideia é que o adulto peça para a criança localizar um personagem específico dentro de uma coleção, incentivando a identificação visual e a concentração. O objetivo é proporcionar uma atividade que estimule o raciocínio e os sentidos da criança, criando um ambiente lúdico de aprendizado e interação com os personagens.

O projeto foi desenvolvido utilizando a arquitetura **MVVM** para manter uma separação clara entre a lógica de negócios e a interface do usuário, facilitando a manutenção e escalabilidade do código. A interface gráfica é construída principalmente com **UICollectionView**, permitindo a exibição dinâmica e responsiva da coleção de personagens e animais. O uso do **ViewCode** garante uma construção eficiente e customizada da interface, mantendo a flexibilidade do layout e personalizações visuais.

## Definição das classes no projeto:

### HomeVC

Controlador principal que gerencia a exibição e o comportamento da `UICollectionView`. Ele está configurando sua view através de `HomeView` e usa o `HomeViewModel` para gerenciar os dados.

### HomeView

A classe `HomeView`  é responsável pela configuração da interface visual do controlador principal. Ela contém uma `UIView` (`viewCard`) que serve como um contêiner para a `UICollectionView`, e define a aparência e o layout da coleção de células horizontalmente.

A `collectionView` é configurada com layout horizontal e registra a célula customizada `CardCharacterCollectionViewCell`. A função `settingsProtocolsCollectionView` define o delegado e o dataSource da collection, conectando o comportamento da `UICollectionView` com a lógica de seu `ViewController`.

### HomeViewModel

A classe `HomeViewModel` está atuando como o gerenciador de dados, encapsulando a lógica relacionada aos dados que a `UICollectionView` precisa. Ela contém uma lista de objetos `Characters`, que são imagens de personagens, e expõe esses dados através da propriedade `getCharacters`.

Esse ViewModel segue o padrão MVVM, onde a lógica de negócios e os dados são mantidos separados da camada de exibição (`HomeVC` e `HomeView`), permitindo que a `UICollectionView` obtenha os dados através do ViewModel sem precisar se preocupar com a lógica de como esses dados são armazenados ou obtidos.

### Model - Characters

A estrutura `Characters` possui apenas uma propriedade `image`, que é uma string representando o nome de uma imagem. Essa estrutura é usada no ViewModel para armazenar as informações dos personagens exibidos na `UICollectionView`.

### CardCharacterCollectionViewCell

A classe `CardCharacterCollectionViewCell` está configurada para exibir uma célula de `UICollectionView` que contém outra `UICollectionView` interna. O comportamento da célula é gerenciado por um `ViewModel` (no caso, o `CardCharacterCellViewModel`), que manipula a lógica e os dados da célula.

A função `setupCell` recebe os dados e inicializa o `ViewModel` com uma lista de personagens (`Characters`), que depois são usados para popular a `UICollectionView` interna. O ViewModel também é responsável por determinar o tamanho de cada célula da coleção interna e o número de itens.

### CardCharacterCellView

A classe `CardCharacterCellView` é uma subclasse de `UIView` que contém a interface visual para a célula de personagem. Ela consiste em um contêiner (`cardView`) que apresenta a `UICollectionView` interna verticalmente.

### Principais Pontos:

1. **UIView Personalizada**: O `cardView` possui um fundo branco e cantos arredondados, melhorando a estética da interface.
2. **UICollectionView**: A coleção é configurada para rolar verticalmente e registra a célula `CharacterCollectionViewCell`, que será utilizada para exibir os personagens.
3. **Métodos de Configuração**: A função `settingsProtocolsCollectionView` é utilizada para configurar o delegado e o data source da `collectionView`, permitindo que a lógica seja delegada às classes apropriadas.
4. **Layout**: As constraints são definidas para garantir que o `cardView` e a `collectionView` ocupem o espaço correto dentro do `CardCharacterCellView`, mantendo um espaçamento consistente.

Essa classe é responsável por configurar a interface e as interações dentro de uma célula de `UICollectionView`, permitindo que a coleção interna de personagens seja gerenciada de forma eficiente.

### CardCharacterCellViewModel

A classe `CardCharacterCellViewModel` é responsável por gerenciar a lógica e os dados relacionados à coleção de personagens que serão exibidos nas células de `UICollectionView` dentro da célula de personagem (`CardCharacterCollectionViewCell`).

### Principais Componentes:

1. **Propriedade `listCharacters`**: Armazena a lista de objetos `Characters`, que contêm as informações das imagens dos personagens.
2. **Inicializador**: O inicializador aceita uma lista de `Characters` e a armazena na propriedade `listCharacters`.
3. **`numberOfItems`**: Uma propriedade calculada que retorna a contagem de itens na lista, permitindo que a `UICollectionView` saiba quantas células deve exibir.
4. **`loadCurrentData`**: Este método retorna o objeto `Characters` correspondente ao `indexPath` fornecido. Ele permite que a célula acesse os dados necessários para exibir a imagem do personagem.
5. **`sizeForItem`**: Este método calcula o tamanho de cada célula da `UICollectionView` com base na largura disponível e no número de colunas desejadas. A lógica leva em consideração um espaçamento (padding) entre as células.

### Observações:

- A lógica do método `sizeForItem` é uma abordagem comum para garantir que as células sejam dimensionadas corretamente em um layout de grade. O cálculo de `availableWidth` deve garantir que as células se encaixem bem na tela, considerando o número de colunas.

### CharacterCollectionViewCell

A classe `CharacterCollectionViewCell` é responsável por representar uma célula individual dentro da `UICollectionView` que exibe os personagens. Vamos analisar os principais componentes:

### Principais Componentes:

1. **Identificador**: A constante `identifier` é usada para registrar e dequeuar a célula na `UICollectionView`.
2. **Visualização da Célula**: A célula contém uma instância de `CharacterCellView`, que provavelmente é uma subclasse de `UIView` que gerencia a interface visual específica para a célula do personagem.
3. **Inicializador**: O inicializador padrão chama `settingsView`, onde a célula é configurada para adicionar a visualização (`view`) como subvisualização da `contentView`.
4. **`settingsView`**: Este método configura a visualização da célula, definindo `translatesAutoresizingMaskIntoConstraints` como `false` e adicionando `view` à `contentView`, além de aplicar as constraints (presumivelmente definidas em outro lugar, talvez na classe `CharacterCellView`).
5. **`setupCell`**: Este método é chamado para configurar a célula com os dados do personagem. Ele define a imagem da `characterImageView` dentro da `view`, carregando a imagem a partir do nome fornecido na propriedade `image` do struct `Characters`.

### CharacterCellView

A classe `CharacterCellView` é responsável por definir a interface visual de uma célula de personagem, encapsulando a lógica e a aparência da célula que exibe a imagem do personagem. Vamos analisar os principais componentes:

### Principais Componentes:

1. **View Principal**:
    - A propriedade `view` é um `UIView` que serve como contêiner para a `characterImageView`. Ela tem um fundo transparente, bordas arredondadas, e uma borda cinza.
2. **UIImageView**:
    - A propriedade `characterImageView` é uma `UIImageView` que exibe a imagem do personagem. O `contentMode` está definido como `.scaleAspectFit`, garantindo que a imagem mantenha suas proporções ao ser redimensionada para caber na view.
3. **Inicializador**:
    - O inicializador chama os métodos `addElements` e `settingsConstraints` para adicionar as subvisualizações e definir as constraints.
4. **Métodos de Adição de Elementos e Configuração de Constraints**:
    - `addElements`: Adiciona `view` como subvisualização e, em seguida, adiciona `characterImageView` a `view`.
    - `settingsConstraints`: Define as constraints para que a `view` preencha a `CharacterCellView`, e a `characterImageView` tenha um espaçamento consistente (10 pontos) em relação às bordas da `CharacterCellView`.

## Gerenciamento dos dados através dos métodos setupCell

Vamos analisar detalhadamente o funcionamento do gerenciamento de dados no contexto dos métodos `setupCell`, desde o `ViewModel` até o `View` e os métodos associados. O fluxo principal envolve os seguintes pontos:

### 1. **`HomeVC` e sua Interação com a `UICollectionView`**

- A classe `HomeVC` utiliza uma `UICollectionView`, que é configurada através do método `settingsProtocolsCollectionView` no `HomeView`.
- Quando a `UICollectionView` solicita dados, o método `cellForItemAt` do `UICollectionViewDataSource` é chamado. Neste ponto, a célula `CardCharacterCollectionViewCell` é dequeued e seu método `setupCell(data:)` é chamado.
- O `setupCell` da célula é responsável por configurar o ViewModel (`CardCharacterCellViewModel`) com uma lista de dados (`Characters`), que será utilizada internamente para gerenciar a exibição das imagens dos personagens.

### 2. **Método `setupCell` em `CardCharacterCollectionViewCell`**

- O método `setupCell(data:)` recebe um array de `Characters` como parâmetro. Esse array contém os dados de todos os personagens (imagens) que precisam ser exibidos.
- Dentro de `setupCell`, o `CardCharacterCellViewModel` é instanciado com esses dados. O ViewModel atua como um intermediário entre os dados e a interface, organizando e fornecendo os dados de forma estruturada para a célula interna.
- Após configurar o ViewModel, a `UICollectionView` interna é ativada para exibir a lista de personagens dentro da célula.

### 3. **Métodos do `UICollectionView` Interno**

- Dentro da célula `CardCharacterCollectionViewCell`, uma `UICollectionView` é criada para exibir cada personagem individualmente.
- O método `numberOfItemsInSection` acessa a propriedade `numberOfItems` do ViewModel, que retorna a contagem dos itens (o número de personagens na lista).
- O método `cellForItemAt` dequeues uma célula do tipo `CharacterCollectionViewCell` para cada item e chama seu método `setupCell(data:)`.

### 4. **Método `setupCell` em `CharacterCollectionViewCell`**

- O método `setupCell(data:)` em `CharacterCollectionViewCell` recebe um objeto `Characters` específico para aquela célula (correspondente ao personagem atual).
- Ele usa os dados de `Characters` (a imagem) para configurar a `characterImageView` dentro da célula. A imagem é carregada usando o nome da imagem armazenado no `struct Characters`.

### 5. **ViewModel `CardCharacterCellViewModel`**

- O ViewModel é responsável por organizar os dados dos personagens. Ele armazena uma lista de `Characters` e expõe métodos como:
    - `numberOfItems`: Retorna o número total de personagens (ou seja, o número de células a serem exibidas).
    - `loadCurrentData(indexPath:)`: Retorna o personagem específico para uma célula com base no `indexPath` fornecido, permitindo que a célula exiba os dados corretos.
    - `sizeForItem(collectionViewWidth:columns:)`: Calcula o tamanho adequado para cada célula dentro da `UICollectionView`, ajustando a largura da célula com base no número de colunas.

### 6. **Fluxo Geral de Dados**

- **Inicialização dos Dados**: Os dados dos personagens (imagens) são fornecidos no `HomeViewModel` como um array de `Characters`.
- **ViewModel como Intermediário**: Quando `setupCell(data:)` é chamado na célula principal (`CardCharacterCollectionViewCell`), ele instancia um ViewModel (`CardCharacterCellViewModel`) que gerencia a lista de personagens e calcula o tamanho de cada célula.
- **Configuração das Subcélulas**: Cada célula interna (`CharacterCollectionViewCell`) também tem um método `setupCell(data:)`, que recebe o objeto `Characters` para exibir a imagem correta do personagem.

### Resumo da Integração

1. **`HomeVC`**:
    - Configura a `UICollectionView` e injeta os dados no método `setupCell` da célula principal `CardCharacterCollectionViewCell`.
2. **`CardCharacterCollectionViewCell`**:
    - Configura um ViewModel com os dados (personagens).
    - Passa os dados para a `UICollectionView` interna.
    - Chama o método `setupCell(data:)` nas células internas para exibir os personagens.
3. **`CharacterCollectionViewCell`**:
    - Recebe um objeto `Characters` e usa os dados (a imagem) para configurar a exibição do personagem.

O gerenciamento de dados gira em torno dos métodos `setupCell`, que são responsáveis por passar os dados entre os modelos (ViewModel) e as views (UICollectionViewCells). O ViewModel atua como o intermediário que fornece os dados corretos para as views e gerencia a lógica de layout.
