//Check1
//sub-Check1
//sub-check2
//Check2
//sub-check1
//Check3

class Node {
  final String title;
  bool checked;
  final List<Node> children;

  Node({
    required this.title,
    this.checked = false,
    this.children = const [],
  });

  @override
  String toString() =>
      'Node(title: $title, checked: $checked, children: $children)';

  Node check(bool checkValue) {
    return Node(
      title: title,
      checked: checkValue,
      children: children,
    );
  }
}

List<Node> nodes = [
  Node(
    title: 'Check1',
    children: [
      Node(title: 'sub-Check1'),
      Node(title: 'sub-check2'),
    ],
  ),
  Node(
    title: 'Check2',
    children: [
      Node(title: 'sub-check1'),
      Node(title: 'sub-check2'),
      Node(title: 'sub-check3'),
    ],
  ),
  Node(title: 'Check3'),
];
