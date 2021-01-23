class Req {
  final int id;
  String name;
  String addr;
  String desc;
  String method;
  Map params;

  Req(this.id, this.name, this.addr, this.method, {this.params, this.desc});
}

class Collection {
  final int id;
  String name;
  String desc;
  Map params;
  List<Req> children;
  bool run;
  bool expand;

  // children 默认初始化
  Collection(
    this.id,
    this.name, {
    this.run = false,
    this.desc,
    this.params,
    this.children = const <Req>[],
    this.expand = false,
  });
}

final List<Collection> data = <Collection>[
  Collection(1, "ops1", children: <Req>[
    Req(1, '北京', "http://www.baidu.com", 'get', desc: '北京'),
    Req(2, '上海', "http://www.baidu.com", 'get', desc: '上海'),
    Req(3, '重庆', "http://www.baidu.com", 'get', desc: '重庆'),
    Req(4, '天津', "http://www.baidu.com", 'get', desc: '天津'),
  ]),
  Collection(2, "自治区", children: <Req>[
    Req(1, '新疆', "http://www.baidu.com", 'get', desc: '新疆'),
    Req(2, '西藏', "http://www.baidu.com", 'get', desc: '西藏'),
    Req(3, '广西', "http://www.baidu.com", 'get', desc: '广西'),
    Req(4, '宁夏', "http://www.baidu.com", 'get', desc: '宁夏'),
    Req(4, '内蒙古', "http://www.baidu.com", 'get', desc: '内蒙古'),
  ]),
  Collection(3, "省级行政单位", children: <Req>[
    Req(1, '黑龙江', "http://www.baidu.com", 'get', desc: '黑龙江'),
    Req(2, '哈尔滨', "http://www.baidu.com", 'get', desc: '哈尔滨'),
    Req(3, '哈尔滨', "http://www.baidu.com", 'get', desc: '哈尔滨'),
    Req(4, '哈尔滨', "http://www.baidu.com", 'get', desc: '哈尔滨'),
    Req(5, '哈尔滨', "http://www.baidu.com", 'get', desc: '哈尔滨'),
    Req(6, '哈尔滨', "http://www.baidu.com", 'get', desc: '哈尔滨'),
    Req(7, '哈尔滨', "http://www.baidu.com", 'get', desc: '哈尔滨'),
    Req(8, '哈尔滨', "http://www.baidu.com", 'get', desc: '哈尔滨'),
    Req(9, '哈尔滨', "http://www.baidu.com", 'get', desc: '哈尔滨'),
  ]),
  Collection(4, "省级行政单位", children: <Req>[
    Req(1, '黑龙江', "http://www.baidu.com", 'get', desc: '黑龙江'),
    Req(2, '哈尔滨', "http://www.baidu.com", 'get', desc: '哈尔滨'),
    Req(3, '哈尔滨', "http://www.baidu.com", 'get', desc: '哈尔滨'),
    Req(4, '哈尔滨', "http://www.baidu.com", 'get', desc: '哈尔滨'),
    Req(5, '哈尔滨', "http://www.baidu.com", 'get', desc: '哈尔滨'),
    Req(6, '哈尔滨', "http://www.baidu.com", 'get', desc: '哈尔滨'),
    Req(7, '哈尔滨', "http://www.baidu.com", 'get', desc: '哈尔滨'),
    Req(8, '哈尔滨', "http://www.baidu.com", 'get', desc: '哈尔滨'),
    Req(9, '哈尔滨', "http://www.baidu.com", 'get', desc: '哈尔滨'),
  ]),
  Collection(5, "省级行政单位", children: <Req>[
    Req(1, '黑龙江', "http://www.baidu.com", 'get', desc: '黑龙江'),
    Req(2, '哈尔滨', "http://www.baidu.com", 'get', desc: '哈尔滨'),
    Req(3, '哈尔滨', "http://www.baidu.com", 'get', desc: '哈尔滨'),
    Req(4, '哈尔滨', "http://www.baidu.com", 'get', desc: '哈尔滨'),
    Req(5, '哈尔滨', "http://www.baidu.com", 'get', desc: '哈尔滨'),
    Req(6, '哈尔滨', "http://www.baidu.com", 'get', desc: '哈尔滨'),
    Req(7, '哈尔滨', "http://www.baidu.com", 'get', desc: '哈尔滨'),
    Req(8, '哈尔滨', "http://www.baidu.com", 'get', desc: '哈尔滨'),
    Req(9, '哈尔滨', "http://www.baidu.com", 'get', desc: '哈尔滨'),
  ]),
  Collection(6, "省级行政单位", children: <Req>[
    Req(1, '黑龙江', "http://www.baidu.com", 'get', desc: '黑龙江'),
    Req(2, '哈尔滨', "http://www.baidu.com", 'get', desc: '哈尔滨'),
    Req(3, '哈尔滨', "http://www.baidu.com", 'get', desc: '哈尔滨'),
    Req(4, '哈尔滨', "http://www.baidu.com", 'get', desc: '哈尔滨'),
    Req(5, '哈尔滨', "http://www.baidu.com", 'get', desc: '哈尔滨'),
    Req(6, '哈尔滨', "http://www.baidu.com", 'get', desc: '哈尔滨'),
    Req(7, '哈尔滨', "http://www.baidu.com", 'get', desc: '哈尔滨'),
    Req(8, '哈尔滨', "http://www.baidu.com", 'get', desc: '哈尔滨'),
    Req(9, '哈尔滨', "http://www.baidu.com", 'get', desc: '哈尔滨'),
  ]),
];
