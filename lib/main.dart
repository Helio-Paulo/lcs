import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // // ALTERAÇÃO: Adicionado para formatar datas e moedas

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey, useMaterial3: true),
      home: const EstoqueScreen(),
    );
  }
}

class EstoqueScreen extends StatefulWidget {
  const EstoqueScreen({super.key});
  @override
  State<EstoqueScreen> createState() => _EstoqueScreenState();
}

class _EstoqueScreenState extends State<EstoqueScreen> {
  // // ALTERAÇÃO: Estrutura da lista atualizada com novos campos financeiros
  // // ALTERAÇÃO: Lista ampliada com Monitor, Bomba de Infusão, Eletrônicos e Sensores
  final List<Map<String, dynamic>> _todosProdutos = [
    // --- VENTILADORES (Já existentes) ---
    {'nome': 'Ventilador mecânico Placa mãe', 'LCS': 1, 'filial': 1, 'dataCompra': '10/01/2026', 'custo': 1200.0, 'margem': 40.0, 'venda': 1680.0},
    {'nome': 'Ventilador mecânico Placa de controle', 'LCS': 1, 'filial': 0, 'dataCompra': '15/01/2026', 'custo': 850.0, 'margem': 35.0, 'venda': 1147.5},
    {'nome': 'Ventilador mecânico Placa da Fonte', 'LCS': 1, 'filial': 0, 'dataCompra': '15/01/2026', 'custo': 850.0, 'margem': 35.0, 'venda': 1147.5},
    {'nome': 'Ventilador mecânico Fonte Chaveada', 'LCS': 0, 'filial': 1, 'dataCompra': '15/01/2026', 'custo': 850.0, 'margem': 35.0, 'venda': 1147.5},
    {'nome': 'Ventilador mecânico display LCD/Touchscreen', 'LCS': 1, 'filial': 0, 'dataCompra': '15/01/2026', 'custo': 850.0, 'margem': 35.0, 'venda': 1147.5},
    {'nome': 'Ventilador mecânico sensor de Fluxo', 'LCS': 1, 'filial': 0, 'dataCompra': '15/01/2026', 'custo': 850.0, 'margem': 35.0, 'venda': 1147.5},
    {'nome': 'Ventilador mecânico Sensor de Pressão', 'LCS': 1, 'filial': 0, 'dataCompra': '15/01/2026', 'custo': 850.0, 'margem': 35.0, 'venda': 1147.5},
    {'nome': 'Ventilador mecânico Sensor de Oxigênio (O2)', 'LCS': 1, 'filial': 0, 'dataCompra': '15/01/2026', 'custo': 850.0, 'margem': 35.0, 'venda': 1147.5},
    {'nome': 'Ventilador mecânico Válvula Solenoide', 'LCS': 1, 'filial': 0, 'dataCompra': '15/01/2026', 'custo': 850.0, 'margem': 35.0, 'venda': 1147.5},
    {'nome': 'Ventilador mecânico Turbina/Compressor', 'LCS': 1, 'filial': 0, 'dataCompra': '15/01/2026', 'custo': 850.0, 'margem': 35.0, 'venda': 1147.5},
    {'nome': 'Ventilador mecânico Bateria Interna', 'LCS': 1, 'filial': 0, 'dataCompra': '15/01/2026', 'custo': 850.0, 'margem': 35.0, 'venda': 1147.5},
    {'nome': 'Ventilador mecânico Módulo de Alarme', 'LCS': 1, 'filial': 0, 'dataCompra': '15/01/2026', 'custo': 850.0, 'margem': 35.0, 'venda': 1147.5},
    {'nome': 'Ventilador mecânico Filtro Bacteriano', 'LCS': 1, 'filial': 0, 'dataCompra': '15/01/2026', 'custo': 850.0, 'margem': 35.0, 'venda': 1147.5},
    {'nome': 'Ventilador mecânico Circuito Respiratório', 'LCS': 1, 'filial': 0, 'dataCompra': '15/01/2026', 'custo': 850.0, 'margem': 35.0, 'venda': 1147.5},

    // --- MONITOR MULTIPARAMÉTRICO ---
    {'nome': 'Monitor: Placa principal (CPU board)', 'LCS': 1, 'filial': 1, 'dataCompra': '13/02/2026', 'custo': 1500.0, 'margem': 30.0, 'venda': 1950.0},
    {'nome': 'Monitor: Placa de aquisição de sinais', 'LCS': 2, 'filial': 1, 'dataCompra': '13/02/2026', 'custo': 900.0, 'margem': 35.0, 'venda': 1215.0},
    {'nome': 'Monitor: Módulo de ECG', 'LCS': 3, 'filial': 2, 'dataCompra': '10/02/2026', 'custo': 450.0, 'margem': 50.0, 'venda': 675.0},
    {'nome': 'Monitor: Módulo de SpO2', 'LCS': 2, 'filial': 2, 'dataCompra': '10/02/2026', 'custo': 400.0, 'margem': 50.0, 'venda': 600.0},
    {'nome': 'Monitor: Módulo de PNI (pressão não invasiva)', 'LCS': 1, 'filial': 1, 'dataCompra': '05/02/2026', 'custo': 600.0, 'margem': 40.0, 'venda': 840.0},
    {'nome': 'Monitor: Módulo de pressão invasiva', 'LCS': 1, 'filial': 0, 'dataCompra': '05/02/2026', 'custo': 750.0, 'margem': 40.0, 'venda': 1050.0},
    {'nome': 'Monitor: Módulo de capnografia (EtCO2)', 'LCS': 1, 'filial': 1, 'dataCompra': '01/02/2026', 'custo': 2200.0, 'margem': 25.0, 'venda': 2750.0},
    {'nome': 'Monitor: Fonte de alimentação', 'LCS': 2, 'filial': 2, 'dataCompra': '12/02/2026', 'custo': 350.0, 'margem': 60.0, 'venda': 560.0},
    {'nome': 'Monitor: Tela LCD', 'LCS': 1, 'filial': 1, 'dataCompra': '10/02/2026', 'custo': 800.0, 'margem': 40.0, 'venda': 1120.0},
    {'nome': 'Monitor: Conectores e portas (USB, RJ45)', 'LCS': 10, 'filial': 5, 'dataCompra': '01/02/2026', 'custo': 45.0, 'margem': 100.0, 'venda': 90.0},
    {'nome': 'Monitor: Bateria recarregável', 'LCS': 4, 'filial': 3, 'dataCompra': '12/02/2026', 'custo': 280.0, 'margem': 70.0, 'venda': 476.0},

    // --- BOMBA DE INFUSÃO ---
    {'nome': 'Bomba de Infusão: Placa de controle', 'LCS': 2, 'filial': 1, 'dataCompra': '13/02/2026', 'custo': 700.0, 'margem': 40.0, 'venda': 980.0},
    {'nome': 'Bomba de Infusão: Motor de passo', 'LCS': 2, 'filial': 2, 'dataCompra': '10/02/2026', 'custo': 350.0, 'margem': 50.0, 'venda': 525.0},
    {'nome': 'Bomba de Infusão: Sensor de bolha de ar', 'LCS': 5, 'filial': 3, 'dataCompra': '05/02/2026', 'custo': 120.0, 'margem': 80.0, 'venda': 216.0},
    {'nome': 'Bomba de Infusão: Sensor de oclusão', 'LCS': 3, 'filial': 2, 'dataCompra': '05/02/2026', 'custo': 130.0, 'margem': 80.0, 'venda': 234.0},
    {'nome': 'Bomba de Infusão: Display', 'LCS': 2, 'filial': 1, 'dataCompra': '01/02/2026', 'custo': 250.0, 'margem': 60.0, 'venda': 400.0},
    {'nome': 'Bomba de Infusão: Teclado membrana', 'LCS': 10, 'filial': 5, 'dataCompra': '13/02/2026', 'custo': 60.0, 'margem': 100.0, 'venda': 120.0},
    {'nome': 'Bomba de Infusão: Fonte de alimentação', 'LCS': 2, 'filial': 2, 'dataCompra': '10/02/2026', 'custo': 220.0, 'margem': 60.0, 'venda': 352.0},
    {'nome': 'Bomba de Infusão: Bateria', 'LCS': 5, 'filial': 4, 'dataCompra': '12/02/2026', 'custo': 180.0, 'margem': 70.0, 'venda': 306.0},
    {'nome': 'Bomba de Infusão: Mecanismo de tração', 'LCS': 1, 'filial': 1, 'dataCompra': '01/02/2026', 'custo': 450.0, 'margem': 40.0, 'venda': 630.0},

    // --- COMPONENTES ELETRÔNICOS ---
    {'nome': 'Eletrônico: Microcontrolador', 'LCS': 15, 'filial': 10, 'dataCompra': '13/02/2026', 'custo': 85.0, 'margem': 120.0, 'venda': 187.0},
    {'nome': 'Eletrônico: Processador (CPU)', 'LCS': 5, 'filial': 2, 'dataCompra': '10/02/2026', 'custo': 320.0, 'margem': 50.0, 'venda': 480.0},
    {'nome': 'Eletrônico: Memória RAM', 'LCS': 8, 'filial': 4, 'dataCompra': '10/02/2026', 'custo': 120.0, 'margem': 60.0, 'venda': 192.0},
    {'nome': 'Eletrônico: Memória Flash', 'LCS': 10, 'filial': 5, 'dataCompra': '10/02/2026', 'custo': 45.0, 'margem': 100.0, 'venda': 90.0},
    {'nome': 'Eletrônico: Capacitores (Kit)', 'LCS': 50, 'filial': 30, 'dataCompra': '01/02/2026', 'custo': 2.0, 'margem': 300.0, 'venda': 8.0},
    {'nome': 'Eletrônico: Resistores (Kit)', 'LCS': 100, 'filial': 50, 'dataCompra': '01/02/2026', 'custo': 0.5, 'margem': 500.0, 'venda': 3.0},
    {'nome': 'Eletrônico: Transistores', 'LCS': 40, 'filial': 20, 'dataCompra': '01/02/2026', 'custo': 5.0, 'margem': 200.0, 'venda': 15.0},
    {'nome': 'Eletrônico: Relés', 'LCS': 12, 'filial': 8, 'dataCompra': '05/02/2026', 'custo': 15.0, 'margem': 150.0, 'venda': 37.5},
    {'nome': 'Eletrônico: Transformadores', 'LCS': 4, 'filial': 2, 'dataCompra': '05/02/2026', 'custo': 180.0, 'margem': 60.0, 'venda': 288.0},
    {'nome': 'Eletrônico: Reguladores de tensão', 'LCS': 20, 'filial': 15, 'dataCompra': '08/02/2026', 'custo': 12.0, 'margem': 150.0, 'venda': 30.0},
    {'nome': 'Eletrônico: Conversores DC-DC', 'LCS': 10, 'filial': 5, 'dataCompra': '08/02/2026', 'custo': 65.0, 'margem': 100.0, 'venda': 130.0},
    {'nome': 'Eletrônico: Drivers de motor', 'LCS': 6, 'filial': 3, 'dataCompra': '10/02/2026', 'custo': 95.0, 'margem': 80.0, 'venda': 171.0},
    {'nome': 'Eletrônico: Circuitos integrados (CI)', 'LCS': 25, 'filial': 15, 'dataCompra': '10/02/2026', 'custo': 35.0, 'margem': 120.0, 'venda': 77.0},

    // --- SENSORES GERAIS ---
    {'nome': 'Sensor: Pressão', 'LCS': 8, 'filial': 4, 'dataCompra': '13/02/2026', 'custo': 140.0, 'margem': 70.0, 'venda': 238.0},
    {'nome': 'Sensor: Fluxo', 'LCS': 5, 'filial': 3, 'dataCompra': '13/02/2026', 'custo': 280.0, 'margem': 60.0, 'venda': 448.0},
    {'nome': 'Sensor: Temperatura', 'LCS': 12, 'filial': 10, 'dataCompra': '10/02/2026', 'custo': 45.0, 'margem': 100.0, 'venda': 90.0},
    {'nome': 'Sensor: Oxigênio', 'LCS': 6, 'filial': 4, 'dataCompra': '10/02/2026', 'custo': 550.0, 'margem': 40.0, 'venda': 770.0},
    {'nome': 'Sensor: CO2', 'LCS': 3, 'filial': 1, 'dataCompra': '05/02/2026', 'custo': 800.0, 'margem': 40.0, 'venda': 1120.0},
    {'nome': 'Sensor: Saturação (SpO2)', 'LCS': 15, 'filial': 10, 'dataCompra': '05/02/2026', 'custo': 120.0, 'margem': 100.0, 'venda': 240.0},
    {'nome': 'Sensor: Nível', 'LCS': 5, 'filial': 2, 'dataCompra': '01/02/2026', 'custo': 90.0, 'margem': 80.0, 'venda': 162.0},
    {'nome': 'Sensor: Óptico', 'LCS': 8, 'filial': 4, 'dataCompra': '01/02/2026', 'custo': 75.0, 'margem': 90.0, 'venda': 142.5},

    // --- PEÇAS EXTERNAS ---
    {'nome': 'Externa: Cabos de ECG', 'LCS': 20, 'filial': 15, 'dataCompra': '13/02/2026', 'custo': 85.0, 'margem': 100.0, 'venda': 170.0},
    {'nome': 'Externa: Cabo de SpO2', 'LCS': 25, 'filial': 20, 'dataCompra': '13/02/2026', 'custo': 95.0, 'margem': 100.0, 'venda': 190.0},
    {'nome': 'Externa: Manguito de pressão', 'LCS': 15, 'filial': 10, 'dataCompra': '10/02/2026', 'custo': 65.0, 'margem': 120.0, 'venda': 143.0},
    {'nome': 'Externa: Cabo de alimentação', 'LCS': 30, 'filial': 20, 'dataCompra': '10/02/2026', 'custo': 25.0, 'margem': 150.0, 'venda': 62.5},
    {'nome': 'Externa: Conectores hospitalares', 'LCS': 50, 'filial': 40, 'dataCompra': '01/02/2026', 'custo': 15.0, 'margem': 200.0, 'venda': 45.0},
    {'nome': 'Externa: Rodízios (Unidade)', 'LCS': 12, 'filial': 8, 'dataCompra': '01/02/2026', 'custo': 45.0, 'margem': 80.0, 'venda': 81.0},
    {'nome': 'Externa: Suportes metálicos', 'LCS': 5, 'filial': 3, 'dataCompra': '01/02/2026', 'custo': 250.0, 'margem': 60.0, 'venda': 400.0},
    {'nome': 'Externa: Carcaça plástica hospitalar', 'LCS': 2, 'filial': 1, 'dataCompra': '01/02/2026', 'custo': 600.0, 'margem': 50.0, 'venda': 900.0},
  ];

  

  String _removerAcentos(String texto) {
    var comAcento = 'ÀÁÂÃÄÅàáâãäåÈÉÊËèéêëÌÍÎÏìíîïÒÓÔÕÖØòóôõöøÙÚÛÜùúûüÇçÑñ';
    var semAcento = 'AAAAAAaaaaaaEEEEeeeeIIIIiiiiOOOOOOooooooUUUUuuuuCcNn';
    String str = texto;
    for (int i = 0; i < comAcento.length; i++) {
      str = str.replaceAll(comAcento[i], semAcento[i]);
    }
    return str.toLowerCase();
  }

  List<Map<String, dynamic>> _produtosExibidos = [];

  @override
  void initState() {
    _produtosExibidos = _todosProdutos;
    super.initState();
  }

  void _filtrarProdutos(String query) {
    setState(() {
      _produtosExibidos = _todosProdutos.where((p) {
        final nomeProduto = _removerAcentos(p['nome']);
        final buscaUsuario = _removerAcentos(query);
        return nomeProduto.contains(buscaUsuario);
      }).toList();
    });
  }

  // // ALTERAÇÃO: Função para mostrar detalhes ao clicar no produto
  void _mostrarDetalhes(Map<String, dynamic> p) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(p['nome']),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('📅 Data Compra: ${p['dataCompra']}'),
            Text('💰 Custo: R\$ ${p['custo'].toStringAsFixed(2)}'),
            Text('📈 Margem: ${p['margem']}%'),
            const Divider(),
            Text('💵 VALOR DE VENDA: R\$ ${p['venda'].toStringAsFixed(2)}', 
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey)),
          ],
        ),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Fechar'))],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estoque LCS'),
        backgroundColor: Colors.blueGrey[800],
        foregroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (value) => _filtrarProdutos(value),
              decoration: InputDecoration(
                hintText: 'Buscar peça (Ex: placa, válvula)...',
                prefixIcon: const Icon(Icons.search),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _produtosExibidos.length + 1,
        itemBuilder: (context, index) {
          if (index == _produtosExibidos.length) return const SizedBox(height: 80);

          final p = _produtosExibidos[index];
          final Color corFundo = index % 2 == 0 ? Colors.blue[200]! : Colors.blue[400]!;

          return Card(
            color: corFundo,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: ListTile(
              onTap: () => _mostrarDetalhes(p), // // ALTERAÇÃO: Clique para ver detalhes financeiros
              title: Text(p['nome'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _infoEstoque('LCS', p['LCS'], Colors.white),
                  _infoEstoque('FILIAL', p['filial'], Colors.white),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blueGrey[800],
        foregroundColor: Colors.white,
        onPressed: () async {
          final resultado = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CadastroProdutoScreen()),
          );
          if (resultado != null) {
            setState(() {
              _todosProdutos.add(resultado);
              _produtosExibidos = List.from(_todosProdutos);
            });
          }
        },
        icon: const Icon(Icons.add),
        label: const Text("Novo Produto"),
      ),
    );
  }

  Widget _infoEstoque(String label, int qtd, Color cor) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
        Text('$qtd un', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: cor)),
      ],
    );
  }
}

// // ALTERAÇÃO: Tela de cadastro totalmente reformulada conforme seus pedidos
class CadastroProdutoScreen extends StatefulWidget {
  const CadastroProdutoScreen({super.key});
  @override
  State<CadastroProdutoScreen> createState() => _CadastroProdutoScreenState();
}

class _CadastroProdutoScreenState extends State<CadastroProdutoScreen> {
  final _nomeController = TextEditingController();
  final _lcsController = TextEditingController();
  final _filialController = TextEditingController();
  final _custoController = TextEditingController();
  final _margemController = TextEditingController();
  DateTime _dataSelecionada = DateTime.now();

  // // ALTERAÇÃO: Função para abrir o calendário
  Future<void> _selecionarData(BuildContext context) async {
    final DateTime? colhida = await showDatePicker(
      context: context,
      initialDate: _dataSelecionada,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (colhida != null) setState(() => _dataSelecionada = colhida);
  }

  void _salvar() {
    if (_nomeController.text.isEmpty) return;
    
    double custo = double.tryParse(_custoController.text) ?? 0;
    double margem = double.tryParse(_margemController.text) ?? 0;
    // // ALTERAÇÃO: Cálculo automático do preço de venda
    double venda = custo + (custo * (margem / 100));

    final novo = {
      'nome': _nomeController.text,
      'LCS': int.tryParse(_lcsController.text) ?? 0,
      'filial': int.tryParse(_filialController.text) ?? 0,
      'dataCompra': DateFormat('dd/MM/yyyy').format(_dataSelecionada),
      'custo': custo,
      'margem': margem,
      'venda': venda,
    };
    Navigator.pop(context, novo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastrar Peça')),
      body: SingleChildScrollView( // // ALTERAÇÃO: Adicionado para não dar erro de tela pequena com teclado
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // // ALTERAÇÃO: Calendário primeiro
            ListTile(
              title: Text("Data da Compra: ${DateFormat('dd/MM/yyyy').format(_dataSelecionada)}"),
              trailing: const Icon(Icons.calendar_today),
              onTap: () => _selecionarData(context),
            ),
            const SizedBox(height: 10),
            TextField(controller: _nomeController, decoration: const InputDecoration(labelText: 'Nome da Peça')),
            const SizedBox(height: 10),
            // // ALTERAÇÃO: Lógica de pular (se quiser 0 na LCS, é só digitar a próxima)
            TextField(
              controller: _lcsController, 
              keyboardType: TextInputType.number, 
              decoration: const InputDecoration(labelText: 'Quantidade LCS (0 para pular)'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _filialController, 
              keyboardType: TextInputType.number, 
              decoration: const InputDecoration(labelText: 'Quantidade Filial'),
            ),
            const SizedBox(height: 10),
            // // ALTERAÇÃO: Novos campos financeiros
            TextField(
              controller: _custoController, 
              keyboardType: TextInputType.number, 
              decoration: const InputDecoration(labelText: 'Valor de Custo (R\$)', prefixText: 'R\$ '),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _margemController, 
              keyboardType: TextInputType.number, 
              decoration: const InputDecoration(labelText: 'Margem de Venda (%)', suffixText: '%'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _salvar,
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
              child: const Text('SALVAR NO ESTOQUE'),
            )
          ],
        ),
      ),
    );
  }
}
