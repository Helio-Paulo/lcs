import 'package:flutter/material.dart';

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
  final List<Map<String, dynamic>> _todosProdutos = [
    {'nome': 'Ventilador mecânico Placa mãe', 'LCS': 1, 'filial': 1},
    {'nome': 'Ventilador mecânico Placa de controle', 'LCS': 1, 'filial': 0},
    {'nome': 'Ventilador mecânico Placa de fonte', 'LCS': 1, 'filial': 1},
    {'nome': 'Ventilador mecânico Fonte Chaveada', 'LCS': 1, 'filial': 1},
    {'nome': 'Ventilador mecânico Display LCD/Touchscreen', 'LCS': 1, 'filial': 0},
    {'nome': 'Ventilador mecânico Sensor de fluxo', 'LCS': 0, 'filial': 1},
    {'nome': 'Ventilador mecânico Sensor de Pressão', 'LCS': 1, 'filial': 1},
    {'nome': 'Ventilador mecânico Sensor de Oxigênio (O2)', 'LCS': 1, 'filial': 1},
    {'nome': 'Ventilador mecânico Válvula Proporcional', 'LCS': 1, 'filial': 1},
    {'nome': 'Ventilador mecânico Válvula Solenoide', 'LCS': 1, 'filial': 1},
    {'nome': 'Ventilador mecânico Turbina/Compressor', 'LCS': 1, 'filial': 1},
    {'nome': 'Ventilador mecânico Bateria Interna', 'LCS': 1, 'filial': 1},
    {'nome': 'Ventilador mecânico Módulo de Alarme', 'LCS': 1, 'filial': 1},
    {'nome': 'Ventilador mecânico Filtro Bacteriano', 'LCS': 1, 'filial': 1},
    {'nome': 'Ventilador mecânico Circuito Respiratório', 'LCS': 1, 'filial': 1},
  ];

  // Função de busca que ignora acentos e maiúsculas
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
          final Color corFundo = index % 2 == 0 ? Colors.orange[100]! : Colors.yellow[100]!;

          return Card(
            color: corFundo,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: ListTile(
              title: Text(p['nome'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _infoEstoque('LCS', p['LCS'], Colors.blue[900]!),
                  _infoEstoque('FILIAL', p['filial'], Colors.green[900]!),
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
        Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green)),
        Text('$qtd un', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: cor)),
      ],
    );
  }
}

class CadastroProdutoScreen extends StatefulWidget {
  const CadastroProdutoScreen({super.key});
  @override
  State<CadastroProdutoScreen> createState() => _CadastroProdutoScreenState();
}

class _CadastroProdutoScreenState extends State<CadastroProdutoScreen> {
  final _nomeController = TextEditingController();
  final _lcsController = TextEditingController();
  final _filialController = TextEditingController();

  void _salvar() {
    if (_nomeController.text.isEmpty) return;
    final novo = {
      'nome': _nomeController.text,
      'LCS': int.tryParse(_lcsController.text) ?? 0,
      'filial': int.tryParse(_filialController.text) ?? 0,
    };
    Navigator.pop(context, novo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Peça'),
        backgroundColor: Colors.blueGrey[800],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome da Peça'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _lcsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Quantidade LCS'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _filialController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Quantidade Filial'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _salvar,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: Colors.blueGrey[800],
                foregroundColor: Colors.white,
              ),
              child: const Text('SALVAR NO ESTOQUE'),
            )
          ],
        ),
      ),
    );
  }
}

