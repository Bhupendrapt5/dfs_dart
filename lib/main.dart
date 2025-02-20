import 'package:flutter/material.dart';
import 'package:flutter_dfs_poc/node_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: NodeRendering(
              node: Node(
                title: 'Parent',
                children: nodes,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NodeRendering extends StatefulWidget {
  final Node node;
  final Node? parent;
  const NodeRendering({super.key, required this.node, this.parent});

  @override
  State<NodeRendering> createState() => _NodeRenderingState();
}

class _NodeRenderingState extends State<NodeRendering> {
  void _checkAllChildren(bool val, Node node) {
    // widget.node.check(val);

    for (final node in node.children) {
      // node.check(val);
      node.checked = val;
      _checkAllChildren(val, node);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              value: widget.node.checked,
              onChanged: (val) {
                widget.node.checked = val ?? false;
                _checkAllChildren(val ?? false, widget.node);
                setState(() {});
              },
            ),
            Text(widget.node.title),
          ],
        ),
        if (widget.node.children.isNotEmpty)
          ...widget.node.children.map(
            (child) => Padding(
              padding: const EdgeInsets.only(left: 30),
              child: NodeRendering(
                node: child,
                parent: widget.node,
              ),
            ),
          )
      ],
    );
  }
}
